-- 06 - Advanced SQL

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

-- Write the following queries and post them in a Gist. Post the link to your solution for this challenge.

-- 1. Return the team names and the number of players in each team, all sorted by the number of
--    players in each team, from the highest to the lowest.

SELECT team.name, count(*) AS number_of_players
FROM player
JOIN team ON team.id = player.team_id
GROUP BY team.id
ORDER BY number_of_players DESC;

/* Output:

+------------+-------------------+
| name       | number_of_players |
+------------+-------------------+
| Gryffindor |                36 |
| Slytherin  |                21 |
| Ravenclaw  |                15 |
| Hufflepuff |                12 |
+------------+-------------------+
4 rows in set (0.03 sec)

*************/


-- 2. Return the names of complete teams only (14 players or more, that is to say a minimum of 
--    7 players and 7 substitute players), sorted by alphabetical order.

SELECT team.name
FROM player
JOIN team ON team.id = player.team_id
GROUP BY team.id
HAVING count(*) >= 14
ORDER BY team.name;

/* Output:

+------------+
| name       |
+------------+
| Gryffindor |
| Ravenclaw  |
| Slytherin  |
+------------+
3 rows in set (0.01 sec)

*************/


-- 3. Gryffondor’s trainer is superstitious, his favorite day is Monday. Return a list of players
--    in his team who were enrolled on a Monday (they want them to play first) and sort the results
--    by enrollment date.


SELECT wizard.lastname, wizard.firstname
FROM wizard
JOIN player ON wizard.id = player.wizard_id AND DAYOFWEEK(player.enrollment_date) = 2 -- means Monday
JOIN team ON team.id = player.team_id AND team.name = "Gryffindor"
ORDER BY player.enrollment_date;

/* Output:

+------------+-----------+
| lastname   | firstname |
+------------+-----------+
| Weasley    | George    |
| Longbottom | Alice     |
|            | Cadogan   |
| Gryffindor | Godric    |
| Black      | Sirius    |
| Dumbledore | Aberforth |
| Longbottom | Augusta   |
+------------+-----------+
7 rows in set (0.01 sec)

*************/

-- Gist upload: https://gist.github.com/kurzs22/7fdef42073ff66ddecdf483557d18dcb
