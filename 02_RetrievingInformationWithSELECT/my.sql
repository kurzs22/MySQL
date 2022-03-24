# mysql -u kurzs -p

USE `wild_db_quest`;

# Retrieve all of the tuples containing wizards born between 1975 and 1985
SELECT * FROM wizard WHERE birthday BETWEEN '1975-01-01' AND '1985-12-31';

# Retrieve the wizards’ firstnames whose first names start with the letter “H”
SELECT firstname FROM wizard WHERE firstname LIKE 'H%';

# Retrieve the first names and last names of the whole “Potter” family, ordered by first names
SELECT firstname, lastname FROM wizard WHERE lastname = "Potter" ORDER BY firstname;

# Retrieve the oldest wizard’s first name, last name and birth date (this must work regardless of the table content)
SELECT firstname, lastname, birthday FROM wizard ORDER BY birthday LIMIT 1;

# Screenshot of mysql session uploaded to https://imgur.com/a/VYTkBS5
