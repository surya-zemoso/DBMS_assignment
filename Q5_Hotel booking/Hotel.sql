-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema Hotel
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Hotel
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Hotel` DEFAULT CHARACTER SET utf8 ;
USE `Hotel` ;

-- -----------------------------------------------------
-- Table `Hotel`.`Hotel`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Hotel`.`Hotel` (
  `idHotel` INT NOT NULL,
  `Hotel_Name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idHotel`),
  UNIQUE INDEX `idHotel_UNIQUE` (`idHotel` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Hotel`.`Customer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Hotel`.`Customer` (
  `idCustomer` INT NOT NULL,
  `Customer_Name` VARCHAR(45) NOT NULL,
  `Customer_Address` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idCustomer`),
  UNIQUE INDEX `idCustomer_UNIQUE` (`idCustomer` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Hotel`.`Book_Hotel`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Hotel`.`Book_Hotel` (
  `Hotel_ID` INT NOT NULL,
  `Customer_ID` INT NOT NULL,
  `time` DATE NOT NULL,
  PRIMARY KEY (`Customer_ID`, `time`),
  INDEX `fk_Book_Hotel_1_idx` (`Customer_ID` ASC),
  CONSTRAINT `fk_Book_Hotel_1`
    FOREIGN KEY (`Customer_ID`)
    REFERENCES `Hotel`.`Customer` (`idCustomer`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Book_Hotel_2`
    FOREIGN KEY (`Hotel_ID`)
    REFERENCES `Hotel`.`Hotel` (`idHotel`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
