-- Instructions:
USE employee;

INSERT INTO departments (department_id, department_name) VALUES
(1, 'Software Development'),
(2, 'Marketing'),
(3, 'Data Science'),
(4, 'Human Resources'),
(5, 'Product Management'),
(6, 'Content Creation'),
(7, 'Finance'),
(8, 'Design'),
(9, 'Research and Development'),
(10, 'Customer Support'),
(11, 'Business Development'),
(12, 'IT'),
(13, 'Operations');

INSERT INTO location (location) VALUES
('Chennai'),
('Bangalore'),
('Hyderabad'),
('Pune');

INSERT INTO employees (employee_id, employee_name, gender, age, hire_date, designation, department_id, location_id, salary) VALUES
(5001, 'Vihaan Singh', 'M', 27, '2015-01-20', 'Data Analyst', 3, 4, 60000),
(5002, 'Reyansh Singh', 'M', 31, '2015-03-10', 'Network Engineer', 12, 1, 80000),
(5003, 'Aaradhya Iyer', 'F', 26, '2015-05-20', 'Customer Support Executive', 10, 2, 45000),
(5004, 'Kiara Malhotra', 'F', 29, '2015-07-05', NULL, 8, 3, 70000),
(5005, 'Anvi Chaudhary', 'F', 25, '2015-09-11', 'Business Development Executive', 11, 1, 55000),
(5006, 'Dhruv Shetty', 'M', 28, '2015-11-20', 'UI Developer', 8, 2, 65000),
(5007, 'Anushka Singh', 'F', 32, '2016-01-15', 'Marketing Manager', 2, 3, 90000),
(5008, 'Diya Jha', 'F', 27, '2016-03-05', 'Graphic Designer', 8, 4, 70000),
(5009, 'Kiaan Desai', 'M', 30, '2016-05-20', 'Sales Executive', 11, 3, 55000),
(5010, 'Atharv Yadav', 'M', 29, '2016-07-10', 'Systems Administrator', 12, 4, 80000),
(5011, 'Saanvi Patel', 'F', 28, '2016-09-20', 'Marketing Analyst', 2, 1, 60000),
(5012, 'Myra Verma', 'F', 26, '2016-11-05', 'Operations Manager', 13, 2, 95000),
(5013, 'Arnav Rao', 'M', 33, '2017-01-20', 'Customer Success Manager', 10, 3, 75000),
(5014, 'Vihaan Mohan', 'M', 30, '2017-03-10', 'Supply Chain Analyst', 10, 2, 60000),
(5015, 'Ishaan Kumar', 'M', 27, '2017-05-20', 'Financial Analyst', 7, 1, 85000),
(5016, 'Zoya Khan', 'F', 31, '2017-07-05', 'Legal Counsel', 4, 4, 100000),
(5017, 'Kabir Nair', 'M', 28, '2017-09-11', 'IT Support Specialist', 12, 2, 80000),
(5018, 'Ishan Mishra', 'M', 25, '2017-11-20', 'Research Scientist', 9, 3, 75000),
(5019, 'Ishika Patel', 'F', 29, '2018-01-15', 'Talent Acquisition Specialist', 4, 4, 55000),
(5020, 'Aarav Nair', 'M', 32, '2018-03-05', 'Software Engineer', 1, 1, 90000),
(5021, 'Advik Kapoor', 'M', 26, '2018-05-20', 'Finance Analyst', 7, 3, 85000),
(5022, 'Aadhya Iyengar', 'F', 28, '2018-07-10', 'HR Specialist', 4, 4, 60000),
(5023, 'Anika Paul', 'F', 30, '2018-09-20', 'Public Relations Specialist', 2, 2, 70000),
(5024, 'Aryan Shetty', 'M', 27, '2018-11-05', 'Product Manager', 5, 1, 95000),
(5025, 'Avni Iyengar', 'F', 31, '2019-01-20', 'Data Scientist', 3, 4, 100000),
(5026, 'Vivaan Singh', 'M', 29, '2019-03-10', 'Business Analyst', 3, 2, 75000),
(5027, 'Ananya Paul', 'F', 32, '2019-05-20', 'Content Writer', 6, 3, 60000),
(5028, 'Anaya Kapoor', 'F', 26, '2019-07-05', 'Event Coordinator', 6, 1, 60000),
(5029, 'Arjun Kumar', 'M', 33, '2019-09-11', 'Quality Assurance Analyst', 12, 2, 80000),
(5030, 'Sara Iyer', 'F', 28, '2019-11-20', 'Project Manager', 5, 1, 90000);

