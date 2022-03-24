# 03 - Data handling

# mysql -u kurzs -p

USE `wild_db_quest`;

# Insert the following data into the school table:
INSERT INTO school (name, country, capacity)
VALUES ('Beauxbatons Academy of Magic', 'France', 550),
('Castelobruxo', 'Brazil', 380),
('Durmstrang Institute', 'Norway', 570),
('Hogwarts School of Witchcraft and Wizardry', 'United Kingdom', 450),
('Ilvermorny School of Witchcraft and Wizardry', 'USA', 300),
('Koldovstoretz', 'Russia', 125),
('Mahoutokoro School of Magic', 'Japan', 800),
('Uagadou School of Magic', 'Uganda', 350);

# “Durmstrang Institute” is actually in Sweden (Sweden), so modify its country.
UPDATE school SET country = "Sweden" WHERE name = "Durmstrang Institute";

# “Mahoutokoro School of Magic” should have its pupil capacity reduced to 700.
UPDATE school SET capacity = 700 WHERE name = "Mahoutokoro School of Magic";

# Delete all the schools containing the word “Magic” (there are 3) in their titles
# in a single request. The LIKE keyword may be of help to you.
DELETE FROM school WHERE name LIKE "%Magic%";

# Then, using a SELECT query, display all of the data in the school table and paste
# the result in the gist along with the other results.
SELECT * FROM school;


/***************** Output ***************

mysql> INSERT INTO school (name, country, capacity)
    -> VALUES ('Beauxbatons Academy of Magic', 'France', 550),
    -> ('Castelobruxo', 'Brazil', 380),
    -> ('Durmstrang Institute', 'Norway', 570),
    -> ('Hogwarts School of Witchcraft and Wizardry', 'United Kingdom', 450),
    -> ('Ilvermorny School of Witchcraft and Wizardry', 'USA', 300),
    -> ('Koldovstoretz', 'Russia', 125),
    -> ('Mahoutokoro School of Magic', 'Japan', 800),
    -> ('Uagadou School of Magic', 'Uganda', 350);
Query OK, 8 rows affected (0.01 sec)
Records: 8  Duplicates: 0  Warnings: 0

mysql> UPDATE school SET country="Sweden" WHERE name = "Durmstrang Institute";
Query OK, 1 row affected (0.01 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> UPDATE school SET capacity = 700 WHERE name = "Mahoutokoro School of Magic";
Query OK, 1 row affected (0.01 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> DELETE FROM school WHERE name LIKE "%Magic%";
Query OK, 3 rows affected (0.01 sec)

mysql> SELECT * FROM school;
+----+----------------------------------------------+----------+----------------+
| id | name                                         | capacity | country        |
+----+----------------------------------------------+----------+----------------+
|  2 | Castelobruxo                                 |      380 | Brazil         |
|  3 | Durmstrang Institute                         |      570 | Sweden         |
|  4 | Hogwarts School of Witchcraft and Wizardry   |      450 | United Kingdom |
|  5 | Ilvermorny School of Witchcraft and Wizardry |      300 | USA            |
|  6 | Koldovstoretz                                |      125 | Russia         |
+----+----------------------------------------------+----------+----------------+
5 rows in set (0.00 sec)

****************************************/