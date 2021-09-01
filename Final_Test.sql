-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema Schooldatabase
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Schooldatabase
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Schooldatabase` DEFAULT CHARACTER SET utf8 ;
USE `Schooldatabase` ;

-- -----------------------------------------------------
-- Table `Schooldatabase`.`Student`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Schooldatabase`.`Student` (
  `Student_ID` INT NOT NULL,
  `FName` VARCHAR(45) NULL,
  `LName` VARCHAR(45) NULL,
  `Phone` VARCHAR(45) NULL,
  `Email` VARCHAR(45) NULL,
  `Date_Enrollment` VARCHAR(45) NULL,
  PRIMARY KEY (`Student_ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Schooldatabase`.`Department`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Schooldatabase`.`Department` (
  `Department_ID` INT NOT NULL,
  `Name` VARCHAR(45) NULL,
  `Description` VARCHAR(45) NULL,
  PRIMARY KEY (`Department_ID`))
ENGINE = InnoDB
COMMENT = '	';


-- -----------------------------------------------------
-- Table `Schooldatabase`.`Instructor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Schooldatabase`.`Instructor` (
  `Instructor_ID` INT NOT NULL,
  `FName` VARCHAR(45) NULL,
  `LName` VARCHAR(45) NULL,
  `Phone` VARCHAR(45) NULL,
  `Email` VARCHAR(45) NULL,
  `Date_Employment` VARCHAR(45) NULL,
  `Department_ID` INT NOT NULL,
  `Supervisor_ID` INT NOT NULL,
  PRIMARY KEY (`Instructor_ID`),
  INDEX `fk_Instructor_Department1_idx` (`Department_ID` ASC) VISIBLE,
  INDEX `fk_Instructor_Instructor1_idx` (`Supervisor_ID` ASC) VISIBLE,
  CONSTRAINT `fk_Instructor_Department1`
    FOREIGN KEY (`Department_ID`)
    REFERENCES `Schooldatabase`.`Department` (`Department_ID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Instructor_Instructor1`
    FOREIGN KEY (`Supervisor_ID`)
    REFERENCES `Schooldatabase`.`Instructor` (`Instructor_ID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Schooldatabase`.`Major`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Schooldatabase`.`Major` (
  `Major_ID` INT NOT NULL,
  `Name` VARCHAR(45) NULL,
  `Description` VARCHAR(45) NULL,
  `Student_Student_ID` INT NOT NULL,
  PRIMARY KEY (`Major_ID`, `Student_Student_ID`),
  INDEX `fk_Major_Student1_idx` (`Student_Student_ID` ASC) VISIBLE,
  CONSTRAINT `fk_Major_Student1`
    FOREIGN KEY (`Student_Student_ID`)
    REFERENCES `Schooldatabase`.`Student` (`Student_ID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Schooldatabase`.`Course`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Schooldatabase`.`Course` (
  `Course_ID` INT NOT NULL,
  `Name` VARCHAR(45) NULL,
  `description` VARCHAR(45) NULL,
  `Department_ID` INT NOT NULL,
  `Major_ID` INT NOT NULL,
  PRIMARY KEY (`Course_ID`, `Department_ID`, `Major_ID`),
  INDEX `fk_Course_Department1_idx` (`Department_ID` ASC) VISIBLE,
  INDEX `fk_Course_Major1_idx` (`Major_ID` ASC) VISIBLE,
  CONSTRAINT `fk_Course_Department1`
    FOREIGN KEY (`Department_ID`)
    REFERENCES `Schooldatabase`.`Department` (`Department_ID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Course_Major1`
    FOREIGN KEY (`Major_ID`)
    REFERENCES `Schooldatabase`.`Major` (`Major_ID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Schooldatabase`.`Tuition`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Schooldatabase`.`Tuition` (
  `Tuition_ID` INT NOT NULL,
  `Amount_Owed` VARCHAR(45) NULL,
  `Status` VARCHAR(45) NULL,
  `Student_ID` INT NOT NULL,
  PRIMARY KEY (`Tuition_ID`, `Student_ID`),
  INDEX `fk_Payroll_Student1_idx` (`Student_ID` ASC) VISIBLE,
  CONSTRAINT `fk_Payroll_Student1`
    FOREIGN KEY (`Student_ID`)
    REFERENCES `Schooldatabase`.`Student` (`Student_ID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Schooldatabase`.`Location`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Schooldatabase`.`Location` (
  `Location_ID` INT NOT NULL,
  `Room_Number` VARCHAR(45) NULL,
  `Department_ID` INT NOT NULL,
  PRIMARY KEY (`Location_ID`, `Department_ID`),
  INDEX `fk_Location_Department1_idx` (`Department_ID` ASC) VISIBLE,
  CONSTRAINT `fk_Location_Department1`
    FOREIGN KEY (`Department_ID`)
    REFERENCES `Schooldatabase`.`Department` (`Department_ID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
COMMENT = '	';


-- -----------------------------------------------------
-- Table `Schooldatabase`.`Head_Of_Department`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Schooldatabase`.`Head_Of_Department` (
  `Head_Of_Department_ID` INT NOT NULL,
  `Instructor_ID` INT NOT NULL,
  `Department_ID` INT NOT NULL,
  PRIMARY KEY (`Head_Of_Department_ID`, `Instructor_ID`, `Department_ID`),
  INDEX `fk_Head_Of_Department_Instructor1_idx` (`Instructor_ID` ASC) VISIBLE,
  INDEX `fk_Head_Of_Department_Department1_idx` (`Department_ID` ASC) VISIBLE,
  CONSTRAINT `fk_Head_Of_Department_Instructor1`
    FOREIGN KEY (`Instructor_ID`)
    REFERENCES `Schooldatabase`.`Instructor` (`Instructor_ID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Head_Of_Department_Department1`
    FOREIGN KEY (`Department_ID`)
    REFERENCES `Schooldatabase`.`Department` (`Department_ID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Schooldatabase`.`Instructor_has_Course`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Schooldatabase`.`Instructor_has_Course` (
  `Instructor_ID` INT NOT NULL,
  `Course_ID` INT NOT NULL,
  `Course_Time` VARCHAR(45) NULL,
  PRIMARY KEY (`Instructor_ID`, `Course_ID`),
  INDEX `fk_Instructor_has_Course_Course1_idx` (`Course_ID` ASC) VISIBLE,
  INDEX `fk_Instructor_has_Course_Instructor1_idx` (`Instructor_ID` ASC) VISIBLE,
  CONSTRAINT `fk_Instructor_has_Course_Instructor1`
    FOREIGN KEY (`Instructor_ID`)
    REFERENCES `Schooldatabase`.`Instructor` (`Instructor_ID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Instructor_has_Course_Course1`
    FOREIGN KEY (`Course_ID`)
    REFERENCES `Schooldatabase`.`Course` (`Course_ID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
