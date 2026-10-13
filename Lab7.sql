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

Insert Into Student values (111, 'Ash', 'ash@gmail.com', '978136464', '2004-09-2', 'Male', '1');
Insert Into Student values (121, 'May', 'May@gmail.com', '982762424', '2003-05-12', 'Female', '3');
Insert Into Student values (131, 'Max', 'max@gmail.com', '987412114', '2005-05-22', 'Male', '2');

Insert Into Faculty values (999, 'Mary', 'mary@gmail.com', '983762114', '1');
Insert Into Faculty values (998, 'Harry', 'harry@gmail.com', '971462114', '3');
Insert Into Faculty values (997, 'Grey', 'grey@gmail.com', '983356111', '1');

SELECT * FROM Student;
SELECT * FROM Faculty;

SELECT Student.student_name,
       Student.gender,
       Faculty.name
FROM Student 
INNER JOIN Faculty
ON Student.department_id = Faculty.department_id;

SELECT Student.student_name,
       Student.gender,
       Faculty.name
FROM Student 
Left JOIN Faculty
ON Student.department_id = Faculty.department_id;

SELECT Student.student_name,
       Student.gender,
       Faculty.name
FROM Student 
Right JOIN Faculty
ON Student.department_id = Faculty.department_id;

SELECT Student.student_Name, Faculty.name
FROM Student 
CROSS JOIN Faculty;















