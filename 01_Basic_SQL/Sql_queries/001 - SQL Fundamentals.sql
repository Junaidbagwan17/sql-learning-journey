CREATE DATABASE EnterpriseAnalytics;
USE enterpriseanalytics;

CREATE TABLE employees(
    employee_id INT ,
    employee_name VARCHAR(50)
);

ALTER TABLE employees
ADD PRIMARY KEY(employee_id);


ALTER TABLE employees
ADD department VARCHAR(50);


ALTER TABLE employees
ADD salary DECIMAL(10,2);

ALTER TABLE employees
ADD joining_date DATE;


INSERT INTO employees (employee_id, employee_name,department, salary, joining_date)
VALUE (101, 'Rahul' , 'IT' , 55000, '2024-06-15');

SELECT * 
FROM employees;

SELECT employee_name, salary
FROM employees;

INSERT INTO employees(employee_id ,employee_name, department,salary,joining_date)
VALUES (102, 'Priya', 'HR', 48000, '2025-01-10');

-- # show me the unique department from TABLE

SELECT DISTINCT department 
FROM employees;


-- Retrieve all information about employees who work in the IT department.
SELECT * 
FROM employees 
WHERE department='IT';

-- Find the employee whose employee_id is 102.
SELECT employee_name 
FROM employees
WHERE employee_id = 102;



-- salary is greater than 50,000
SELECT employee_name 
FROM employees
WHERE salary > 50000;


SELECT employee_name
FROM employees
WHERE salary < 50000;


SELECT employee_name 
FROM employees 
WHERE salary <= 55000;



-- Find employees who are not in the IT department.
SELECT employee_name 
FROM employees
WHERE department <> 'IT';


-- Find employees who work in IT AND earn more than ₹50,000.
SELECT employee_name
From employees
WHERE department = 'IT' AND salary > 50000;

-- Find the names of employees who work in: IT OR HR

SELECT employee_name
FROM employees 
WHERE department = 'IT' OR department='HR';


-- Find the names of employees who are NOT in the IT department.

SELECT employee_name
FROM employees 
WHERE NOT department = 'IT';


-- Find the names of employees whose department is either:IT HR
SELECT employee_name
FROM employees
WHERE department IN ('IT', 'HR');

-- "Salary between 48,000 and 55,000

SELECT employee_name 
FROM employees 
WHERE salary BETWEEN 48000 AND 55000; 


-- Find employees whose name starts with R.

SELECT employee_name
FROM employees
WHERE employee_name LIKE 'R%';


-- Find employees whose name ends with a.
SELECT employee_name 
FROM employees
WHERE employee_name LIKE '%a';

-- Find employees whose name has exactly 5 characters.
SELECT employee_name
FROM employees
WHERE employee_name LIKE '_____';


INSERT INTO employees(employee_id,employee_name,department,salary,joining_date)
VALUES (103, 'Amit', NULL, 52000, '2025-03-01');


-- Find the names of employees whose department is unknown.

SELECT employee_name
FROM employees
WHERE department IS NULL;

-- Find the names of employees whose department is known, meaning it is NOT NULL.
SELECT employee_name
FROM employees
WHERE department IS NOT NULL;


-- Display all employees' names and salaries, with the highest salary first.
SELECT employee_name, salary
FROM employees
ORDER BY salary DESC;


-- Display employee names and salaries with the lowest salary first.

SELECT employee_name, salary
FROM employees
ORDER BY salary ASC;


-- Show the 2 highest-paid employees, displaying their name and salary.
SELECT employee_name , salary
FROM employees
ORDER BY salary DESC 
LIMIT 2;


-- How many employees are currently in the employees table?
SELECT COUNT(*)
FROM employees;

-- How many employees have a department value? non null count?
SELECT COUNT(department)
FROM employees;

-- What is the total salary of all employees?
SELECT SUM(salary)
FROM employees;

-- Write a query to find the average salary of all employees.

SELECT AVG(salary)
FROM employees;

-- write a query to find the highest salary.
SELECT MAX(salary)
FROM employees;

SELECT MIN(salary)
FROM employees;

SELECT
    SUM(salary),
    AVG(salary),
    MAX(salary),
    MIN(salary)
FROM employees;

-- Department and the total salary for each department.

SELECT department, SUM(salary)
FROM employees
GROUP BY department;


SELECT department, AVG(salary)
FROM employees 
GROUP BY department;

-- Find the highest salary in each department.

SELECT department, MAX(salary)
FROM employees
GROUP BY department;

