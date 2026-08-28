
CREATE TABLE Student (
    student_id INT PRIMARY KEY,
    student_name VARCHAR(100),
    email VARCHAR(100),
    phone VARCHAR(15),
    date_of_birth DATE,
    gender VARCHAR(10),
    department_id INT,
    FOREIGN KEY (department_id) REFERENCES Department(department_id)
);

CREATE TABLE Result (
    result_id INT PRIMARY KEY,
    enrollment_id INT,
    marks INT,
    grade VARCHAR(5),
    FOREIGN KEY (enrollment_id) REFERENCES Enrollment(enrollment_id)
);

Insert Into Student values (111, 'Ash', 'ash@gmail.com', '978136464', '2004-09-2', 'Male', '1');
Insert Into Student values (121, 'May', 'May@gmail.com', '982762424', '2003-05-12', 'Female', '3');
Insert Into Student values (131, 'Max', 'max@gmail.com', '987412114', '2005-05-22', 'Male', '2');

Insert Into Result values (123, '44', '89', 'A');
Insert Into Result values (124, '56', '99', 'A');
Insert Into Result values (125, '57', '85', 'A');

SELECT * FROM Student;
SELECT * FROM Result;

SELECT Student_Name,
UPPER(Student_Name) AS Upper_case
FROM Student;

SELECT Student_Name,
LOWER(Student_Name) AS Lowercase_Name
FROM Student;

SELECT Student_Name,
LENGTH(Student_Name) AS Name_Length
FROM Student;

SELECT Student_Name,
SUBSTRING(Student_Name, 1, 5) AS First_Five_Characters
FROM Student;

SELECT Result_id,
Marks,
ROUND(Marks * 1.05) AS Bonus_Marks
FROM Result;

SELECT Result_id,
Marks / 10.0 AS Marks_Value,
CEIL(Marks / 10.0) AS Rounded_Up
FROM Result;

SELECT Result_id,
Marks / 10.0 AS Marks_Value,
FLOOR(Marks / 10.0) AS Rounded_Down
FROM Result;

SELECT Result_id,
Marks,
MOD(Marks, 10) AS Remainder
FROM Result;

SELECT Result_id,
Marks,
ABS(Marks - 80) AS Difference_From_80
FROM Result;

SELECT Student_Name,
date_of_Birth,
YEAR(date_of_Birth) AS Birth_Year
FROM student;

SELECT Student_Name,
date_of_Birth,
MONTH(date_of_Birth) AS Birth_Month
FROM Student;

SELECT Student_Name,
date_of_Birth,
Day(date_of_Birth) AS Birth_Day
FROM Student;

SELECT Student_Name,
date_of_Birth,
TIMESTAMPDIFF(YEAR, Date_of_Birth, CURDATE()) AS Age
FROM Student;

SELECT CURDATE() AS Today;

SELECT COUNT(*) AS Total_Students
FROM Student;

SELECT SUM(Marks) AS Total_Marks
FROM Result;

SELECT Avg(Marks) AS Avg_Marks
FROM Result;

SELECT MAX(Marks) AS Highest_Marks
FROM Result;

SELECT Min(Marks) AS Lowest_Marks
FROM Result;
