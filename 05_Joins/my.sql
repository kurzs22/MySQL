-- 05 - Joins

-- mysql -u kurzs -p

USE wild;
-- USE wild_db_quest;

ALTER TABLE wizard DROP COLUMN birthday;
ALTER TABLE wizard DROP COLUMN birth_place;
ALTER TABLE wizard DROP COLUMN biography;

CREATE TABLE `team` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(80) NOT NULL,
  PRIMARY KEY (`id`)
);

CREATE TABLE `player` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `wizard_id` INT NOT NULL,
  `team_id` INT NOT NULL,
  `role` VARCHAR(50) NULL,
  `enrollment_date` DATE NULL,
  PRIMARY KEY (`id`),
  FOREIGN KEY (`wizard_id`) REFERENCES `wizard`(`id`),
  FOREIGN KEY (`team_id`) REFERENCES `team`(`id`)
);

DELETE FROM `wizard`;
DELETE FROM `player`;
DELETE FROM `team`;

SOURCE db5.sql;

SELECT * FROM `wizard`;
SELECT * FROM `player`;
SELECT * FROM `team`;

-- Once the data is properly loaded, write the following queries and post them in a Gist and
-- post a link to the solution for this challenge.

-- 1. Return lastnames, firstnames, each player’s role and team, arranged in alphabetical order
--    by team, then by role in the team, then by lastname, and finally by firstname.

SELECT wizard.lastname, wizard.firstname, player.role, team.name
FROM wizard
JOIN player ON wizard.id = player.wizard_id
JOIN team ON team.id = player.team_id
ORDER BY team.name, player.role, wizard.lastname, wizard.firstname;

/* Output:

+-----------------+-------------+--------+------------+
| lastname        | firstname   | role   | name       |
+-----------------+-------------+--------+------------+
| Black           | Sirius      | beater | Gryffindor |
| Brown           | Lavender    | beater | Gryffindor |
| Finnigan        | Seamus      | beater | Gryffindor |
| Hagrid          | Rubeus      | beater | Gryffindor |
| Longbottom      | Alice       | beater | Gryffindor |
| McGonagall      | Minerva     | beater | Gryffindor |
| Potter          | Harry       | beater | Gryffindor |
| Potter          | James       | beater | Gryffindor |
| Thomas          | Dean        | beater | Gryffindor |
| Weasley         | Arthur      | beater | Gryffindor |
| Weasley         | Percy       | beater | Gryffindor |
| Bell            | Katie       | chaser | Gryffindor |
| Dumbledore      | Albus       | chaser | Gryffindor |
| Granger         | Hermione    | chaser | Gryffindor |
| J.              | Lily        | chaser | Gryffindor |
| Jordan          | Lee         | chaser | Gryffindor |
| Longbottom      | Augusta     | chaser | Gryffindor |
| Longbottom      | Frank       | chaser | Gryffindor |
| Longbottom      | Neville     | chaser | Gryffindor |
| Pettigrew       | Peter       | chaser | Gryffindor |
| Spinnet         | Alicia      | chaser | Gryffindor |
| Weasley         | George      | chaser | Gryffindor |
| Wood            | Oliver      | chaser | Gryffindor |
|                 | Cadogan     | keeper | Gryffindor |
| Creevey         | Dennis      | keeper | Gryffindor |
| de              | Nicholas    | keeper | Gryffindor |
| Dumbledore      | Aberforth   | keeper | Gryffindor |
| Johnson         | Angelina    | keeper | Gryffindor |
| Weasley         | Ginevra     | keeper | Gryffindor |
| Binns           | Cuthbert    | seeker | Gryffindor |
| Creevey         | Colin       | seeker | Gryffindor |
| Gryffindor      | Godric      | seeker | Gryffindor |
| Vane            | Romilda     | seeker | Gryffindor |
| Weasley         | Fred        | seeker | Gryffindor |
| Weasley         | Ronald      | seeker | Gryffindor |
| Weasley         | William     | seeker | Gryffindor |
| Abbott          | Hannah      | beater | Hufflepuff |
| Finch-Fletchley | Justin      | beater | Hufflepuff |
| Friar           | Fat         | beater | Hufflepuff |
| Smith           | Hepzibah    | beater | Hufflepuff |
| Sprout          | Pomona      | beater | Hufflepuff |
| Tonks           | Nymphadora  | beater | Hufflepuff |
| Bones           | Amelia      | chaser | Hufflepuff |
| Scamander       | Newton      | chaser | Hufflepuff |
| Bones           | Susan       | keeper | Hufflepuff |
| Diggory         | Cedric      | keeper | Hufflepuff |
| Smith           | Zacharias   | keeper | Hufflepuff |
| Hufflepuff      | Helga       | seeker | Hufflepuff |
| Clearwater      | Penelope    | beater | Ravenclaw  |
| Quirrell        | Quirinus    | beater | Ravenclaw  |
| Ravenclaw       | Helena      | beater | Ravenclaw  |
| Warren          | Myrtle      | beater | Ravenclaw  |
| Chang           | Cho         | chaser | Ravenclaw  |
| Edgecombe       | Marietta    | chaser | Ravenclaw  |
| Flitwick        | Filius      | chaser | Ravenclaw  |
| Goldstein       | Anthony     | chaser | Ravenclaw  |
| Lockhart        | Gilderoy    | chaser | Ravenclaw  |
| Lovegood        | Luna        | chaser | Ravenclaw  |
| Lovegood        | Xenophilius | chaser | Ravenclaw  |
| Ollivander      | Garrick     | chaser | Ravenclaw  |
| Corner          | Michael     | seeker | Ravenclaw  |
| Ravenclaw       | Rowena      | seeker | Ravenclaw  |
| Trelawney       | Sybill      | seeker | Ravenclaw  |
| Bulstrode       | Millicent   | beater | Slytherin  |
| Crabbe          | Vincent     | beater | Slytherin  |
| Flint           | Marcus      | beater | Slytherin  |
| Parkinson       | Pansy       | beater | Slytherin  |
| Snape           | Severus     | beater | Slytherin  |
| Zabini          | Blaise      | beater | Slytherin  |
| Baron           | Bloody      | chaser | Slytherin  |
| Lestrange       | Bellatrix   | chaser | Slytherin  |
| Lestrange       | Rodolphus   | chaser | Slytherin  |
| Malfoy          | Draco       | chaser | Slytherin  |
| Malfoy          | Lucius      | chaser | Slytherin  |
| Nigellus        | Phineas     | chaser | Slytherin  |
| Nott            | Theodore    | chaser | Slytherin  |
| Riddle          | Tom         | chaser | Slytherin  |
| Tonks           | Andromeda   | chaser | Slytherin  |
| Black           | Regulus     | keeper | Slytherin  |
| Goyle           | Gregory     | seeker | Slytherin  |
| Lestrange       | Rabastan    | seeker | Slytherin  |
| Malfoy          | Narcissa    | seeker | Slytherin  |
| Slytherin       | Salazar     | seeker | Slytherin  |
| Umbridge        | Dolores     | seeker | Slytherin  |
+-----------------+-------------+--------+------------+
84 rows in set (0.01 sec)

*************/


