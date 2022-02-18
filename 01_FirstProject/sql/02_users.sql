-- Tabelle users

CREATE TABLE IF NOT EXISTS `mydb`.`users` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(45) NOT NULL,
  `create_time` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `username_UNIQUE` (`username` ASC))
ENGINE = InnoDB;

-- Struktur
DESCRIBE mydb.users;

-- Inserts
INSERT INTO `mydb`.`users` (`username`) VALUES ("Amir");
INSERT INTO `mydb`.`users` (`username`) VALUES ("Stephan");
INSERT INTO `mydb`.`users` (`username`) VALUES ("Justine");
INSERT INTO `mydb`.`users` (`username`) VALUES ("Tino");

-- Inhalte
SELECT * FROM mydb.users;

