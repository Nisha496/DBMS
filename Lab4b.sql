CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100) UNIQUE,
    hire_date DATE,
    department_id INT
);

INSERT INTO employees VALUES 
  (101, 'Alice',   'Johnson',  'alice.j@company.com',   '2020-05-10', 1),
  (102, 'Bob',     'Smith',    'bob.s@company.com',     '2019-03-15', 2),
  (103, 'Charlie', 'Brown',    'charlie.b@company.com', '2021-07-20', 3),
  (104, 'Diana',   'Lee',      'diana.l@company.com',   '2018-11-01', 4),
  (105, 'Ethan',   'Miller',   'ethan.m@company.com',   '2022-01-12', 2),
  (106, 'Fiona',   'Davis',    'fiona.d@company.com',   '2020-09-23', 3),
  (107, 'George',  'Wilson',   'george.w@company.com',  '2021-04-18', 1),
  (108, 'Hannah',  'Moore',    'hannah.m@company.com',  '2019-08-30', 4),
  (109, 'Ivan',    'Taylor',   'ivan.t@company.com',    '2022-11-05', 3),
  (110, 'Julia',   'Anderson', 'julia.a@company.com',   '2023-02-10', 2);
  
Select * From employees;
  
SELECT employee_id, first_name, department_id
FROM employees
WHERE department_id > 2;

SELECT employee_id, first_name, department_id
FROM employees
WHERE department_id > '2';

SELECT employee_id, first_name,
CAST(hire_date AS CHAR) AS hire_date_text
FROM employees;