-- 2. Return only the lastnames and firstnames of players who play the role of seeker, sorted
--    by lastname and then firstname in alphabetical order.

SELECT wizard.lastname, wizard.firstname
FROM wizard
JOIN player ON wizard.id = player.wizard_id AND player.role = "seeker"
ORDER BY wizard.lastname, wizard.firstname;

/* Output:

+------------+-----------+
| lastname   | firstname |
+------------+-----------+
| Binns      | Cuthbert  |
| Corner     | Michael   |
| Creevey    | Colin     |
| Goyle      | Gregory   |
| Gryffindor | Godric    |
| Hufflepuff | Helga     |
| Lestrange  | Rabastan  |
| Malfoy     | Narcissa  |
| Ravenclaw  | Rowena    |
| Slytherin  | Salazar   |
| Trelawney  | Sybill    |
| Umbridge   | Dolores   |
| Vane       | Romilda   |
| Weasley    | Fred      |
| Weasley    | Ronald    |
| Weasley    | William   |
+------------+-----------+
16 rows in set (0.00 sec)

*************/


-- 3. Return a list of all of the wizards who do not play quidditch.

SELECT wizard.lastname, wizard.firstname
FROM wizard
LEFT OUTER JOIN player ON wizard.id = player.wizard_id
WHERE player.team_id IS NULL
ORDER BY wizard.lastname, wizard.firstname;

/* Output:

+----------+-----------+
| lastname | firstname |
+----------+-----------+
|          | Crabbe    |
| Boot     | Terry     |
| Lupin    | Remus     |
| Patil    | Padma     |
| Patil    | Parvati   |
| Robins   | Demelza   |
| Slughorn | Horace    |
| Weasley  | Charles   |
| Weasley  | Molly     |
+----------+-----------+
9 rows in set (0.00 sec)

*************/