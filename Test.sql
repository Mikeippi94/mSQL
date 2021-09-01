USE collegedatabase;

DESC payroll;
INSERT INTO payroll
VALUES(001, 'Paid');
INSERT INTO payroll
VALUES(002, 'Paid');
INSERT INTO payroll
VALUES(003, 'Not Paid');
INSERT INTO payroll
VALUES(004, 'Paid');
INSERT INTO payroll
VALUES(005, 'Not Paid');
INSERT INTO payroll
VALUES(006, 'Paid');
INSERT INTO payroll
VALUES(007, 'Paid');
INSERT INTO payroll
VALUES(008, 'Not Paid');
INSERT INTO payroll
VALUES(009, 'Paid');
INSERT INTO payroll
VALUES(010, 'Not Paid');
SELECT * FROM payroll;
DESC major;
INSERT INTO major
VALUES(100, 'Comp sci', 'Computer science');
INSERT INTO major
VALUES(101, 'History', 'History Major');
INSERT INTO major
VALUES(102, 'English', 'English Major');
INSERT INTO major
VALUES(103, 'Science', 'Science Major');
INSERT INTO major
VALUES(104, 'Math', 'Math Major');
INSERT INTO major
VALUES(105, 'Pshycology', 'Pshycology Major');
SELECT * FROM major;
SELECT * FROM students;


ALTER TABLE students										
ADD COLUMN  Major_ID int AFTER Date_Of_Enrollment;


DESC students;
INSERT INTO students
VALUES(10001,'Michael', 'Ippolito', 'Anthony', 'New York', 'New York', '123 seseme street', 10002, '09/01/2020', 100, 001);
INSERT INTO students
VALUES(10002,'Bill', 'Smith', 'James', 'New York', 'New York', '123 work street', 10002, '09/01/2021', 102, 002);
INSERT INTO students
VALUES(10003,'Bill', 'Smith', 'James', 'Paterson', 'New Jersey', '78 Kennedy lane', 07501, '09/01/2021', 104, 003);
INSERT INTO students
VALUES(10004,'Bill', 'Smith', 'James', 'Clifton', 'New Jersey', '67 Hackensack road', 07011, '09/01/2021', 103, 004);
INSERT INTO students
VALUES(10005,'Bill', 'Smith', 'James', 'Paterson', 'New Jersey', '54 Homestead Ave', 07501, '09/01/2021', 105, 005);
INSERT INTO students
VALUES(10006,'Bill', 'Smith', 'James', 'New York', 'New York', '43 MLK BLVD', 10002, '09/01/2021', 101, 006);
INSERT INTO students
VALUES(10007,'Bill', 'Smith', 'James', 'New York', 'New York', '1738 13TH street', 10002, '09/01/2021', 102, 007);
INSERT INTO students
VALUES(10008,'Bill', 'Smith', 'James', 'Carlstadt', 'New Jersey', '13 Tree road', 07075, '09/01/2021', 103, 008);
INSERT INTO students
VALUES(10009,'Bill', 'Smith', 'James', 'Elizabeth', 'New Jersey', '21 Pine street', 07201, '09/01/2021', 104, 009);
INSERT INTO students
VALUES(10010,'Jessica', 'ORiley', 'Sophia', 'New York', 'New York', '22 Jump street', 10002, '09/01/2021', 105, 010);

SELECT * FROM students;
UPDATE students SET FName = 'Carl'
WHERE STUDENT_ID = 1006;
UPDATE students SET LName = 'James'
WHERE STUDENT_ID = 1006;
UPDATE students SET MName = 'William'
WHERE STUDENT_ID = 1006;

UPDATE students SET FName = 'Isla'
WHERE STUDENT_ID = 10002;
UPDATE students SET LName = 'Williams'
WHERE STUDENT_ID = 10002;
UPDATE students SET MName = 'Amelia'
WHERE STUDENT_ID = 10002;

UPDATE students SET FName = 'Ashley'
WHERE STUDENT_ID = 10003;
UPDATE students SET LName = 'Johnson'
WHERE STUDENT_ID = 10003;
UPDATE students SET MName = 'Marie'
WHERE STUDENT_ID = 10003;

UPDATE students SET FName = 'Ophelia'
WHERE STUDENT_ID = 10004;
UPDATE students SET LName = 'Goldberg'
WHERE STUDENT_ID = 10004;
UPDATE students SET MName = 'Esme'
WHERE STUDENT_ID = 10004;

