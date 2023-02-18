CREATE USER Dumbledore IDENTIFIED BY Phoenix;
GRANT UNLIMITED TABLESPACE TO Dumbledore;
GRANT CREATE TABLE TO Dumbledore;


CREATE TABLE House (
  H_Id NUMBER(2) PRIMARY KEY,
  H_Name VARCHAR2(20) NOT NULL,
  H_Points NUMBER(3)
);

CREATE TABLE Student (
  S_Id NUMBER(2) PRIMARY KEY,
  S_Name VARCHAR2(20),
  S_CGPA NUMBER(3,2) CHECK (S_CGPA <= 4.00),
  S_BloodStatus VARCHAR2(20),
  H_No NUMBER(2) REFERENCES House(H_Id)
);

INSERT INTO House (H_Id, H_Name, H_Points) VALUES (11, 'Gryffindor', 892);
INSERT INTO House (H_Id, H_Name, H_Points) VALUES (22, 'Hufflepuf', 785);
INSERT INTO House (H_Id, H_Name, H_Points) VALUES (33, 'Ravenclaw', 789);
INSERT INTO House (H_Id, H_Name, H_Points) VALUES (44, 'Slytherin', 850);

INSERT INTO Student (S_Id, S_Name, S_CGPA, S_BloodStatus, H_No) VALUES (2, 'Harry', 3.45, 'Halfblood', 11);
INSERT INTO Student (S_Id, S_Name, S_CGPA, S_BloodStatus, H_No) VALUES (7, 'Ron', 3.01, 'Pureblood', 11);
INSERT INTO Student (S_Id, S_Name, S_CGPA, S_BloodStatus, H_No) VALUES (12, 'Hannah', NULL, 'Pureblood', 22);
INSERT INTO Student (S_Id, S_Name, S_CGPA, S_BloodStatus, H_No) VALUES (17, 'Cedric', 3.78, 'Pureblood', 22);
INSERT INTO Student (S_Id, S_Name, S_CGPA, S_BloodStatus, H_No) VALUES (22, 'Cho', 3.55, 'Muggleborn', 33);
INSERT INTO Student (S_Id, S_Name, S_CGPA, S_BloodStatus, H_No) VALUES (27, 'Luna', 2.89, NULL, 33);
INSERT INTO Student (S_Id, S_Name, S_CGPA, S_BloodStatus, H_No) VALUES (32, 'Draco', 3.88, 'Pureblood', 44);
INSERT INTO Student (S_Id, S_Name, S_CGPA, S_BloodStatus, H_No) VALUES (37, 'Goyle', 2.10, 'Pureblood', 44);

Write a query to display the student name and their CGPA multiplied by 100.
SELECT S_Name, S_CGPA*100 AS CGPAx100
FROM Student;

Write a query to display the House name and House points concatenated together with a colon separator.
SELECT H_Name || ': ' || H_Points AS HouseInfo
FROM House;

Write a query to display the student name and blood status with column aliases "Name" and "Blood".
SELECT S_Name AS Name, S_BloodStatus AS Blood
FROM Student;

Write a query to display the student names that start with "H"
SELECT S_Name
FROM Student
WHERE S_Name LIKE 'H%';

Write a query to display the students who do not have a CGPA.
SELECT S_Name
FROM Student
WHERE S_CGPA IS NULL;

Write a query to display the student name, blood status and House number, ordered by House number in ascending order.
SELECT S_Name, S_BloodStatus, H_No
FROM Student
ORDER BY H_No ASC;

Write a query to display the first two characters of the House name and House points for all Houses.
SELECT SUBSTR(H_Name, 1, 2) AS HouseInit, H_Points
FROM House;

Write a query to display the House name and House points, with the House name replaced with "Unknown" if it is null.
SELECT NVL(H_Name, 'Unknown') AS House, H_Points
FROM House;

Write a query to display the maximum House points.
SELECT MAX(H_Points) AS MaxPoints
FROM House;

Find the sum of all students CGPA.
SELECT SUM(S_CGPA) as TotalGrade From Student;

Write a query to display the number of students in each House.
SELECT H_No, COUNT(*) AS NumStudents
FROM Student
GROUP BY H_No;

Write a query to display the House name and total House points, but only for Houses with total points greater than 800.
SELECT H_Name, SUM(H_Points) AS TotalPoints
FROM House
GROUP BY H_Name
HAVING SUM(H_Points) > 800;