-- "Show only departments whose average salary is greater than ₹50,000."

SELECT department, AVG(salary)
FROM employees
GROUP BY department
HAVING AVG(salary) > 50000;

-- Show departments where the total salary is greater than ₹50,000.
SELECT department, AVG(salary)
FROM employees
GROUP BY department
HAVING AVG(salary) < 50000;

-- Show departments where the total salary is greater than ₹50,000.
SELECT department, SUM(salary)
FROM employees 
GROUP BY department
HAVING SUM(salary) > 50000;


-- JOINS

CREATE TABLE department(
    department_id INT,
    department_name VARCHAR(50)
);


ALTER TABLE department
ADD PRIMARY KEY(department_id);


INSERT INTO department(department_id, department_name)
VALUES
 (1 ,'IT'), 
 (2, 'HR'),
 (3, 'Finanace'),
 (4, 'Marketing');

-- spelll correction for 3rd row

 UPDATE department
 SET department_name='Finance'
 WHERE department_id =3;


SELECT * FROM department;

ALTER TABLE employees
ADD department_id INT;

UPDATE employees
SET department_id = 1
WHERE employee_id = 101; 


UPDATE employees
SET department_id = 2
WHERE employee_id =102;

ALTER TABLE employees
ADD FOREIGN KEY (department_id)
REFERENCES department(department_id);



SELECT department.department_id, employees.employee_id , employees.employee_name, department.department_name
FROM department
INNER JOIN employees
ON department.department_id = employees.department_id;


SELECT employees.employee_name, department.department_name
FROM employees
LEFT JOIN department
ON employees.department_id = department.department_id ;


SELECT employees.employee_name, department.department_name
FROM employees
RIGHT JOIN department
ON employees.department_id = department.department_id;

-- Show the employee name, salary, and department name for employees who are assigned to a department.
SELECT employees.employee_name, employees.salary, department.department_name
FROM employees
INNER JOIN department
ON employees.department_id = department.department_id;


-- Show the names and salaries of employees who work in the IT department.
SELECT employees.employee_name, employees.salary, department.department_name
FROM employees
INNER JOIN department
ON department.department_id = employees.department_id
WHERE department.department_name = 'IT';

-- How many employees are there in each department?

SELECT department.department_name , COUNT(department.department_name)
FROM employees
INNER JOIN department
ON department.department_id = employees.department_id
GROUP BY department.department_name;

-- Find employees whose salary is greater than the overall average salary.
SELECT employee_name, salary
FROM employees
WHERE salary > ( 
    SELECT AVG(salary)
    FROM employees
);


-- Find the employee(s) who have the highest salary
SELECT employee_name, salary
FROM employees
WHERE salary = (
    SELECT MAX(salary)
    FROM employees
);


-- Find the employee who has the second-highest salary.
SELECT employee_name , salary
FROM employees
WHERE salary = (
    SELECT salary
    FROM employees
    ORDER BY salary DESC
    LIMIT 1 OFFSET 1
);

-- Write a query to find the second-highest distinct salary from employees.
SELECT employee_name, salary
FROM employees
WHERE salary = (
    SELECT DISTINCT(salary)
    FROM employees
    ORDER BY salary DESC
    LIMIT 1 OFFSET 1
);

-- Find employees who work in departments whose average salary is greater than 70,000.

SELECT employee_name, salary
FROM employees
WHERE department_id IN (
    SELECT department_id
    FROM employees
    GROUP BY department_id
    HAVING AVG(salary) > 50000);  

SELECT department_id, AVG(salary)
FROM employees
GROUP BY department_id;

-- Find employees who do not belong to department 1 or department 2, using a subquery.
SELECT employee_name
FROM employees
WHERE department_id NOT IN (
    SELECT department_id
    FROM department
    WHERE department_id IN (1, 2)
);


-- //--------------------

DELETE FROM employees;
DELETE FROM department;

INSERT INTO department (department_id, department_name)
VALUES
(1, 'Engineering'),
(2, 'Data Science'),
(3, 'Operations'),
(4, 'Finance'),
(5, 'Human Resources'),
(6, 'Marketing'),
(7, 'Customer Experience'),
(8, 'Cyber Security'),
(9, 'Legal'),
(10, 'Procurement');


-- Just add the missing column.

ALTER TABLE employees
ADD COLUMN city VARCHAR(30);


