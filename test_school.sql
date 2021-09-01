-- MySQL dump 10.13  Distrib 8.0.23, for Win64 (x86_64)
--
-- Host: localhost    Database: schooldatabase
-- ------------------------------------------------------
-- Server version	8.0.23

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `course`
--

DROP TABLE IF EXISTS `course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `course` (
  `Course_ID` int NOT NULL,
  `Name` varchar(45) DEFAULT NULL,
  `description` varchar(45) DEFAULT NULL,
  `Department_Department_ID` int NOT NULL,
  `Major_Major_ID` int NOT NULL,
  `Location_Location_ID` int NOT NULL,
  PRIMARY KEY (`Course_ID`,`Department_Department_ID`,`Major_Major_ID`,`Location_Location_ID`),
  KEY `fk_Course_Department1_idx` (`Department_Department_ID`),
  KEY `fk_Course_Major1_idx` (`Major_Major_ID`),
  KEY `fk_Course_Location1_idx` (`Location_Location_ID`),
  CONSTRAINT `fk_Course_Department1` FOREIGN KEY (`Department_Department_ID`) REFERENCES `department` (`Department_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_Course_Location1` FOREIGN KEY (`Location_Location_ID`) REFERENCES `location` (`Location_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_Course_Major1` FOREIGN KEY (`Major_Major_ID`) REFERENCES `major` (`Major_ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course`
--

LOCK TABLES `course` WRITE;
/*!40000 ALTER TABLE `course` DISABLE KEYS */;
INSERT INTO `course` VALUES (198,'Intro to programming','Learn basics to programming',100,111,1),(199,'Intro to Biology','Learn basics of Biology',101,112,2);
/*!40000 ALTER TABLE `course` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `department`
--

DROP TABLE IF EXISTS `department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `department` (
  `Department_ID` int NOT NULL,
  `Name` varchar(45) DEFAULT NULL,
  `Description` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`Department_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='	';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `department`
--

LOCK TABLES `department` WRITE;
/*!40000 ALTER TABLE `department` DISABLE KEYS */;
INSERT INTO `department` VALUES (100,'Computer Science','Computer Science Department'),(101,'Science','Science Department');
/*!40000 ALTER TABLE `department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `head_of_department`
--

DROP TABLE IF EXISTS `head_of_department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `head_of_department` (
  `idHead_Of_Department` int NOT NULL,
  PRIMARY KEY (`idHead_Of_Department`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `head_of_department`
--

LOCK TABLES `head_of_department` WRITE;
/*!40000 ALTER TABLE `head_of_department` DISABLE KEYS */;
/*!40000 ALTER TABLE `head_of_department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `instructor`
--

DROP TABLE IF EXISTS `instructor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `instructor` (
  `Instructor_ID` int NOT NULL,
  `FName` varchar(45) DEFAULT NULL,
  `LName` varchar(45) DEFAULT NULL,
  `Phone` varchar(45) DEFAULT NULL,
  `Email` varchar(45) DEFAULT NULL,
  `Date_Employment` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`Instructor_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `instructor`
--

LOCK TABLES `instructor` WRITE;
/*!40000 ALTER TABLE `instructor` DISABLE KEYS */;
INSERT INTO `instructor` VALUES (1234,'John','Doe','987-654-1230','John@university.com','01/25/1985'),(1235,'Jessic','Smith','222-111-3333','Jessica@university.com','03/05/1995');
/*!40000 ALTER TABLE `instructor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `instructor_has_course`
--

DROP TABLE IF EXISTS `instructor_has_course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `instructor_has_course` (
  `Instructor_Instructor_ID` int NOT NULL,
  `Course_Course_ID` int NOT NULL,
  PRIMARY KEY (`Instructor_Instructor_ID`,`Course_Course_ID`),
  KEY `fk_Instructor_has_Course_Course1_idx` (`Course_Course_ID`),
  KEY `fk_Instructor_has_Course_Instructor1_idx` (`Instructor_Instructor_ID`),
  CONSTRAINT `fk_Instructor_has_Course_Course1` FOREIGN KEY (`Course_Course_ID`) REFERENCES `course` (`Course_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_Instructor_has_Course_Instructor1` FOREIGN KEY (`Instructor_Instructor_ID`) REFERENCES `instructor` (`Instructor_ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `instructor_has_course`
--

LOCK TABLES `instructor_has_course` WRITE;
/*!40000 ALTER TABLE `instructor_has_course` DISABLE KEYS */;
/*!40000 ALTER TABLE `instructor_has_course` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `instructor_has_department`
--

DROP TABLE IF EXISTS `instructor_has_department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `instructor_has_department` (
  `Instructor_Instructor_ID` int NOT NULL,
  `Department_Department_ID` int NOT NULL,
  PRIMARY KEY (`Instructor_Instructor_ID`,`Department_Department_ID`),
  KEY `fk_Instructor_has_Department_Department1_idx` (`Department_Department_ID`),
  KEY `fk_Instructor_has_Department_Instructor1_idx` (`Instructor_Instructor_ID`),
  CONSTRAINT `fk_Instructor_has_Department_Department1` FOREIGN KEY (`Department_Department_ID`) REFERENCES `department` (`Department_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_Instructor_has_Department_Instructor1` FOREIGN KEY (`Instructor_Instructor_ID`) REFERENCES `instructor` (`Instructor_ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `instructor_has_department`
--

LOCK TABLES `instructor_has_department` WRITE;
/*!40000 ALTER TABLE `instructor_has_department` DISABLE KEYS */;
/*!40000 ALTER TABLE `instructor_has_department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `location`
--

DROP TABLE IF EXISTS `location`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `location` (
  `Location_ID` int NOT NULL,
  `Room_Number` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`Location_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='	';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `location`
--

LOCK TABLES `location` WRITE;
/*!40000 ALTER TABLE `location` DISABLE KEYS */;
INSERT INTO `location` VALUES (1,'Room 100'),(2,'Room 101');
/*!40000 ALTER TABLE `location` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `major`
--

DROP TABLE IF EXISTS `major`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `major` (
  `Major_ID` int NOT NULL,
  `Name` varchar(45) DEFAULT NULL,
  `Description` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`Major_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `major`
--

LOCK TABLES `major` WRITE;
/*!40000 ALTER TABLE `major` DISABLE KEYS */;
INSERT INTO `major` VALUES (111,'Computer Science','Degree in Arts and Sciences'),(112,'Biology','Degree in Arts and Sciences');
/*!40000 ALTER TABLE `major` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payroll`
--

DROP TABLE IF EXISTS `payroll`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payroll` (
  `Payroll_ID` int NOT NULL,
  `Status` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`Payroll_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payroll`
--

LOCK TABLES `payroll` WRITE;
/*!40000 ALTER TABLE `payroll` DISABLE KEYS */;
INSERT INTO `payroll` VALUES (10,'PAID'),(11,'UNPAID');
/*!40000 ALTER TABLE `payroll` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student`
--

DROP TABLE IF EXISTS `student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `student` (
  `Student_ID` int NOT NULL,
  `FName` varchar(45) DEFAULT NULL,
  `LName` varchar(45) DEFAULT NULL,
  `Phone` varchar(45) DEFAULT NULL,
  `Email` varchar(45) DEFAULT NULL,
  `Date_Enrollment` varchar(45) DEFAULT NULL,
  `Payroll_Payroll_ID` int NOT NULL,
  PRIMARY KEY (`Student_ID`,`Payroll_Payroll_ID`),
  KEY `fk_Student_Payroll1_idx` (`Payroll_Payroll_ID`),
  CONSTRAINT `fk_Student_Payroll1` FOREIGN KEY (`Payroll_Payroll_ID`) REFERENCES `payroll` (`Payroll_ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student`
--

LOCK TABLES `student` WRITE;
/*!40000 ALTER TABLE `student` DISABLE KEYS */;
INSERT INTO `student` VALUES (1001,'Michael','Ippolito','123-456-7890','Michael@yahoo.com','09/01/20',10),(1002,'Jane','Doe','111-222-3333','Jane@yahoo.com','09/01/19',11);
/*!40000 ALTER TABLE `student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student_has_major`
--

DROP TABLE IF EXISTS `student_has_major`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `student_has_major` (
  `Student_Student_ID` int NOT NULL,
  `Major_Major_ID` int NOT NULL,
  PRIMARY KEY (`Student_Student_ID`,`Major_Major_ID`),
  KEY `fk_Student_has_Major_Major1_idx` (`Major_Major_ID`),
  KEY `fk_Student_has_Major_Student_idx` (`Student_Student_ID`),
  CONSTRAINT `fk_Student_has_Major_Major1` FOREIGN KEY (`Major_Major_ID`) REFERENCES `major` (`Major_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_Student_has_Major_Student` FOREIGN KEY (`Student_Student_ID`) REFERENCES `student` (`Student_ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_has_major`
--

LOCK TABLES `student_has_major` WRITE;
/*!40000 ALTER TABLE `student_has_major` DISABLE KEYS */;
/*!40000 ALTER TABLE `student_has_major` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-04-25 22:42:47
