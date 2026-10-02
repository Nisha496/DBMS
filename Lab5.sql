CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100) UNIQUE,
    hire_date DATE,
    department_id INT,
    Salary INT
);

INSERT INTO employees VALUES 
  (101, 'Alice',   'Johnson',  'alice.j@company.com',   '2020-05-10', 1, 50000),
  (102, 'Bob',     'Smith',    'bob.s@company.com',     '2019-03-15', 2, 50000),
  (103, 'Charlie', 'Brown',    'charlie.b@company.com', '2021-07-20', 3, 70000),
  (104, 'Diana',   'Lee',      'diana.l@company.com',   '2018-11-01', 4, 23000),
  (105, 'Ethan',   'Miller',   'ethan.m@company.com',   '2022-01-12', 2, 56000),
  (106, 'Fiona',   'Davis',    'fiona.d@company.com',   '2020-09-23', 3, 22000),
  (107, 'George',  'Wilson',   'george.w@company.com',  '2021-04-18', 1, 40000),
  (108, 'Hannah',  'Moore',    'hannah.m@company.com',  '2019-08-30', 4, 50000),
  (109, 'Ivan',    'Taylor',   'ivan.t@company.com',    '2022-11-05', 3, 50000),
  (110, 'Julia',   'Anderson', 'julia.a@company.com',   '2023-02-10', 2, 40000);
  
  Select * From employees;
  
SELECT
first_name,
Salary
FROM employees
WHERE salary > 50000;

SELECT
first_name,
Salary
FROM employees
WHERE salary > 50000
AND salary < 70000;

SELECT
first_name,
Salary
FROM employees
WHERE salary = 40000
OR salary = 70000;

SELECT
first_name,
Salary
FROM employees
WHERE salary BETWEEN 40000 AND 60000;

SELECT
first_name,
Salary
FROM employees
WHERE salary IN (40000, 70000);

SELECT
first_name
FROM employees
WHERE name LIKE 'A%';

SELECT *
FROM employees 
WHERE EXISTS (
SELECT 1
FROM employees
WHERE salary > 50000
);

SELECT
first_name
FROM employees
WHERE last_name IS NULL;

SELECT
first_name
FROM employees
WHERE last_name IS NOT NULL;