-- 1 – DISTINCT Write a query to retrieve distinct salaries from the Employees table.

SELECT DISTINCT salary
FROM Employees;

-- 2 – Alias (AS) Provide aliases for the "age" and "salary" columns as "Employee_Age" and "Employee_Salary", respectively.

SELECT
    age AS Employee_Age,
    salary AS Employee_Salary
FROM Employees;

-- 3 – WHERE Clause & Operators
--  Retrieve employees with a salary greater than ₹50000 and hired before 2016-01-01.

SELECT *FROM Employees
WHERE salary > 50000
AND hire_date < '2016-01-01';

-- Find the employee whose designation is missing and fill it with "Data Scientist"

UPDATE Employees
SET designation = 'Data Scientist'
WHERE employee_id = 5004;

SELECT * FROM Employees
WHERE designation = 'Data Scientist';

-- Sorting and Grouping Data:
-- 1. ORDER BY: Find employees sorted by department ID in ascending order and salary in descending order

SELECT *
FROM Employees
ORDER BY department_id ASC,
         salary DESC;

-- 2 – LIMIT Display the first 5 employees hired in the year 2018.

SELECT *
FROM Employees
WHERE YEAR(hire_date) = 2018
ORDER BY hire_date ASC
LIMIT 5;

-- 3 - Aggregate Functions 
-- Calculate the sum of all salaries in the Finance department

SELECT d.department_name, SUM(e.salary) AS Total_Finance_Salary
FROM Employees e
INNER JOIN Departments d
ON e.department_id = d.department_id
WHERE d.department_name = 'Finance'
GROUP BY d.department_name;

-- Find the minimum age among all employees.

SELECT MIN(age) AS Minimum_Age FROM Employees;

-- 4. GROUP BY: 
-- List the maximum salary for each location.

SELECT l.location,
    MAX(e.salary) AS Maximum_Salary
FROM Employees e
INNER JOIN Location l
    ON e.location_id = l.location_id
GROUP BY l.location;

-- Calculate the average salary for each designation containing the word 'Analyst'.

SELECT
    designation,
    AVG(salary) AS Average_Salary
FROM Employees
WHERE designation LIKE '%Analyst%'
GROUP BY designation;

-- 5. HAVING: 
-- Find departments with less than 3 employees.

SELECT
    d.department_name,
    COUNT(e.employee_id) AS Total_Employees
FROM Departments d
LEFT JOIN Employees e
    ON d.department_id = e.department_id
GROUP BY d.department_id, d.department_name
HAVING COUNT(e.employee_id) < 3;

-- Find locations with female employees whose average age is below 30.

SELECT
    l.location,
    AVG(e.age) AS Average_Age
FROM Location l
INNER JOIN Employees e
    ON l.location_id = e.location_id
WHERE e.gender = 'F'
GROUP BY l.location_id, l.location
HAVING AVG(e.age) < 30;

-- Joins:
-- 1. Inner Join List employee names, their designations, and department names where employees are assigned to a department.

SELECT
    e.employee_name,
    e.designation,
    d.department_name
FROM Employees e
INNER JOIN Departments d
ON e.department_id = d.department_id;

-- 2 -  Left Join: List all departments along with the total number of employees in each department, including departments with no employees

SELECT
    d.department_name,
    COUNT(e.employee_id) AS Total_Employees
FROM Departments d
LEFT JOIN Employees e
    ON d.department_id = e.department_id
GROUP BY d.department_id, d.department_name;

-- 3 - Right Join: Display all locations along with the names of employees assigned to each location. 
-- If no employees are assigned to a location, display NULL for employee name.

SELECT
    l.location,
    e.employee_name
FROM Employees e
RIGHT JOIN Location l
    ON e.location_id = l.location_id
ORDER BY l.location;