INSERT INTO employees
(employee_id, employee_name, department_id, salary, joining_date, city)
VALUES
(1001, 'Rahul Sharma', 1, 85000, '2021-06-15', 'Mumbai'),
(1002, 'Priya Mehta', 2, 92000, '2022-01-10', 'Pune'),
(1003, 'Amit Verma', 3, 58000, '2023-03-20', 'Mumbai'),
(1004, 'Sneha Patil', 5, 62000, '2022-08-14', 'Nashik'),
(1005, 'Karan Shah', 6, 70000, '2021-11-05', 'Mumbai'),
(1006, 'Rohit Joshi', 1, 98000, '2020-04-18', 'Bengaluru'),
(1007, 'Anjali Desai', 2, 88000, '2023-07-11', 'Pune'),
(1008, 'Vikram Singh', 3, 65000, '2022-05-27', 'Delhi'),
(1009, 'Pooja Nair', 4, 76000, '2021-09-03', 'Mumbai'),
(1010, 'Aditya Kulkarni', 1, 105000, '2019-12-16', 'Bengaluru'),
(1011, 'Meera Iyer', 7, 59000, '2024-02-12', 'Chennai'),
(1012, 'Nikhil Rao', 8, 91000, '2020-10-21', 'Hyderabad'),
(1013, 'Riya Kapoor', 6, 68000, '2023-01-17', 'Delhi'),
(1014, 'Sahil Khan', 3, 54000, '2024-06-25', 'Mumbai'),
(1015, 'Divya Menon', 2, 97000, '2021-03-09', 'Bengaluru'),
(1016, 'Arjun Malhotra', 1, 112000, '2018-07-30', 'Pune'),
(1017, 'Neha Gupta', 5, 57000, '2024-01-15', 'Delhi'),
(1018, 'Sameer Chavan', 3, 61000, '2023-09-18', 'Mumbai'),
(1019, 'Kavya Reddy', 2, 84000, '2022-11-07', 'Hyderabad'),
(1020, 'Manish Agarwal', 4, 73000, '2020-06-22', 'Delhi'),
(1021, 'Tanvi Joshi', 7, 63000, '2023-04-13', 'Pune'),
(1022, 'Harsh Patel', 8, 99000, '2021-02-28', 'Ahmedabad'),
(1023, 'Isha Shah', 6, 75000, '2022-10-05', 'Mumbai'),
(1024, 'Akash Yadav', 1, 89000, '2023-06-19', 'Lucknow'),
(1025, 'Komal Deshmukh', 5, 66000, '2022-12-01', 'Pune'),
(1026, 'Varun Bhat', 3, 59000, '2024-03-11', 'Bengaluru'),
(1027, 'Shreya Naik', 7, 72000, '2021-08-23', 'Mumbai'),
(1028, 'Deepak Soni', 4, 81000, '2019-05-14', 'Jaipur'),
(1029, 'Nandini Rao', 2, 93000, '2020-09-29', 'Hyderabad'),
(1030, 'Yash Patil', 1, 102000, '2022-07-07', 'Mumbai'),
(1031, 'Ayesha Khan', 8, 87000, '2023-02-16', 'Mumbai'),
(1032, 'Mohit Jain', 6, 64000, '2024-05-20', 'Delhi'),
(1033, 'Simran Kaur', 7, 60000, '2023-11-12', 'Chandigarh'),
(1034, 'Rakesh Pawar', 3, 56000, '2024-07-01', 'Pune'),
(1035, 'Pallavi Joshi', 5, 71000, '2021-01-25', 'Mumbai'),
(1036, 'Dev Mehta', 1, 118000, '2017-08-09', 'Bengaluru'),
(1037, 'Ananya Roy', 2, 101000, '2019-11-18', 'Kolkata'),
(1038, 'Raj Malhotra', 4, 78000, '2022-03-15', 'Delhi'),
(1039, 'Mansi Shah', 6, 69000, '2023-08-28', 'Mumbai'),
(1040, 'Abhishek Gupta', NULL, 55000, '2025-01-10', 'Mumbai');


SELECT * FROM department;
-- Find employees who earn more than the average salary of their own department.
SELECT employee_name, salary
FROM employees AS e
WHERE e.salary > (
    SELECT AVG(e2.salary)
    FROM employees AS e2
    WHERE e2.department_id = e.department_id);


-- Write a query to display: Employee Name | Department IDas one combined column like:
USE enterpriseanalytics;

SELECT CONCAT(employee_name, ' - ' ,department_id) AS emp_dept
FROM employees;

-- employee_name and the length of each employee's name.
SELECT employee_name , LENGTH(employee_name) AS name_length
FROM employees;


