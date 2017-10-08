-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema imdb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema imdb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `imdb` DEFAULT CHARACTER SET utf8 ;
USE `imdb` ;

-- -----------------------------------------------------
-- Table `imdb`.`Actor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `imdb`.`Actor` (
  `idActor` INT NOT NULL AUTO_INCREMENT,
  `Actor_name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idActor`),
  UNIQUE INDEX `idActor_UNIQUE` (`idActor` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `imdb`.`Movie`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `imdb`.`Movie` (
  `idMovie` INT NOT NULL,
  `Movie_name` VARCHAR(45) NOT NULL,
  `Movie_actorID` INT NOT NULL,
  PRIMARY KEY (`idMovie`, `Movie_actorID`),
  UNIQUE INDEX `idMovie_UNIQUE` (`idMovie` ASC),
  INDEX `fk_Movie_1_idx` (`Movie_actorID` ASC),
  CONSTRAINT `fk_Movie_1`
    FOREIGN KEY (`Movie_actorID`)
    REFERENCES `imdb`.`Actor` (`idActor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `imdb`.`Tv_Series`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `imdb`.`Tv_Series` (
  `idTv_Series` INT NOT NULL,
  `Tv_Series_name` VARCHAR(45) NOT NULL,
  `Tv_Series_actor_ID` INT NOT NULL,
  PRIMARY KEY (`idTv_Series`, `Tv_Series_actor_ID`),
  UNIQUE INDEX `idTv_Series_UNIQUE` (`idTv_Series` ASC),
  INDEX `fk_Tv_Series_1_idx` (`Tv_Series_actor_ID` ASC),
  CONSTRAINT `fk_Tv_Series_1`
    FOREIGN KEY (`Tv_Series_actor_ID`)
    REFERENCES `imdb`.`Actor` (`idActor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
