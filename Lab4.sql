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

CREATE TABLE Department (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(100),
    office_location VARCHAR(100)
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

Insert Into Department values (1, 'Computer science', 'F block');
Insert Into Department values (2, 'Design', 'D block');
Insert Into Department values (3, 'Business', 'B block');

Insert Into Result values (123, '44', '89', 'A');
Insert Into Result values (124, '56', '99', 'A');
Insert Into Result values (125, '57', '85', 'A');

SELECT * FROM Student;
SELECT * FROM Result;
SELECT * FROM Department;

Select student_name, email
From Student;

Select *
From Student
Where gender = 'Male';

Select *
From Student
Order BY student_name;

Select student_name, Count(*)
From Student
Group By student_name;

Select Student.student_name,
Department.department_id
From Student
INNER JOIN Department
ON Student.department_id =
Department.department_id;

Select Student.student_name,
Department.department_id
From Student
LEFT JOIN Department
ON Student.department_id =
Department.department_id;

Select Student.student_name,
Department.department_id
From Student
RIGHT JOIN Department
ON Student.department_id =
Department.department_id;

SELECT 
S1.student_name AS Student1,
S2.student_name AS Student2,
S1.department_id
FROM Student S1
JOIN Student S2
ON S1.department_id = S2.department_id
AND S1.student_id < S2.student_id;

SELECT student_id, student_name, department_id
FROM Student;

Create USER 'Ash'@'localhost'
IDENTIFIED BY 'password';

GRANT SELECT
ON Hotel.Student
TO 'Ash'@'localhost';

GRANT SELECT, INSERT, UPDATE
ON Hotel.Student
TO 'Ash'@'localhost';

REVOKE SELECT
ON Hotel.Student
FROM 'Ash'@'localhost';

GRANT All
ON Hotel.Student
TO 'Ash'@'localhost';

COMMIT;

Rollback;
























