CREATE SCHEMA `pb` ;

CREATE TABLE `pb`.`person` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL,
  PRIMARY KEY (`id`));

CREATE TABLE `pb`.`phone` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `person_id` INT NULL,
  `phone` VARCHAR(45) NULL,
  PRIMARY KEY (`id`),
  INDEX `PERSON_FK_idx` (`person_id` ASC),
  CONSTRAINT `PERSON_FK`
    FOREIGN KEY (`person_id`)
    REFERENCES `pb`.`person` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE);
