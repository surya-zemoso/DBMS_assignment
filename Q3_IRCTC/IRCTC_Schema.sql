-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema IRCTC
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema IRCTC
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `IRCTC` DEFAULT CHARACTER SET utf8 ;
USE `IRCTC` ;

-- -----------------------------------------------------
-- Table `IRCTC`.`Customer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `IRCTC`.`Customer` (
  `idCustomer` INT NOT NULL,
  `Customer Name` VARCHAR(45) NOT NULL,
  `Customer_Address` VARCHAR(45) NOT NULL,
  `Customer_Email` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idCustomer`),
  UNIQUE INDEX `idCustomer_UNIQUE` (`idCustomer` ASC),
  UNIQUE INDEX `Customer_Email_UNIQUE` (`Customer_Email` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `IRCTC`.`Ticket`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `IRCTC`.`Ticket` (
  `idTicket` INT NOT NULL,
  `Date of journey` DATE NOT NULL,
  `cust_Id` INT NOT NULL,
  `Ticket_Price` INT NOT NULL,
  PRIMARY KEY (`idTicket`, `cust_Id`),
  INDEX `fk_Ticket_1_idx` (`cust_Id` ASC),
  UNIQUE INDEX `idTicket_UNIQUE` (`idTicket` ASC),
  UNIQUE INDEX `cust_Id_UNIQUE` (`cust_Id` ASC),
  CONSTRAINT `fk_Ticket_1`
    FOREIGN KEY (`cust_Id`)
    REFERENCES `IRCTC`.`Customer` (`idCustomer`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `IRCTC`.`Train`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `IRCTC`.`Train` (
  `Train number` INT NOT NULL,
  `Source station` VARCHAR(45) NOT NULL,
  `Destination` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Train number`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `IRCTC`.`Reserved`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `IRCTC`.`Reserved` (
  `pnr number` INT NOT NULL,
  `Train num` INT NOT NULL,
  `Seat No & Coah No` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`pnr number`, `Train num`),
  INDEX `fk_Reserved_2_idx` (`Train num` ASC),
  CONSTRAINT `fk_Reserved_1`
    FOREIGN KEY (`pnr number`)
    REFERENCES `IRCTC`.`Ticket` (`idTicket`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Reserved_2`
    FOREIGN KEY (`Train num`)
    REFERENCES `IRCTC`.`Train` (`Train number`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `IRCTC`.`Unreserved`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `IRCTC`.`Unreserved` (
  `idUnreserved` INT NOT NULL,
  PRIMARY KEY (`idUnreserved`),
  CONSTRAINT `fk_Unreserved_1`
    FOREIGN KEY (`idUnreserved`)
    REFERENCES `IRCTC`.`Ticket` (`idTicket`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
