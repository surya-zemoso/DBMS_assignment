-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema Paytm
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Paytm
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Paytm` DEFAULT CHARACTER SET utf8 ;
USE `Paytm` ;

-- -----------------------------------------------------
-- Table `Paytm`.`Branches`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Paytm`.`Branches` (
  `idBranches` INT NOT NULL,
  PRIMARY KEY (`idBranches`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Paytm`.`Accounts`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Paytm`.`Accounts` (
  `idAccounts` INT NOT NULL,
  `BranchID` INT NOT NULL,
  PRIMARY KEY (`idAccounts`),
  INDEX `fk_Accounts_1_idx` (`BranchID` ASC),
  CONSTRAINT `fk_Accounts_1`
    FOREIGN KEY (`BranchID`)
    REFERENCES `Paytm`.`Branches` (`idBranches`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Paytm`.`customer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Paytm`.`customer` (
  `idcustomer` INT NOT NULL,
  `account_id` INT NOT NULL,
  `customer_branch` INT NOT NULL,
  `customer_name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idcustomer`, `customer_branch`),
  INDEX `fk_customer_1_idx` (`account_id` ASC),
  INDEX `fk_customer_2_idx` (`customer_branch` ASC),
  CONSTRAINT `fk_customer_1`
    FOREIGN KEY (`account_id`)
    REFERENCES `Paytm`.`Accounts` (`idAccounts`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_customer_2`
    FOREIGN KEY (`customer_branch`)
    REFERENCES `Paytm`.`Branches` (`idBranches`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
