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

UPDATE Student 
SET email = 'Ashbro@gmail.com' 
WHERE student_id = 111;


UPDATE Course 
SET credits = 5 
WHERE course_id = 50;


UPDATE Faculty 
SET Phone = '922334455' 
WHERE faculty_id = 997;


DELETE FROM Result
WHERE result_id = 124;


DELETE FROM Enrollment 
WHERE enrollment_id = 56;


DELETE FROM Course 
WHERE course_id = 52;