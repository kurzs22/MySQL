create database wild_db_quest;

use wild_db_quest;

CREATE TABLE `wizard` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `firstname` VARCHAR(100) NOT NULL,
  `lastname` VARCHAR(100) NOT NULL,
  `birthday` DATE NOT NULL,
  `birth_place` VARCHAR(255) NULL,
  `biography` TEXT NULL,
  PRIMARY KEY (`id`)
);

ALTER TABLE wizard ADD `is_muggle` BOOLEAN NOT NULL;

CREATE TABLE `school` (
    `id`  INT NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(100) NOT NULL,
    `capacity` INT NULL,
    `country` VARCHAR(255) NOT NULL,
    PRIMARY KEY(`id`)
);

show tables;

describe wizard;

describe school;

# Screenshot gepostet
# https://imgur.com/a/643HMc3