UPDATE students SET FName = 'Maya'
WHERE STUDENT_ID = 10005;
UPDATE students SET LName = 'Willson'
WHERE STUDENT_ID = 10005;
UPDATE students SET MName = 'Charlotte'
WHERE STUDENT_ID = 10005;

UPDATE students SET FName = 'Nicolas'
WHERE STUDENT_ID = 10006;
UPDATE students SET LName = 'Degrom'
WHERE STUDENT_ID = 10006;
UPDATE students SET MName = 'James'
WHERE STUDENT_ID = 10006;

UPDATE students SET FName = 'Christian'
WHERE STUDENT_ID = 10007;
UPDATE students SET LName = 'Robinson'
WHERE STUDENT_ID = 10007;
UPDATE students SET MName = 'Mario'
WHERE STUDENT_ID = 10007;

UPDATE students SET FName = 'Liam'
WHERE STUDENT_ID = 10008;
UPDATE students SET LName = 'Woods'
WHERE STUDENT_ID = 10008;
UPDATE students SET MName = 'Noah'
WHERE STUDENT_ID = 10008;

UPDATE students SET FName = 'Frank'
WHERE STUDENT_ID = 10009;
UPDATE students SET LName = 'Price'
WHERE STUDENT_ID = 10009;
UPDATE students SET MName = 'Henry'
WHERE STUDENT_ID = 10009;

DELETE FROM Students WHERE Student_ID = 1006;
SELECT * FROM students;

UPDATE students SET Major_ID = 100
WHERE STUDENT_ID = 10001;

DESC location;
INSERT INTO location
VALUES(100, 'ROOM 100');
INSERT INTO location
VALUES(101, 'ROOM 101');
INSERT INTO location
VALUES(102, 'ROOM 102');
INSERT INTO location
VALUES(200, 'ROOM 200');
INSERT INTO location
VALUES(201, 'ROOM 201');
INSERT INTO location
VALUES(202, 'ROOM 202');

SELECT * FROM location;
SELECT * FROM Major;

DESC department;
INSERT INTO department	
VALUES(1111, 'Math Department', 'Johnson', 100, 1111, 'Johnson' , 100 );
INSERT INTO department	
VALUES(1112, 'History Department', 'Smith', 101, 1112, 'Smith' , 101 );
INSERT INTO department	
VALUES(1113, 'English Department', 'Woods', 102, 1113, 'Woods' , 102 );
INSERT INTO department	
VALUES(1114, 'Science Department', 'Biggs', 200, 1114, 'Biggs' , 200 );
INSERT INTO department	
VALUES(1115, 'Pshycology Department', 'Wedge', 201, 1115, 'Wedge' , 201 );
INSERT INTO department	
VALUES(1116, 'Computer Science Department', 'Wilson', 202, 1116, 'Wilson' , 202 );	
Select * FROM department;

Select * From instructor;
DEsc instructor;
Insert into instructor
VALUES(11,'David', 'Johnson', 'Anthony', 'New York', '881 seseme street', 10002, '09/01/1995', 1111, 'Johnson', 100 );
Insert into instructor
VALUES(12,'Steven', 'Smith', 'Michael', 'Hackensack', '12 8th  Street', 25456, '02/12/1984', 1112, 'Smith', 101 );
Insert into instructor
VALUES(13,'Rachell', 'Woods', 'Marie', 'Summit', '45 9th Street', 12345, '11/25/2000', 1113, 'Woods', 102 );
Insert into instructor
VALUES(14,'Michael', 'Biggs', 'Bill', 'Newark', '32 Pine Road', 10002, '5/12/1999', 1114, 'Biggs', 200 );
Insert into instructor
VALUES(15,'William', 'Wedge', 'David', 'Newark', '78 Wood Road', 10002, '09/01/1995', 1115, 'Wedge', 201 );
Insert into instructor
VALUES(16,'Bill', 'Wilson', 'Carl', 'PineWillow', '32 Tree Street', 32433, '09/01/1987', 1116, 'Wilson', 202 );
Insert into instructor
VALUES(17,'Frank', 'Zillow', 'Anthony', 'Summit', '12 1st Street', 54567, '02/04/1993', 1116, 'Wilson', 202 );
Insert into instructor
VALUES(18,'Barbara', 'Jameson', 'Cora', 'Pineland', '3 3rd Street', 45654, '09/01/1995', 1111, 'Johnson', 100 );

