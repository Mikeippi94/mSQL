USE spring2021;
DESC employee;
SELECT * FROM employee;

SELECT COUNT(*) FROM employee;





CREATE TABLE referencebook
(
	id int(11) primary key,
    title varchar(30),
    subject varchar(30),
    duration decimal(4,2),
    upload_date date
);

DESC referencebook;
INSERT INTO referencebook
VALUES (1, 'Select Query', 'SQL', 4.56, '2013-08-08');
INSERT INTO referencebook
VALUES (2, 'Select Query', 'SQL', 4.56, '2013-08-08');
INSERT INTO referencebook
VALUES (3, 'Select Query', 'SQL', 4.56, '2013-08-08');
INSERT INTO referencebook
VALUES (4, 'Select Query', 'SQL', 4.56, '2013-08-08');
INSERT INTO referencebook
VALUES (5, 'Select Query', 'SQL', 4.56, '2013-08-08');
INSERT INTO referencebook
VALUES (6, 'Select Query', 'SQL', 4.56, '2013-08-08');
INSERT INTO referencebook
VALUES (7, 'Select Query', 'SQL', 4.56, '2013-08-08');
INSERT INTO referencebook
VALUES (8, 'Select Query', 'SQL', 4.56, '2013-08-08');
INSERT INTO referencebook
VALUES (9, 'Select Query', 'SQL', 4.56, '2013-08-08');
INSERT INTO referencebook
VALUES (10, 'Select Query', 'SQL', 4.56, '2013-08-08');
INSERT INTO referencebook
VALUES (11, 'Select Query', 'SQL', 4.56, '2013-08-08');
INSERT INTO referencebook
VALUES (12, 'Select Query', 'SQL', 4.56, '2013-08-08');
INSERT INTO referencebook
VALUES (13, 'Select Query', 'SQL', 4.56, '2013-08-08');
INSERT INTO referencebook
VALUES (14, 'Select Query', 'SQL', 4.56, '2013-08-08');
INSERT INTO referencebook
VALUES (15, 'Select Query', 'SQL', 4.56, '2013-08-08');
INSERT INTO referencebook
VALUES (16, 'Select Query', 'SQL', 4.56, '2013-08-08');
INSERT INTO referencebook
VALUES (17, 'Select Query', 'SQL', 4.56, '2013-08-08');

SELECT * FROM referencebook;

SELECT subject, COUNT(*) FROM referencebook GROUP BY subject;

SELECT DISTINCT salary FROM employee ORDER BY salary;

CREATE TABLE booksurvey
(
	id int(11) primary key,
    views int(11),
    likes int(11),
    dislikes int(11),
    shares int(11)
);

DESC booksurvey;

INSERT INTO booksurvey
VAlUES (1, 1500, 54, 13, 6);
INSERT INTO booksurvey
VAlUES (2, 1500, 54, 13, 6);
INSERT INTO booksurvey
VAlUES (3, 1500, 54, 13, 6);
INSERT INTO booksurvey
VAlUES (4, 1500, 54, 13, 6);
INSERT INTO booksurvey
VAlUES (5, 1500, 54, 13, 6);
INSERT INTO booksurvey
VAlUES (6, 1500, 54, 13, 6);
INSERT INTO booksurvey
VAlUES (7, 1500, 54, 13, 6);
INSERT INTO booksurvey
VAlUES (8, 1500, 54, 13, 6);
INSERT INTO booksurvey
VAlUES (9, 1500, 54, 13, 6);
INSERT INTO booksurvey
VAlUES (10, 1500, 54, 13, 6);
INSERT INTO booksurvey
VAlUES (11, 1500, 54, 13, 6);
INSERT INTO booksurvey
VAlUES (12, 1500, 54, 13, 6);
INSERT INTO booksurvey
VAlUES (13, 1500, 54, 13, 6);
INSERT INTO booksurvey
VAlUES (14, 1500, 54, 13, 6);
INSERT INTO booksurvey
VAlUES (15, 1500, 54, 13, 6);
INSERT INTO booksurvey
VAlUES (16, 1500, 54, 13, 6);
INSERT INTO booksurvey
VAlUES (17, 1500, 54, 13, 6);

SELECT * FROM booksurvey;

SELECT b.id, b.title, b.duuration, bs.views, bs.likes, bs.shares
FROM referencebook AS b
JOIN booksurvey AS bs
ON b.id = bs.id;