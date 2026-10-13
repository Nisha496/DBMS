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

DROP PROCEDURE IF EXISTS
DisplayStudents;

USE hotel;

USE hotel;

DROP PROCEDURE IF EXISTS InsertStudent;

DELIMITER //

CREATE PROCEDURE InsertStudent(
    IN s_id INT,
    IN s_name VARCHAR(100),
    IN s_email VARCHAR(100),
    IN s_phone VARCHAR(15),
    IN s_dob DATE,
    IN s_gender VARCHAR(10),
    IN s_dept INT
)
BEGIN
    INSERT INTO Student
    VALUES (s_id, s_name, s_email, s_phone, s_dob, s_gender, s_dept);
END //

DELIMITER ;

CALL InsertStudent(
    141, 'Andy', 'andy@gmail.com',
    '9876543210', '2004-06-15', 'Male', 1
);

SELECT * FROM Student;

DELIMITER //

CREATE PROCEDURE UpdateStudent(
    IN sid INT,
    IN newemail VARCHAR(100)
)
BEGIN
    UPDATE Student
    SET email = newemail
    WHERE student_id = sid;
END //

DELIMITER ;

CALL UpdateStudent(111, 'ashnew@gmail.com');

SELECT * FROM Student;

DELIMITER //

CREATE PROCEDURE DeleteStudent(IN sid INT)
BEGIN
    DELETE FROM Student
    WHERE student_id = sid;
END //

DELIMITER ;

CALL DeleteStudent(141);

SELECT * FROM Student;