-- Display the first 3 characters of every employee's name.
SELECT SUBSTRING(employee_name, 1, 3)
FROM employees;


-- Display the employee names after removing leading and trailing spaces using TRIM().
SELECT TRIM(employee_name) 
FROM employees;

-- Display employee_name, but replace every space ' ' in the name with an underscore '_'.
SELECT REPLACE(employee_name, ' ', '_')
FROM employees;


-- Display: employee_name | city | salary as one column with | between each value.

SELECT CONCAT_WS(' | ' , employee_name, city, salary) AS emp_info
FROM employees;

-- show employee_name and the year in which they joined.
SELECT employee_name,
    YEAR(joining_date) AS year_joined
FROM employees;

-- employee_name and the number of days since they joined the company.

SELECT employee_name,
    DATEDIFF(CURDATE(), joining_date) AS since_joined
 FROM employees;



-- example extra 
SELECT employee_name,
       YEAR(joining_date) AS joining_year,
       MONTH(joining_date) AS joining_month,
       DAY(joining_date) AS joining_day
FROM employees;

-- employee_name and their joining date + 1 year.
SELECT employee_name, 
    DATE_ADD(joining_date , INTERVAL 1 YEAR)
FROM employees;


-- employee_name and the date 6 months after their joining date.
SELECT employee_name,
DATE_ADD(joining_date, INTERVAL 6  MONTH)
FROM employees;

-- Display:employee_name and joining_date in this format June 15, 2021:
SELECT employee_name,
       DATE_FORMAT(joining_date, '%M %d, %Y') AS formatted_date
FROM employees;

-- employee_name and the month number in which they joined.
SELECT employee_name,
    EXTRACT(month FROM joining_date) AS joining_month
FROM employees;

-- Find employees who joined after January 1, 2022
SELECT employee_name
FROM employees
WHERE joining_date > '2022-01-01';

-- Find employees who joined between January 1, 2021 and December 31, 2022.
SELECT employee_name
FROM employees
WHERE joining_date BETWEEN '2021-01-01' AND '2022-12-31';


USE enterpriseanalytics;


-- Display each employee's name, salary, and a row number based on salary from highest to lowest.

SELECT employee_name, salary,
    ROW_NUMBER() OVER(ORDER BY salary DESC) 
FROM employees;

-- Display employee_name, department_id, salary, and a row number for each employee, where the row number restarts from 1 for every department. Within each department, highest salary should get number 1.

SELECT employee_name, salary, department_id,
    ROW_NUMBER() OVER (
        PARTITION BY department_id
        ORDER BY salary DESC
    )
FROM employees;


-- Display employee_name, salary, and their salary rank from highest to lowest using RANK().

SELECT employee_name, salary,
     RANK() OVER (
        ORDER BY salary DESC
     )
FROM employees;


-- Display employee_name, salary, and the dense rank of each employee based on salary from highest to lowest.

SELECT employee_name, salary ,
    DENSE_RANK() OVER(
        ORDER BY salary DESC
    ) AS row_rank
FROM employees;


-- Who is the highest-paid employee in each department?
-- Display employee_name, department_id, salary, and the dense rank of each employee within their department, with the highest salary ranked 1.

SELECT employee_name, salary,
    DENSE_RANK() OVER(
        PARTITION BY department_id
        ORDER BY salary DESC
    ) AS row_rank
FROM employees;

-- Display employee_name, joining_date, salary, and a running total of salary, ordered by joining_date from oldest employee to newest.
SELECT employee_name, joining_date, salary,
    SUM(salary) OVER(
        ORDER BY joining_date ASC
    ) AS run_total
FROM employees;

-- Display employee_name, joining_date, salary, and the previous employee's salary, ordered by joining_date from oldest to newest.

SELECT  employee_name, joining_date, salary,
    LAG(salary) OVER(
        ORDER BY joining_date ASC
    ) AS previous_salary    
FROM employees;


-- Display employee_name, joining_date, salary, and the next employee's salary, ordered by joining date from oldest to newest.
SELECT  employee_name, joining_date, salary,
    LEAD(salary) OVER(
        ORDER BY joining_date ASC
    ) AS next_row_salary    
FROM employees;


-- Display employee_name, salary, the previous employee's salary, and the difference between current salary and previous salary, ordered by joining date.
SELECT employee_name, salary,
salary - LAG(salary) OVER (
    ORDER BY joining_date) AS salary_diffr
FROM employees;



-- Display employee_name, salary, and the highest salary in the entire employee table beside every employee using FIRST_VALUE().

