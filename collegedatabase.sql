-- MySQL dump 10.13  Distrib 8.0.23, for Win64 (x86_64)
--
-- Host: localhost    Database: collegedatabase
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
  `Course_Name` varchar(45) DEFAULT NULL,
  `Course_Time` varchar(45) DEFAULT NULL,
  `Course_description` varchar(45) DEFAULT NULL,
  `Coursecol` varchar(45) DEFAULT NULL,
  `Major_Major_ID` int NOT NULL,
  `Instructor_Instructor_ID` int NOT NULL,
  PRIMARY KEY (`Course_ID`,`Major_Major_ID`),
  KEY `fk_Course_Major1_idx` (`Major_Major_ID`),
  KEY `fk_Course_Instructor1_idx` (`Instructor_Instructor_ID`),
  CONSTRAINT `fk_Course_Instructor1` FOREIGN KEY (`Instructor_Instructor_ID`) REFERENCES `instructor` (`Instructor_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_Course_Major1` FOREIGN KEY (`Major_Major_ID`) REFERENCES `major` (`Major_ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='	';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course`
--

LOCK TABLES `course` WRITE;
/*!40000 ALTER TABLE `course` DISABLE KEYS */;
/*!40000 ALTER TABLE `course` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course_has_location`
--

DROP TABLE IF EXISTS `course_has_location`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `course_has_location` (
  `Course_Course_ID` int NOT NULL,
  `Course_Major_Major_ID` int NOT NULL,
  `Location_Location_ID` int NOT NULL,
  PRIMARY KEY (`Course_Course_ID`,`Course_Major_Major_ID`,`Location_Location_ID`),
  KEY `fk_Course_has_Location_Location1_idx` (`Location_Location_ID`),
  KEY `fk_Course_has_Location_Course1_idx` (`Course_Course_ID`,`Course_Major_Major_ID`),
  CONSTRAINT `fk_Course_has_Location_Course1` FOREIGN KEY (`Course_Course_ID`, `Course_Major_Major_ID`) REFERENCES `course` (`Course_ID`, `Major_Major_ID`),
  CONSTRAINT `fk_Course_has_Location_Location1` FOREIGN KEY (`Location_Location_ID`) REFERENCES `location` (`Location_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course_has_location`
--

LOCK TABLES `course_has_location` WRITE;
/*!40000 ALTER TABLE `course_has_location` DISABLE KEYS */;
/*!40000 ALTER TABLE `course_has_location` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `department`
--

DROP TABLE IF EXISTS `department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `department` (
  `Dept_ID` int NOT NULL,
  `Dept_Name` varchar(45) DEFAULT NULL,
  `Dept_Head` varchar(45) NOT NULL,
  `Location_Location_ID` int NOT NULL,
  `Department_Dept_ID` int NOT NULL,
  `Department_Dept_Head` varchar(45) NOT NULL,
  `Department_Location_Location_ID` int NOT NULL,
  PRIMARY KEY (`Dept_ID`,`Dept_Head`,`Location_Location_ID`,`Department_Dept_ID`,`Department_Dept_Head`,`Department_Location_Location_ID`),
  KEY `fk_Department_Location_idx` (`Location_Location_ID`),
  KEY `fk_Department_Department1_idx` (`Department_Dept_ID`,`Department_Dept_Head`,`Department_Location_Location_ID`),
  CONSTRAINT `fk_Department_Department1` FOREIGN KEY (`Department_Dept_ID`, `Department_Dept_Head`, `Department_Location_Location_ID`) REFERENCES `department` (`Dept_ID`, `Dept_Head`, `Location_Location_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_Department_Location` FOREIGN KEY (`Location_Location_ID`) REFERENCES `location` (`Location_ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='	';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `department`
--

LOCK TABLES `department` WRITE;
/*!40000 ALTER TABLE `department` DISABLE KEYS */;
INSERT INTO `department` VALUES (1111,'Math Department','Johnson',100,1111,'Johnson',100),(1112,'History Department','Smith',101,1112,'Smith',101),(1113,'English Department','Woods',102,1113,'Woods',102),(1114,'Science Department','Biggs',200,1114,'Biggs',200),(1115,'Pshycology Department','Wedge',201,1115,'Wedge',201),(1116,'Computer Science Department','Wilson',202,1116,'Wilson',202);
/*!40000 ALTER TABLE `department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `instructor`
--

DROP TABLE IF EXISTS `instructor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `instructor` (
  `Instructor_ID` int NOT NULL,
  `IFName` varchar(45) DEFAULT NULL,
  `ILNAME` varchar(45) DEFAULT NULL,
  `IMName` varchar(45) DEFAULT NULL,
  `City` varchar(45) DEFAULT NULL,
  `Address` varchar(45) DEFAULT NULL,
  `Zip` varchar(45) DEFAULT NULL,
  `StartDate` varchar(45) DEFAULT NULL,
  `Department_Dept_ID` int NOT NULL,
  `Department_Dept_Head` varchar(45) NOT NULL,
  `Department_Location_Location_ID` int NOT NULL,
  PRIMARY KEY (`Instructor_ID`),
  KEY `fk_Instructor_Department1_idx` (`Department_Dept_ID`,`Department_Dept_Head`,`Department_Location_Location_ID`),
  CONSTRAINT `fk_Instructor_Department1` FOREIGN KEY (`Department_Dept_ID`, `Department_Dept_Head`, `Department_Location_Location_ID`) REFERENCES `department` (`Dept_ID`, `Dept_Head`, `Location_Location_ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `instructor`
--

LOCK TABLES `instructor` WRITE;
/*!40000 ALTER TABLE `instructor` DISABLE KEYS */;
INSERT INTO `instructor` VALUES (11,'David','Johnson','Anthony','New York','881 seseme street','10002','09/01/1995',1111,'Johnson',100),(12,'Steven','Smith','Michael','Hackensack','12 8th  Street','25456','02/12/1984',1112,'Smith',101),(13,'Rachell','Woods','Marie','Summit','45 9th Street','12345','11/25/2000',1113,'Woods',102),(14,'Michael','Biggs','Bill','Newark','32 Pine Road','10002','5/12/1999',1114,'Biggs',200),(15,'William','Wedge','David','Newark','78 Wood Road','10002','09/01/1995',1115,'Wedge',201),(16,'Bill','Wilson','Carl','PineWillow','32 Tree Street','32433','09/01/1987',1116,'Wilson',202),(17,'Frank','Zillow','Anthony','Summit','12 1st Street','54567','02/04/1993',1116,'Wilson',202),(18,'Barbara','Jameson','Cora','Pineland','3 3rd Street','45654','09/01/1995',1111,'Johnson',100);
/*!40000 ALTER TABLE `instructor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `instructor_has_students`
--

DROP TABLE IF EXISTS `instructor_has_students`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `instructor_has_students` (
  `Instructor_Instructor_ID` int NOT NULL,
  `Students_Student_ID` int NOT NULL,
  PRIMARY KEY (`Instructor_Instructor_ID`,`Students_Student_ID`),
  KEY `fk_Instructor_has_Students_Students1_idx` (`Students_Student_ID`),
  KEY `fk_Instructor_has_Students_Instructor1_idx` (`Instructor_Instructor_ID`),
  CONSTRAINT `fk_Instructor_has_Students_Instructor1` FOREIGN KEY (`Instructor_Instructor_ID`) REFERENCES `instructor` (`Instructor_ID`),
  CONSTRAINT `fk_Instructor_has_Students_Students1` FOREIGN KEY (`Students_Student_ID`) REFERENCES `students` (`Student_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `instructor_has_students`
--

LOCK TABLES `instructor_has_students` WRITE;
/*!40000 ALTER TABLE `instructor_has_students` DISABLE KEYS */;
/*!40000 ALTER TABLE `instructor_has_students` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `location`
--

DROP TABLE IF EXISTS `location`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `location` (
  `Location_ID` int NOT NULL,
  `Location_Name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`Location_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `location`
--

LOCK TABLES `location` WRITE;
/*!40000 ALTER TABLE `location` DISABLE KEYS */;
INSERT INTO `location` VALUES (100,'ROOM 100'),(101,'ROOM 101'),(102,'ROOM 102'),(200,'ROOM 200'),(201,'ROOM 201'),(202,'ROOM 202');
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
  `Major_Name` varchar(45) DEFAULT NULL,
  `Major_description` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`Major_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `major`
--

LOCK TABLES `major` WRITE;
/*!40000 ALTER TABLE `major` DISABLE KEYS */;
INSERT INTO `major` VALUES (100,'Comp sci','Computer science'),(101,'History','History Major'),(102,'English','English Major'),(103,'Science','Science Major'),(104,'Math','Math Major'),(105,'Pshycology','Pshycology Major');
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
INSERT INTO `payroll` VALUES (1,'Paid'),(2,'Paid'),(3,'Not Paid'),(4,'Paid'),(5,'Not Paid'),(6,'Paid'),(7,'Paid'),(8,'Not Paid'),(9,'Paid'),(10,'Not Paid');
/*!40000 ALTER TABLE `payroll` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `students`
--

DROP TABLE IF EXISTS `students`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `students` (
  `Student_ID` int NOT NULL,
  `FName` varchar(45) DEFAULT NULL,
  `LName` varchar(45) DEFAULT NULL,
  `MName` varchar(45) DEFAULT NULL,
  `CIty` varchar(45) DEFAULT NULL,
  `State` varchar(45) DEFAULT NULL,
  `Address` varchar(45) DEFAULT NULL,
  `Zip` int DEFAULT NULL,
  `Date_Of_Enrollment` varchar(45) DEFAULT NULL,
  `Major_ID` int DEFAULT NULL,
  `Payroll_Payroll_ID` int NOT NULL,
  PRIMARY KEY (`Student_ID`,`Payroll_Payroll_ID`),
  KEY `fk_Students_Payroll1_idx` (`Payroll_Payroll_ID`),
  CONSTRAINT `fk_Students_Payroll1` FOREIGN KEY (`Payroll_Payroll_ID`) REFERENCES `payroll` (`Payroll_ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='	';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `students`
--

LOCK TABLES `students` WRITE;
/*!40000 ALTER TABLE `students` DISABLE KEYS */;
INSERT INTO `students` VALUES (10001,'Michael','Ippolito','Anthony','New York','New York','123 seseme street',10002,'09/01/2020',100,1),(10002,'Isla','Williams','Amelia','New York','New York','123 work street',10002,'09/01/2021',100,2),(10003,'Ashley','Johnson','Marie','Paterson','New Jersey','78 Kennedy lane',7501,'09/01/2021',104,3),(10004,'Ophelia','Goldberg','Esme','Clifton','New Jersey','67 Hackensack road',7011,'09/01/2021',103,4),(10005,'Maya','Willson','Charlotte','Paterson','New Jersey','54 Homestead Ave',7501,'09/01/2021',105,5),(10006,'Nicolas','Degrom','James','New York','New York','43 MLK BLVD',10002,'09/01/2021',101,6),(10007,'Christian','Robinson','Mario','New York','New York','1738 13TH street',10002,'09/01/2021',102,7),(10008,'Liam','Woods','Noah','Carlstadt','New Jersey','13 Tree road',7075,'09/01/2021',103,8),(10009,'Frank','Price','Henry','Elizabeth','New Jersey','21 Pine street',7201,'09/01/2021',104,9),(10010,'Jessica','ORiley','Sophia','New York','New York','22 Jump street',10002,'09/01/2021',105,10);
/*!40000 ALTER TABLE `students` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-04-25 19:21:09
