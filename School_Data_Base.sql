select * From student;
DESC student;
INSERT INTO student
VALUES(10001, 'Michael', 'Ippolito', '111-222-3333', 'Michael@gmail.com', '09/01/20');
INSERT INTO student
VALUES(10002, 'Jessica', 'Smith', '222-111-3333', 'Jessica@gmail.com', '09/01/19');
INSERT INTO student
VALUES(10003, 'Ethan', 'James', '333-111-2222', 'Ethan@gmail.com', '01/03/18');
INSERT INTO student
VALUES(10004, 'Becca', 'Colins', '444-555-6666', 'Becca@gmail.com', '01/03/20');
INSERT INTO student
VALUES(10005, 'Allan', 'Johnson', '777-444-5555', 'Allen@gmail.com', '09/13/20');
INSERT INTO student
VALUES(10006, 'Jane', 'Doe', '555-777-6666', 'Jane@gmail.com', '09/15/18');
INSERT INTO student
VALUES(10007, 'John', 'Smith', '555-777-4444', 'John@gmail.com', '02/01/19');
INSERT INTO student
VALUES(10008, 'James', 'Blake', '888-999-6666', 'James@gmail.com', '06/14/2020');
INSERT INTO student
VALUES(10009, 'Suzi', 'Crabgrass', '999-888-7777', 'Suzi@gmail.com', '07/30/2018');
INSERT INTO student
VALUES(10010, 'Tim', 'Allen', '123-456-7890', 'Tim@gmail.com', '09/15/20');

Select * From tuition;
INSERT INTO tuition
VALUES(20,'$0.00', 'Paid', 10001);
INSERT INTO tuition
VALUES(21,'$7,168.00', 'Not Paid', 10002);
INSERT INTO tuition
VALUES(22,'$8,168.00', 'Not Paid', 10003);
INSERT INTO tuition
VALUES(23,'$0.00', 'Paid', 10004);
INSERT INTO tuition
VALUES(24,'$0.00', 'Paid', 10005);
INSERT INTO tuition
VALUES(25,'$0.00', 'Paid', 10006);
INSERT INTO tuition
VALUES(26,'$5,778.00', 'Not Paid', 10007);
INSERT INTO tuition
VALUES(27,'$7,678.00', 'Not Paid', 10008);
INSERT INTO tuition
VALUES(28,'$4,200.00', 'Not Paid', 10009);
INSERT INTO tuition
VALUES(29,'$0.00', 'Paid', 10010);

SELECT * FROM Major;
INSERT INTO Major
Values(100, 'Computer Science', 'Arts and Science degree', 10001);
INSERT INTO Major
Values(101, 'Biology', 'Arts and Science degree', 10002);
INSERT INTO Major
Values(102, 'Art', 'Arts and Science degree', 10003);
INSERT INTO Major
Values(103, 'Finance', 'Business degree', 10004);
INSERT INTO Major
Values(104, 'Business', 'Business degree', 10005);
INSERT INTO Major
Values(105, 'Psychology', 'Psychology degree', 10006);
INSERT INTO Major
Values(102, 'Psychology', 'Psychology degree', 10007);
INSERT INTO Major
Values(100, 'Psychology', 'Psychology degree', 10008);
INSERT INTO Major
Values(100, 'Psychology', 'Psychology degree', 10009);
INSERT INTO Major
Values(103, 'Finance', 'Business degree', 10010);

UPDATE Major
Set
	Name = 'Computer Science',
    Description = 'Arts and Science degree'
WHERE
	Major_ID = 100;
    UPDATE Major
Set
	Name = 'Art',
    Description = 'Arts and Science degree'
