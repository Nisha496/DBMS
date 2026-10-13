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

CREATE TABLE IF NOT EXISTS StudentLog (
    message VARCHAR(100)
);

DELIMITER //

CREATE TRIGGER BeforeInsert
BEFORE INSERT ON Student
FOR EACH ROW
BEGIN
    IF NEW.student_id <= 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Invalid Student ID';
    END IF;
END //

DELIMITER ;

DELIMITER //

CREATE TRIGGER AfterInsert
AFTER INSERT ON Student
FOR EACH ROW
BEGIN
    INSERT INTO StudentLog
    VALUES (CONCAT('Inserted: ', NEW.student_name));
END //

DELIMITER ;

DELIMITER //

CREATE TRIGGER BeforeUpdate
BEFORE UPDATE ON Student
FOR EACH ROW
BEGIN
    IF NEW.email IS NULL OR NEW.email = '' THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Email cannot be empty';
    END IF;
END //

DELIMITER ;

DELIMITER //

CREATE TRIGGER AfterUpdate
AFTER UPDATE ON Student
FOR EACH ROW
BEGIN
    INSERT INTO StudentLog
    VALUES (CONCAT('Updated: ', NEW.student_name));
END //

DELIMITER ;

DELIMITER //

CREATE TRIGGER BeforeDelete
BEFORE DELETE ON Student
FOR EACH ROW
BEGIN
    IF OLD.student_id = 111 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Cannot delete this student';
    END IF;
END //

DELIMITER ;

DELIMITER //

CREATE TRIGGER AfterDelete
AFTER DELETE ON Student
FOR EACH ROW
BEGIN
    INSERT INTO StudentLog
    VALUES (CONCAT('Deleted: ', OLD.student_name));
END //

DELIMITER ;

SELECT * FROM StudentLog;
