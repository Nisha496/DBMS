USE student_db;

CREATE TABLE students (
    student_id INT PRIMARY KEY,
    student_name VARCHAR(50) NOT NULL,
    email VARCHAR(100),
    course VARCHAR(50),
    semester INT
);

SELECT * FROM students;