WHERE
	Major_ID = 102;
    
    SELECT * FROM department;
    INSERT INTO department
    VALUES(1, 'Computer Science', 'Computer Science Department');
	INSERT INTO department
    VALUES(2, 'Biology', 'Biology Department');
     INSERT INTO department
    VALUES(3, 'Art', 'Art Department');
     INSERT INTO department
    VALUES(4, 'Finance', 'Finance Department');
     INSERT INTO department
    VALUES(5, 'Business', 'Business Department');
     INSERT INTO department
    VALUES(6, 'Psychology', 'Psychology Department');
    
    SELECT * FROM location;
    INSERT INTO location
    Values(101, 'Room: 101', 1);
    INSERT INTO location
    Values(102, 'Room: 102', 2);
    INSERT INTO location
    Values(103, 'Room: 103', 3);
    INSERT INTO location
    Values(201, 'Room: 201', 4);
    INSERT INTO location
    Values(202, 'Room: 202', 5);
    INSERT INTO location
    Values(203, 'Room: 203', 6);
    
    SELECT * FROM course;
    INSERT INTO course
    VALUES(198101, 'Programming 101', 'learn the basics about programming', 1, 100); 
    INSERT INTO course
    VALUES(198201, 'Programming 201', 'learn advance programming', 1, 100);
    INSERT INTO course
    VALUES(198385, 'Cloud Computing', 'learn the basics about cloud computing', 1, 100);
    INSERT INTO course
    VALUES(201101, 'Biology 101', 'Intro to Biology', 2, 101);
    INSERT INTO course
    VALUES(201201, 'Biology 201', 'Advance Biology', 2, 101);
    INSERT INTO course
    VALUES(305101, 'Art 101', 'Intro to Art', 3, 102);
    INSERT INTO course
    VALUES(305102, 'Drawing 201', 'Intro to Drawing', 3, 102);
    INSERT INTO course
    VALUES(190101, 'Psychology 101', 'Intro to Psychology', 6, 105);
    INSERT INTO course
    VALUES(190201, 'Psychology 201', 'Advance Psychology', 6 , 105);
    INSERT INTO course
    VALUES(180101, 'Finance 101', 'Intro to Finance', 4, 103);
    INSERT INTO course
    VALUES(180201, 'Finance 201', 'Business Finance', 4, 103);
    INSERT INTO course
    VALUES(175100, 'Business 101', 'Intro to Business', 5, 104);
    INSERT INTO course
    VALUES(175201, 'Business 201', 'Macro Economics', 5, 104);
    
    SELECT * FROM instructor;
    desc instructor;
    INSERT INTO instructor
    VALUES(2002, 'Bill', 'Johns', '111-111-2222', 'Bill@college.com', '08/21/1985', 1, 2002);
    INSERT INTO instructor
    VALUES(2003, 'Jane', 'Samuel', '111-222-2222', 'Jane@college.com', '07/14/1999', 2, 2002);
    INSERT INTO instructor
    VALUES(2004, 'John', 'James', '111-111-3333', 'John@college.com', '08/27/1980', 3, 2002);
    INSERT INTO instructor
    VALUES(2005, 'Jessica', 'Lopez', '111-111-4444', 'Jessica@college.com', '09/18/2000', 4, 2002);
    INSERT INTO instructor
    VALUES(2006, 'James', 'Robins', '111-111-5555', 'James@college.com', '06/14/1994', 5, 2002);
    INSERT INTO instructor
    VALUES(2007, 'Kyle', 'Mass', '111-111-6666', 'Kyle@college.com', '12/21/1989', 6, 2002);
    INSERT INTO instructor
    VALUES(2008, 'Will', 'Gold', '111-888-2222', 'Will@college.com', '02/15/1997', 1, 2002);
    INSERT INTO instructor
    VALUES(2009, 'Dan', 'White', '111-333-2222', 'Dan@college.com', '03/24/2007', 4, 2002);
    INSERT INTO instructor
    VALUES(2010, 'Jimmy', 'Woods', '222-111-2222', 'Jimmy@college.com', '04/08/2008', 2, 2002);
    INSERT INTO instructor
    VALUES(2011, 'Frank', 'Castle', '111-444-2222', 'Frank@college.com', '04/12/1992', 3, 2002);
    INSERT INTO instructor
    VALUES(2012, 'Steve', 'Rogers', '111-565-4789', 'Steve@college.com', '06/17/1982', 5, 2002);
    INSERT INTO instructor
    VALUES(2013, 'Peter', 'Parker', '111-111-1234', 'Peter@college.com', '09/27/1996', 6, 2002);
    
    SELECT * FROM instructor_has_course;
    INSERT INTO instructor_has_course
    VALUES(2002, 198101, '1:00PM - 2:20PM');
     INSERT INTO instructor_has_course
    VALUES(2008, 198201, '1:00PM - 2:20PM');
     INSERT INTO instructor_has_course
    VALUES(2008, 198385, '2:30PM - 3:50PM');
     INSERT INTO instructor_has_course
    VALUES(2003, 201101, '4:00PM - 5:20PM');
     INSERT INTO instructor_has_course
    VALUES(2010, 201101, '4:00PM - 5:20PM');
     INSERT INTO instructor_has_course
    VALUES(2010, 201201, '1:00PM - 2:20PM');
     INSERT INTO instructor_has_course
    VALUES(2004, 305101, '2:30PM - 3:50PM');
     INSERT INTO instructor_has_course
    VALUES(2011, 305101, '1:00PM - 2:20PM');
    INSERT INTO instructor_has_course
    VALUES(2011, 305102, '2:30PM - 3:50PM');
    INSERT INTO instructor_has_course
    VALUES(2007, 190101, '1:00PM - 2:20PM');
    INSERT INTO instructor_has_course
    VALUES(2013, 190201, '1:00PM - 2:20PM');
    INSERT INTO instructor_has_course
    VALUES(2013, 190101, '2:20PM - 3:50PM');
    INSERT INTO instructor_has_course
    VALUES(2005, 180101, '1:00PM - 2:20PM');
    INSERT INTO instructor_has_course
    VALUES(2009, 180101, '1:00PM - 2:20PM');
    INSERT INTO instructor_has_course
    VALUES(2009, 180201, '2:20PM - 3:50PM');
    INSERT INTO instructor_has_course
    VALUES(2006, 175100, '4:00PM - 5:20PM');
    INSERT INTO instructor_has_course
    VALUES(2012, 175100, '1:00PM - 2:20PM');
    INSERT INTO instructor_has_course
    VALUES(2012, 175201, '2:20PM - 3:50PM');
    
    Select * From head_of_department;
    INSERT INTO head_of_department
    VALUES(311, 2002, 1);
    INSERT INTO head_of_department
    VALUES(312, 2003, 2);
    INSERT INTO head_of_department
    VALUES(313, 2004, 3);
    INSERT INTO head_of_department
    VALUES(314, 2005, 4);
    INSERT INTO head_of_department
    VALUES(315, 2006, 5);
    INSERT INTO head_of_department
    VALUES(316, 2007, 6);
    
    
    Select * From student;
    Insert into student
    value(10011, 'Bruce', 'Banner', '231-432-2134', 'Bruce@gmail.com', '09/14/2017');
    
    DELETE FROM student WHERE student_ID = 10011;
    
    UPDATE student
    SET
		Date_Enrollment = '06/14/20'
	WHERE
		Student_ID = 10008;
         UPDATE student
    SET
		Date_Enrollment = '07/30/18'
	WHERE
		Student_ID = 10009;
    
    