SELECT employee_name, salary,
FIRST_VALUE(salary) OVER(
    ORDER BY salary DESC
) highest_salary_value
FROM employees;


-- Display employee_name, salary, and the lowest salary in the entire employee table beside every employee using LAST_VALUE().

SELECT employee_name, salary,
LAST_VALUE(salary) OVER (
    ORDER BY salary DESC
    ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING
) AS lowest_salary
FROM employees;

-- Create a CTE called dept_avg containing: department_id , average salary as avg_salary
-- Then display everything from the CTE.
USE enterpriseanalytics;

WITH dept_avg AS (
    SELECT department_id, AVG(salary)
    FROM employees
    GROUP BY department_id
    )
SELECT * FROM dept_avg;

-- Find employees whose salary is greater than their department's average salary.
WITH avg_of_dept AS(
    SELECT department_id, AVG(salary) AS avg_salary
    FROM employees
    GROUP BY department_id
)
SELECT employees.employee_name,
       employees.salary,
       avg_of_dept.avg_salary,
       avg_of_dept.department_id
FROM employees
INNER JOIN avg_of_dept
ON employees.department_id = avg_of_dept.department_id
WHERE employees.salary > avg_of_dept.avg_salary;


-- Step 1: Create a CTE called dept_avg containing each department's average salary.
WITH dept_avg AS(
    SELECT department_id, AVG(salary) AS avg_salary
    FROM employees
    GROUP BY department_id
),
-- Step 2: Create another CTE called high_avg_dept containing only departments whose average salary is greater than 70000.
high_avg_dept AS (
    SELECT department_id, avg_salary
    FROM dept_avg
    WHERE avg_salary > 70000
)
-- Step 3: Display the department IDs and average salaries from high_avg_dept.
SELECT department_id, avg_salary
FROM high_avg_dept;



-- Find the departments whose total salary is greater than ₹300,000 using a CTE.

WITH  dept_total AS(
    SELECT department_id , SUM(salary) AS total_salary
    FROM employees
    GROUP BY department_id
)
SELECT department_id, total_salary 
FROM dept_total
WHERE total_salary > 300000;

-- Find the average salary of employees in Mumbai.
-- The CTE should calculate the average salary for Mumbai, and the main query should display the result.

WITH mumbai_avg AS (
    SELECT city, AVG(salary) AS avg_salary
    FROM employees
    WHERE city = 'Mumbai'
)
SELECT avg_salary FROM mumbai_avg;



-- Using a CTE, find the highest-paid employee in each department.
-- The CTE should calculate the maximum salary for each department_id.
WITH dept_high_pay AS(
    SELECT department_id, MAX(salary) AS max_salary
    FROM employees
    GROUP BY department_id
)

SELECT employees.department_id, employees.employee_name, max_salary
FROM employees
JOIN dept_high_pay
ON employees.department_id = dept_high_pay.department_id
AND salary = max_salary;


-- Find the cities where the average salary is greater than ₹75,000.
WITH city_avg AS (
    SELECT city, AVG(salary) AS avg_salary
    FROM employees
    GROUP BY city
)

SELECT city, avg_salary 
FROM city_avg
WHERE avg_salary > 75000;
-- Using UNION, return all unique department_id values from both employees and department.

USE enterpriseanalytics;
SELECT department_id
FROM employees

UNION

SELECT department_id
FROM department;

-- So UNION ALL doesn't perform duplicate removal.
SELECT department_id
FROM employees

UNION ALL

SELECT department_id
FROM department;
-- Using your actual database, write a UNION query that combines:

SELECT employee_id, employee_name
FROM employees
UNION
SELECT department_id, department_name 
FROM department;


SELECT employee_name
FROM employees
WHERE city = 'Mumbai'
UNION
SELECT employee_name
FROM employees
WHERE city = 'Pune';



-- Find all unique cities that appear in the employees table.


SELECT city               
FROM employees
UNION
SELECT city
FROM employees;

SELECT DISTINCT(city)
FROM employees;

-- Using employees, combine employees from Mumbai and Pune with UNION, and sort the final result by 
-- employee_name alphabetically

SELECT employee_name
FROM employees
WHERE city = 'Mumbai'
UNION
SELECT employee_name
FROM employees
WHERE city = 'Pune'

ORDER BY employee_name;



SELECT employee_name, city
FROM employees
WHERE city = 'Mumbai'
UNION
SELECT employee_name, city
FROM employees
WHERE city = 'Pune'

ORDER BY city, employee_name;