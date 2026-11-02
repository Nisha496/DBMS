Create database student;

Use student;

CREATE TABLE Student (
    student_id INT,
    name VARCHAR(30),
    marks INT,
    department VARCHAR(30)
);

INSERT INTO Student VALUES
(1, 'John', 85, 'CSE'),
(2, 'Mary', 75, 'ISE'),
(3, 'David', 90, 'CSE'),
(4, 'Sara', 65, 'ECE'),
(5, 'Peter', 80, 'ISE');

SELECT * FROM Student
WHERE marks BETWEEN 70 AND 90;

SELECT * FROM Student
WHERE department IN ('CSE', 'ISE');

SELECT * FROM Student
WHERE name LIKE 'J%';

SELECT * FROM Student
WHERE department IS NULL;

SELECT * FROM Student s
WHERE EXISTS (
    SELECT * FROM Student
    WHERE marks > 85
);


