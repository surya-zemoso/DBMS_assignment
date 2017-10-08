-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema Project_Employees
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Project_Employees
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Project_Employees` DEFAULT CHARACTER SET utf8 ;
USE `Project_Employees` ;

-- -----------------------------------------------------
-- Table `Project_Employees`.`Projects`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Project_Employees`.`Projects` (
  `Project_title` VARCHAR(45) NOT NULL,
  `Project_duration` DOUBLE NULL,
  `Manager_ID` INT NOT NULL,
  `Project_ID` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`Project_ID`, `Manager_ID`),
  INDEX `fk_Projects_1_idx` (`Manager_ID` ASC),
  CONSTRAINT `fk_Projects_1`
    FOREIGN KEY (`Manager_ID`)
    REFERENCES `Project_Employees`.`Employees` (`Employees_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Project_Employees`.`Employees`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Project_Employees`.`Employees` (
  `Employees_ID` INT NOT NULL AUTO_INCREMENT,
  `Employees_Name` VARCHAR(45) NOT NULL,
  `Post` VARCHAR(45) NOT NULL,
  `Manager_ID` INT NOT NULL,
  `P_ID` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`Employees_ID`, `P_ID`),
  INDEX `fk_Employees_1_idx` (`P_ID` ASC),
  INDEX `fk_Employees_2_idx` (`Manager_ID` ASC),
  CONSTRAINT `fk_Employees_1`
    FOREIGN KEY (`P_ID`)
    REFERENCES `Project_Employees`.`Projects` (`Project_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Employees_2`
    FOREIGN KEY (`Manager_ID`)
    REFERENCES `Project_Employees`.`Employees` (`Employees_ID`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
