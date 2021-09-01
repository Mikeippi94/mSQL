-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`Location`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Location` (
  `Location_ID` INT NOT NULL,
  `Location_Name` VARCHAR(45) NULL,
  PRIMARY KEY (`Location_ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Department`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Department` (
  `Dept_ID` INT NOT NULL,
  `Dept_Name` VARCHAR(45) NULL,
  `Dept_Head` VARCHAR(45) NOT NULL,
  `Location_Location_ID` INT NOT NULL,
  `Department_Dept_ID` INT NOT NULL,
  `Department_Dept_Head` VARCHAR(45) NOT NULL,
  `Department_Location_Location_ID` INT NOT NULL,
  PRIMARY KEY (`Dept_ID`, `Dept_Head`, `Location_Location_ID`, `Department_Dept_ID`, `Department_Dept_Head`, `Department_Location_Location_ID`),
  INDEX `fk_Department_Location_idx` (`Location_Location_ID` ASC) VISIBLE,
  INDEX `fk_Department_Department1_idx` (`Department_Dept_ID` ASC, `Department_Dept_Head` ASC, `Department_Location_Location_ID` ASC) VISIBLE,
  CONSTRAINT `fk_Department_Location`
    FOREIGN KEY (`Location_Location_ID`)
    REFERENCES `mydb`.`Location` (`Location_ID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Department_Department1`
    FOREIGN KEY (`Department_Dept_ID` , `Department_Dept_Head` , `Department_Location_Location_ID`)
    REFERENCES `mydb`.`Department` (`Dept_ID` , `Dept_Head` , `Location_Location_ID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
COMMENT = '	';


-- -----------------------------------------------------
-- Table `mydb`.`Instructor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Instructor` (
  `Instructor_ID` INT NOT NULL,
  `IFName` VARCHAR(45) NULL,
  `ILNAME` VARCHAR(45) NULL,
  `IMName` VARCHAR(45) NULL,
  `City` VARCHAR(45) NULL,
  `Address` VARCHAR(45) NULL,
  `Zip` VARCHAR(45) NULL,
  `StartDate` VARCHAR(45) NULL,
  `Department_Dept_ID` INT NOT NULL,
  `Department_Dept_Head` VARCHAR(45) NOT NULL,
  `Department_Location_Location_ID` INT NOT NULL,
  PRIMARY KEY (`Instructor_ID`),
  INDEX `fk_Instructor_Department1_idx` (`Department_Dept_ID` ASC, `Department_Dept_Head` ASC, `Department_Location_Location_ID` ASC) VISIBLE,
  CONSTRAINT `fk_Instructor_Department1`
    FOREIGN KEY (`Department_Dept_ID` , `Department_Dept_Head` , `Department_Location_Location_ID`)
    REFERENCES `mydb`.`Department` (`Dept_ID` , `Dept_Head` , `Location_Location_ID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Payroll`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Payroll` (
  `Payroll_ID` INT NOT NULL,
  `Status` VARCHAR(45) NULL,
  PRIMARY KEY (`Payroll_ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Students`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Students` (
  `Student_ID` INT NOT NULL,
  `FName` VARCHAR(45) NULL,
  `LName` VARCHAR(45) NULL,
  `MName` VARCHAR(45) NULL,
  `CIty` VARCHAR(45) NULL,
  `State` VARCHAR(45) NULL,
  `Address` VARCHAR(45) NULL,
  `Zip` INT NULL,
  `Date_Of_Enrollment` VARCHAR(45) NULL,
  `Payroll_Payroll_ID` INT NOT NULL,
  PRIMARY KEY (`Student_ID`, `Payroll_Payroll_ID`),
  INDEX `fk_Students_Payroll1_idx` (`Payroll_Payroll_ID` ASC) VISIBLE,
  CONSTRAINT `fk_Students_Payroll1`
    FOREIGN KEY (`Payroll_Payroll_ID`)
    REFERENCES `mydb`.`Payroll` (`Payroll_ID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
COMMENT = '	';


-- -----------------------------------------------------
-- Table `mydb`.`Major`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Major` (
  `Major_ID` INT NOT NULL,
  `Major_Name` VARCHAR(45) NULL,
  `Major_description` VARCHAR(45) NULL,
  PRIMARY KEY (`Major_ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Course`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Course` (
  `Course_ID` INT NOT NULL,
  `Course_Name` VARCHAR(45) NULL,
  `Course_Time` VARCHAR(45) NULL,
  `Course_description` VARCHAR(45) NULL,
  `Coursecol` VARCHAR(45) NULL,
  `Major_Major_ID` INT NOT NULL,
  `Instructor_Instructor_ID` INT NOT NULL,
  PRIMARY KEY (`Course_ID`, `Major_Major_ID`),
  INDEX `fk_Course_Major1_idx` (`Major_Major_ID` ASC) VISIBLE,
  INDEX `fk_Course_Instructor1_idx` (`Instructor_Instructor_ID` ASC) VISIBLE,
  CONSTRAINT `fk_Course_Major1`
    FOREIGN KEY (`Major_Major_ID`)
    REFERENCES `mydb`.`Major` (`Major_ID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Course_Instructor1`
    FOREIGN KEY (`Instructor_Instructor_ID`)
    REFERENCES `mydb`.`Instructor` (`Instructor_ID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
COMMENT = '	';


-- -----------------------------------------------------
-- Table `mydb`.`Students_has_Major`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Students_has_Major` (
)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Course_has_Location`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Course_has_Location` (
  `Course_Course_ID` INT NOT NULL,
  `Course_Major_Major_ID` INT NOT NULL,
  `Location_Location_ID` INT NOT NULL,
  PRIMARY KEY (`Course_Course_ID`, `Course_Major_Major_ID`, `Location_Location_ID`),
  INDEX `fk_Course_has_Location_Location1_idx` (`Location_Location_ID` ASC) VISIBLE,
  INDEX `fk_Course_has_Location_Course1_idx` (`Course_Course_ID` ASC, `Course_Major_Major_ID` ASC) VISIBLE,
  CONSTRAINT `fk_Course_has_Location_Course1`
    FOREIGN KEY (`Course_Course_ID` , `Course_Major_Major_ID`)
    REFERENCES `mydb`.`Course` (`Course_ID` , `Major_Major_ID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Course_has_Location_Location1`
    FOREIGN KEY (`Location_Location_ID`)
    REFERENCES `mydb`.`Location` (`Location_ID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Students_has_Major1`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Students_has_Major1` (
  `Students_Student_ID` INT NOT NULL,
  `Major_Major_ID` INT NOT NULL,
  PRIMARY KEY (`Students_Student_ID`, `Major_Major_ID`),
  INDEX `fk_Students_has_Major1_Major1_idx` (`Major_Major_ID` ASC) VISIBLE,
  INDEX `fk_Students_has_Major1_Students1_idx` (`Students_Student_ID` ASC) VISIBLE,
  CONSTRAINT `fk_Students_has_Major1_Students1`
    FOREIGN KEY (`Students_Student_ID`)
    REFERENCES `mydb`.`Students` (`Student_ID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Students_has_Major1_Major1`
    FOREIGN KEY (`Major_Major_ID`)
    REFERENCES `mydb`.`Major` (`Major_ID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Instructor_has_Students`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Instructor_has_Students` (
  `Instructor_Instructor_ID` INT NOT NULL,
  `Students_Student_ID` INT NOT NULL,
  PRIMARY KEY (`Instructor_Instructor_ID`, `Students_Student_ID`),
  INDEX `fk_Instructor_has_Students_Students1_idx` (`Students_Student_ID` ASC) VISIBLE,
  INDEX `fk_Instructor_has_Students_Instructor1_idx` (`Instructor_Instructor_ID` ASC) VISIBLE,
  CONSTRAINT `fk_Instructor_has_Students_Instructor1`
    FOREIGN KEY (`Instructor_Instructor_ID`)
    REFERENCES `mydb`.`Instructor` (`Instructor_ID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Instructor_has_Students_Students1`
    FOREIGN KEY (`Students_Student_ID`)
    REFERENCES `mydb`.`Students` (`Student_ID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
