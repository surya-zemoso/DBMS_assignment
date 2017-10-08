-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema cab_rent
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema cab_rent
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `cab_rent` DEFAULT CHARACTER SET utf8 ;
USE `cab_rent` ;

-- -----------------------------------------------------
-- Table `cab_rent`.`Driver`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cab_rent`.`Driver` (
  `Driver_id` INT NOT NULL AUTO_INCREMENT,
  `Driver_name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Driver_id`),
  UNIQUE INDEX `Driver_id_UNIQUE` (`Driver_id` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cab_rent`.`Cabs`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cab_rent`.`Cabs` (
  `cab_id` INT NOT NULL AUTO_INCREMENT,
  `Driver_Driver_id` INT NOT NULL,
  PRIMARY KEY (`cab_id`, `Driver_Driver_id`),
  UNIQUE INDEX `cab_id_UNIQUE` (`cab_id` ASC),
  INDEX `fk_Cabs_Driver1_idx` (`Driver_Driver_id` ASC),
  CONSTRAINT `fk_Cabs_Driver1`
    FOREIGN KEY (`Driver_Driver_id`)
    REFERENCES `cab_rent`.`Driver` (`Driver_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cab_rent`.`Customer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cab_rent`.`Customer` (
  `customer_ID` INT NOT NULL AUTO_INCREMENT,
  `Customer_Name` VARCHAR(45) NOT NULL,
  `Contact_Number` MEDIUMTEXT NOT NULL,
  PRIMARY KEY (`customer_ID`),
  UNIQUE INDEX `customer_ID_UNIQUE` (`customer_ID` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cab_rent`.`Cabforcustomer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cab_rent`.`Cabforcustomer` (
  `customer_IDcab` INT NOT NULL AUTO_INCREMENT,
  `cab_idcab` INT NOT NULL,
  PRIMARY KEY (`customer_IDcab`, `cab_idcab`),
  UNIQUE INDEX `idCabforcustomer_UNIQUE` (`customer_IDcab` ASC),
  UNIQUE INDEX `cab_idcab_UNIQUE` (`cab_idcab` ASC),
  CONSTRAINT `fk_Cabforcustomer_1`
    FOREIGN KEY (`cab_idcab`)
    REFERENCES `cab_rent`.`Cabs` (`cab_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Cabforcustomer_2`
    FOREIGN KEY (`customer_IDcab`)
    REFERENCES `cab_rent`.`Customer` (`customer_ID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
