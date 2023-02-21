-- MySQL Script generated by MySQL Workbench
-- Tue Feb 21 10:55:31 2023
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mylibrarydb
-- -----------------------------------------------------


CREATE SCHEMA IF NOT EXISTS `mylibrarydb` DEFAULT CHARACTER SET utf8 ;
USE `mylibrarydb` ;


-- -----------------------------------------------------
-- Table `mylibrarydb`.`book`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mylibrarydb`.`book` (
  `idbook` INT NOT NULL,
  `ISBN` VARCHAR(45) NOT NULL,
  `title` VARCHAR(45) NOT NULL,
  `author` VARCHAR(45) NOT NULL,
  `stock` INT NOT NULL,
  PRIMARY KEY (`idbook`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mylibrarydb`.`customer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mylibrarydb`.`customer` (
  `idcustomer` INT NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `age` VARCHAR(45) NULL,
  PRIMARY KEY (`idcustomer`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mylibrarydb`.`transaction`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mylibrarydb`.`transaction` (
  `idtransaction` INT NOT NULL,
  `customer_idcustomer` INT NOT NULL,
  `date` DATE NOT NULL,
  `book_idbook` INT NOT NULL,
  PRIMARY KEY (`idtransaction`),
  INDEX `fk_transaction_customer1_idx` (`customer_idcustomer` ASC) VISIBLE,
  INDEX `fk_transaction_book1_idx` (`book_idbook` ASC) VISIBLE,
  CONSTRAINT `fk_transaction_customer1`
    FOREIGN KEY (`customer_idcustomer`)
    REFERENCES `mylibrarydb`.`customer` (`idcustomer`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_transaction_book1`
    FOREIGN KEY (`book_idbook`)
    REFERENCES `mylibrarydb`.`book` (`idbook`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

INSERT INTO book
VALUES (1, "ISBN 987 234 234 234", "Krimi 1", "Dieter Bohlen", 5);

INSERT INTO book
VALUES (2, "ISBN 987 123 123 123", "Krimi 2", "Thoams Anders", 5);

INSERT INTO book
VALUES (3, "ISBN 987 567 567 567", "Krimi 3", "Helene Fischer", 5);

INSERT INTO book
VALUES (4, "ISBN 987 123 123 123", "Krimi 4", "DJ Bobo", 5);

INSERT INTO book
VALUES (5, "ISBN 987 789 789 789", "Krimi 5", "Justin Bieber", 5);

INSERT INTO customer
VALUES (1, "Wolfgang Peterson", 71);

INSERT INTO customer
VALUES (2, "John Wick", 49);

INSERT INTO customer
VALUES (3, "Sebastian Offergeld", 12);

INSERT INTO customer
VALUES (4, "Peter Jackson", 67);

INSERT INTO customer
VALUES (5, "Hans Müller", 99);

INSERT INTO transaction
VALUES (1, 1, "25.05.2023", 1);

DELETE FROM customer
WHERE idcustomer = 5;

UPDATE customer
SET name = "Hans Meier", age= 98;
WHERE idcustomer = 1;