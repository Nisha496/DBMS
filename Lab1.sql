CREATE TABLE Department (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(100),
    office_location VARCHAR(100)
);

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

CREATE TABLE Faculty (
    faculty_id INT PRIMARY KEY,
    faculty_name VARCHAR(100),
    email VARCHAR(100),
    phone VARCHAR(15),
    department_id INT,
    FOREIGN KEY (department_id) REFERENCES Department(department_id)
);

CREATE TABLE Course (
    course_id INT PRIMARY KEY,
    course_name VARCHAR(100),
    credits INT,
    department_id INT,
    FOREIGN KEY (department_id) REFERENCES Department(department_id)
);

CREATE TABLE Enrollment (
    enrollment_id INT PRIMARY KEY,
    student_id INT,
    course_id INT,
    semester VARCHAR(20),
    enrollment_date DATE,
    FOREIGN KEY (student_id) REFERENCES Student(student_id),
    FOREIGN KEY (course_id) REFERENCES Course(course_id)
);

CREATE TABLE Result (
    result_id INT PRIMARY KEY,
    enrollment_id INT,
    marks INT,
    grade VARCHAR(5),
    FOREIGN KEY (enrollment_id) REFERENCES Enrollment(enrollment_id)
);

Insert Into Department values (1, 'Computer science', 'F block');
Insert Into Department values (2, 'Design', 'D block');
Insert Into Department values (3, 'Business', 'B block');

Insert Into Student values (111, 'Ash', 'ash@gmail.com', '978136464', '2004-09-2', 'Male', '1');
Insert Into Student values (121, 'May', 'May@gmail.com', '982762424', '2003-05-12', 'Female', '3');
Insert Into Student values (131, 'Max', 'max@gmail.com', '987412114', '2005-05-22', 'Male', '2');

Insert Into Faculty values (999, 'Mary', 'mary@gmail.com', '983762114', '1');
Insert Into Faculty values (998, 'Harry', 'harry@gmail.com', '971462114', '3');
Insert Into Faculty values (997, 'Grey', 'grey@gmail.com', '983356111', '1');

Insert Into Course values (50, 'Philosophy', '3', '2');
Insert Into Course values (52, 'Economics', '2', '3');
Insert Into Course values (54, 'DBMS', '3', '1');

Insert Into Enrollment values (44, '111', '50', '3', '2026-05-12');
Insert Into Enrollment values (56, '121', '52', '3', '2026-08-13');
Insert Into Enrollment values (57, '131', '54', '4', '2026-07-2');

Insert Into Result values (123, '44', '89', 'A');
Insert Into Result values (124, '56', '99', 'A');
Insert Into Result values (125, '57', '85', 'A');

SELECT * FROM Department;
SELECT * FROM Student;
SELECT * FROM Faculty;
SELECT * FROM Course;
SELECT * FROM Enrollment;
SELECT * FROM Result;

ALTER TABLE Student
ADD address VARCHAR(200);

ALTER TABLE Course
ADD duration INT;

ALTER TABLE Student
MODIFY phone VARCHAR(20);

ALTER TABLE Faculty
RENAME COLUMN faculty_name TO name;

DROP TABLE Result;

ALTER TABLE Student
DROP COLUMN address;




