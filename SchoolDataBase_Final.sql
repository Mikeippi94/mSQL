-- MySQL dump 10.13  Distrib 8.0.23, for Win64 (x86_64)
--
-- Host: localhost    Database: school_data_base
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
  `Department_ID` int NOT NULL,
  `Major_ID` int NOT NULL,
  PRIMARY KEY (`Course_ID`,`Department_ID`,`Major_ID`),
  KEY `fk_Course_Department1_idx` (`Department_ID`),
  KEY `fk_Course_Major1_idx` (`Major_ID`),
  CONSTRAINT `fk_Course_Department1` FOREIGN KEY (`Department_ID`) REFERENCES `department` (`Department_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_Course_Major1` FOREIGN KEY (`Major_ID`) REFERENCES `major` (`Major_ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course`
--

LOCK TABLES `course` WRITE;
/*!40000 ALTER TABLE `course` DISABLE KEYS */;
INSERT INTO `course` VALUES (175100,'Business 101','Intro to Business',5,104),(175201,'Business 201','Macro Economics',5,104),(180101,'Finance 101','Intro to Finance',4,103),(180201,'Finance 201','Business Finance',4,103),(190101,'Psychology 101','Intro to Psychology',6,105),(190201,'Psychology 201','Advance Psychology',6,105),(198101,'Programming 101','learn the basics about programming',1,100),(198201,'Programming 201','learn advance programming',1,100),(198385,'Cloud Computing','learn the basics about cloud computing',1,100),(201101,'Biology 101','Intro to Biology',2,101),(201201,'Biology 201','Advance Biology',2,101),(305101,'Art 101','Intro to Art',3,102),(305102,'Drawing 201','Intro to Drawing',3,102);
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
INSERT INTO `department` VALUES (1,'Computer Science','Computer Science Department'),(2,'Biology','Biology Department'),(3,'Art','Art Department'),(4,'Finance','Finance Department'),(5,'Business','Business Department'),(6,'Psychology','Psychology Department');
/*!40000 ALTER TABLE `department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `head_of_department`
--

DROP TABLE IF EXISTS `head_of_department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `head_of_department` (
  `Head_Of_Department_ID` int NOT NULL,
  `Instructor_ID` int NOT NULL,
  `Department_ID` int NOT NULL,
  PRIMARY KEY (`Head_Of_Department_ID`,`Instructor_ID`,`Department_ID`),
  KEY `fk_Head_Of_Department_Instructor1_idx` (`Instructor_ID`),
  KEY `fk_Head_Of_Department_Department1_idx` (`Department_ID`),
  CONSTRAINT `fk_Head_Of_Department_Department1` FOREIGN KEY (`Department_ID`) REFERENCES `department` (`Department_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_Head_Of_Department_Instructor1` FOREIGN KEY (`Instructor_ID`) REFERENCES `instructor` (`Instructor_ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `head_of_department`
--

LOCK TABLES `head_of_department` WRITE;
/*!40000 ALTER TABLE `head_of_department` DISABLE KEYS */;
INSERT INTO `head_of_department` VALUES (311,2002,1),(312,2003,2),(313,2004,3),(314,2005,4),(315,2006,5),(316,2007,6);
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
  `Department_ID` int NOT NULL,
  `Supervisor_ID` int NOT NULL,
  PRIMARY KEY (`Instructor_ID`),
  KEY `fk_Instructor_Department1_idx` (`Department_ID`),
  KEY `fk_Instructor_Instructor1_idx` (`Supervisor_ID`),
  CONSTRAINT `fk_Instructor_Department1` FOREIGN KEY (`Department_ID`) REFERENCES `department` (`Department_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_Instructor_Instructor1` FOREIGN KEY (`Supervisor_ID`) REFERENCES `instructor` (`Instructor_ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `instructor`
--

LOCK TABLES `instructor` WRITE;
/*!40000 ALTER TABLE `instructor` DISABLE KEYS */;
INSERT INTO `instructor` VALUES (2002,'Bill','Johns','111-111-2222','Bill@college.com','08/21/1985',1,2002),(2003,'Jane','Samuel','111-222-2222','Jane@college.com','07/14/1999',2,2002),(2004,'John','James','111-111-3333','John@college.com','08/27/1980',3,2002),(2005,'Jessica','Lopez','111-111-4444','Jessica@college.com','09/18/2000',4,2002),(2006,'James','Robins','111-111-5555','James@college.com','06/14/1994',5,2002),(2007,'Kyle','Mass','111-111-6666','Kyle@college.com','12/21/1989',6,2002),(2008,'Will','Gold','111-888-2222','Will@college.com','02/15/1997',1,2002),(2009,'Dan','White','111-333-2222','Dan@college.com','03/24/2007',4,2002),(2010,'Jimmy','Woods','222-111-2222','Jimmy@college.com','04/08/2008',2,2002),(2011,'Frank','Castle','111-444-2222','Frank@college.com','04/12/1992',3,2002),(2012,'Steve','Rogers','111-565-4789','Steve@college.com','06/17/1982',5,2002),(2013,'Peter','Parker','111-111-1234','Peter@college.com','09/27/1996',6,2002);
/*!40000 ALTER TABLE `instructor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `instructor_has_course`
--

DROP TABLE IF EXISTS `instructor_has_course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `instructor_has_course` (
  `Instructor_ID` int NOT NULL,
  `Course_ID` int NOT NULL,
  `Course_Time` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`Instructor_ID`,`Course_ID`),
  KEY `fk_Instructor_has_Course_Course1_idx` (`Course_ID`),
  KEY `fk_Instructor_has_Course_Instructor1_idx` (`Instructor_ID`),
  CONSTRAINT `fk_Instructor_has_Course_Course1` FOREIGN KEY (`Course_ID`) REFERENCES `course` (`Course_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_Instructor_has_Course_Instructor1` FOREIGN KEY (`Instructor_ID`) REFERENCES `instructor` (`Instructor_ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `instructor_has_course`
--

LOCK TABLES `instructor_has_course` WRITE;
/*!40000 ALTER TABLE `instructor_has_course` DISABLE KEYS */;
INSERT INTO `instructor_has_course` VALUES (2002,198101,'1:00PM - 2:20PM'),(2003,201101,'4:00PM - 5:20PM'),(2004,305101,'2:30PM - 3:50PM'),(2005,180101,'1:00PM - 2:20PM'),(2006,175100,'4:00PM - 5:20PM'),(2007,190101,'1:00PM - 2:20PM'),(2008,198201,'1:00PM - 2:20PM'),(2008,198385,'2:30PM - 3:50PM'),(2009,180101,'1:00PM - 2:20PM'),(2009,180201,'2:20PM - 3:50PM'),(2010,201101,'4:00PM - 5:20PM'),(2010,201201,'1:00PM - 2:20PM'),(2011,305101,'1:00PM - 2:20PM'),(2011,305102,'2:30PM - 3:50PM'),(2012,175100,'1:00PM - 2:20PM'),(2012,175201,'2:20PM - 3:50PM'),(2013,190101,'2:20PM - 3:50PM'),(2013,190201,'1:00PM - 2:20PM');
/*!40000 ALTER TABLE `instructor_has_course` ENABLE KEYS */;
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
  `Department_ID` int NOT NULL,
  PRIMARY KEY (`Location_ID`,`Department_ID`),
  KEY `fk_Location_Department1_idx` (`Department_ID`),
  CONSTRAINT `fk_Location_Department1` FOREIGN KEY (`Department_ID`) REFERENCES `department` (`Department_ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='	';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `location`
--

LOCK TABLES `location` WRITE;
/*!40000 ALTER TABLE `location` DISABLE KEYS */;
INSERT INTO `location` VALUES (101,'Room: 101',1),(102,'Room: 102',2),(103,'Room: 103',3),(201,'Room: 201',4),(202,'Room: 202',5),(203,'Room: 203',6);
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
  `Student_Student_ID` int NOT NULL,
  PRIMARY KEY (`Major_ID`,`Student_Student_ID`),
  KEY `fk_Major_Student1_idx` (`Student_Student_ID`),
  CONSTRAINT `fk_Major_Student1` FOREIGN KEY (`Student_Student_ID`) REFERENCES `student` (`Student_ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `major`
--

LOCK TABLES `major` WRITE;
/*!40000 ALTER TABLE `major` DISABLE KEYS */;
INSERT INTO `major` VALUES (100,'Computer Science','Arts and Science degree',10001),(100,'Computer Science','Arts and Science degree',10008),(100,'Computer Science','Arts and Science degree',10009),(101,'Biology','Arts and Science degree',10002),(102,'Art','Arts and Science degree',10003),(102,'Art','Arts and Science degree',10007),(103,'Finance','Business degree',10004),(103,'Finance','Business degree',10010),(104,'Business','Business degree',10005),(105,'Psychology','Psychology degree',10006);
/*!40000 ALTER TABLE `major` ENABLE KEYS */;
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
  PRIMARY KEY (`Student_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student`
--

LOCK TABLES `student` WRITE;
/*!40000 ALTER TABLE `student` DISABLE KEYS */;
INSERT INTO `student` VALUES (10001,'Michael','Ippolito','111-222-3333','Michael@gmail.com','09/01/20'),(10002,'Jessica','Smith','222-111-3333','Jessica@gmail.com','09/01/19'),(10003,'Ethan','James','333-111-2222','Ethan@gmail.com','01/03/18'),(10004,'Becca','Colins','444-555-6666','Becca@gmail.com','01/03/20'),(10005,'Allan','Johnson','777-444-5555','Allen@gmail.com','09/13/20'),(10006,'Jane','Doe','555-777-6666','Jane@gmail.com','09/15/18'),(10007,'John','Smith','555-777-4444','John@gmail.com','02/01/19'),(10008,'James','Blake','888-999-6666','James@gmail.com','06/14/20'),(10009,'Suzi','Crabgrass','999-888-7777','Suzi@gmail.com','07/30/18'),(10010,'Tim','Allen','123-456-7890','Tim@gmail.com','09/15/20');
/*!40000 ALTER TABLE `student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tuition`
--

DROP TABLE IF EXISTS `tuition`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tuition` (
  `Tuition_ID` int NOT NULL,
  `Amount_Owed` varchar(45) DEFAULT NULL,
  `Status` varchar(45) DEFAULT NULL,
  `Student_ID` int NOT NULL,
  PRIMARY KEY (`Tuition_ID`,`Student_ID`),
  KEY `fk_Payroll_Student1_idx` (`Student_ID`),
  CONSTRAINT `fk_Payroll_Student1` FOREIGN KEY (`Student_ID`) REFERENCES `student` (`Student_ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tuition`
--

LOCK TABLES `tuition` WRITE;
/*!40000 ALTER TABLE `tuition` DISABLE KEYS */;
INSERT INTO `tuition` VALUES (20,'$0.00','Paid',10001),(21,'$7,168.00','Not Paid',10002),(22,'$8,168.00','Not Paid',10003),(23,'$0.00','Paid',10004),(24,'$0.00','Paid',10005),(25,'$0.00','Paid',10006),(26,'$5,778.00','Not Paid',10007),(27,'$7,678.00','Not Paid',10008),(28,'$4,200.00','Not Paid',10009),(29,'$0.00','Paid',10010);
/*!40000 ALTER TABLE `tuition` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-04-27 20:25:50
