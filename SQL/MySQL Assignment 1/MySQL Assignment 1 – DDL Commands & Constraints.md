# MySQL Assignment 1 -- DDL Commands & Constraints

**Database:** `employee`\
**DBMS:** MySQL

------------------------------------------------------------------------

# Part 1 -- DDL Commands

## 1. Table Creation (`CREATE`)

**Question:** Write the SQL statements to create a database named
`employee` and the following tables based on the provided schema:

-   Departments
-   Location
-   Employees

### SQL Solution

``` sql
-- Create database
CREATE DATABASE employee;

-- Create an table
USE employee;

CREATE TABLE Location (
    location_id INT PRIMARY KEY AUTO_INCREMENT,
    location VARCHAR(30)
);

CREATE TABLE Departments (
    department_id INT PRIMARY KEY AUTO_INCREMENT,
    department_name VARCHAR(100)
);

CREATE TABLE Employees (
    employee_id INT PRIMARY KEY AUTO_INCREMENT,
    employee_name VARCHAR(50),
    gender ENUM('M', 'F'),
    age INT,
    hire_date DATE,
    designation VARCHAR(100),
    department_id INT,
    location_id INT,
    salary DECIMAL(10,2),

    FOREIGN KEY (department_id)
        REFERENCES Departments(department_id),

    FOREIGN KEY (location_id)
        REFERENCES Location(location_id)
);
```

## 2. Table Alteration (`ALTER`)

**Question:** Consider the following scenarios and write the SQL
statements to alter the structure of the tables accordingly:

-   Add a new column named `email` to the Employees table to store
    employee email addresses.
-   Modify the data type of the `designation` column in the Employees
    table to support a wider range of values.
-   Drop the `age` column from the Employees table.
-   Rename the `hire_date` column to `date_of_joining`.

### SQL Solution

``` sql
-- Table Alteration

ALTER TABLE Employees
ADD COLUMN email VARCHAR(100);

ALTER TABLE Employees
MODIFY COLUMN designation VARCHAR(200);

ALTER TABLE Employees
DROP COLUMN age;

ALTER TABLE Employees
RENAME COLUMN hire_date TO date_of_joining;
```

## 3. Table Renaming (`RENAME`)

**Question:** Rewrite the SQL statements to rename the following tables:

-   Rename the `Departments` table to `Departments_Info`.
-   Rename the `Location` table to `Locations`.

### SQL Solution

``` sql
-- Table Renaming

RENAME TABLE Departments TO Departments_Info;

RENAME TABLE Location TO Locations;

DESC Employees;
```

## 4. Table Truncation (`TRUNCATE`)

**Question:** Write an SQL statement to truncate the Employees table.

### SQL Solution

``` sql
-- TRUNCATE TABLE

TRUNCATE TABLE Employees;
```

## 5. Database & Table Dropping (`DROP`)

**Question:** Write the SQL statements to drop the Employees table and
then the `employee` database.

### SQL Solution

``` sql
-- Table Dropping

DROP TABLE Employees;

DROP DATABASE Employee;
```

------------------------------------------------------------------------

# Part 2 -- Constraints

## 1. Database Recreation

**Question:** Drop the `employee` database if it exists and recreate it
using the provided schema, ensuring that all tables are created with the
appropriate constraints as instructed.

### SQL Solution

``` sql
CREATE DATABASE employee;

USE employee;
```

## 2. Departments Table

**Requirements:**

-   Ensure that the `department_id` uniquely identifies each department.
-   Set up constraints on the `department_name` to avoid duplicate and
    NULL entries.

### SQL Solution

``` sql
CREATE TABLE Departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(100) NOT NULL UNIQUE
);
```

## 3. Location Table

**Requirements:**

-   Establish a mechanism to automatically generate unique identifiers
    for each location, ensuring that they are incremented sequentially.
-   Implement constraints to prevent the insertion of NULL and duplicate
    locations.

### SQL Solution

``` sql
CREATE TABLE Location (
    location_id INT PRIMARY KEY AUTO_INCREMENT,
    location VARCHAR(30) NOT NULL UNIQUE
);
```

## 4. Employees Table

**Requirements:**

-   Guarantee that each employee has a distinct identifier.
-   Create a restriction to ensure that the employee's name is always
    provided.
-   Limit the acceptable values for the `gender` field to only `M` or
    `F`.
-   Enforce a condition to ensure that the employee's age is 18 or
    above.
-   Automatically assign the current date to the `hire_date` field if
    not specified.
-   Establish links between the `department_id` and `location_id` fields
    in the Employees table and their respective tables.

### SQL Solution

``` sql
CREATE TABLE Employees (
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(50) NOT NULL,
    gender ENUM('M', 'F'),
    age INT CHECK (age >= 18),
    hire_date DATE DEFAULT (CURRENT_DATE),
    designation VARCHAR(100),
    department_id INT,
    location_id INT,
    salary DECIMAL(10,2),

    CONSTRAINT fk_employee_department
        FOREIGN KEY (department_id)
        REFERENCES Departments(department_id),

    CONSTRAINT fk_employee_location
        FOREIGN KEY (location_id)
        REFERENCES Location(location_id)
);
```

------------------------------------------------------------------------

# Part 3 -- Insert Sample Data

## 1. Insert Departments

``` sql
INSERT INTO Departments
(department_id, department_name)
VALUES
(101, 'Finance'),
(102, 'Human Resources'),
(103, 'Information Technology'),
(104, 'Accounts'),
(105, 'Operations'),
(106, 'Marketing'),
(107, 'Sales'),
(108, 'Administration');
```

## 2. Insert Locations

``` sql
INSERT INTO Location (location)
VALUES
('Chennai'),
('Coimbatore'),
('Bangalore'),
('Hyderabad'),
('Mumbai'),
('Pune'),
('Delhi'),
('Kochi');
```

## 3. Insert Employees

``` sql
INSERT INTO Employees
(
    employee_id,
    employee_name,
    gender,
    age,
    hire_date,
    designation,
    department_id,
    location_id,
    salary
)
VALUES
(1001, 'Arun Kumar', 'M', 28, '2022-05-10', 'Accountant', 101, 1, 35000.00),

(1002, 'Priya Sharma', 'F', 26, '2023-02-15', 'HR Executive', 102, 2, 32000.00),

(1003, 'Karthik Raj', 'M', 30, '2021-08-20', 'Software Developer', 103, 3, 55000.00),

(1004, 'Divya R', 'F', 25, '2024-01-12', 'Accounts Executive', 104, 1, 30000.00),

(1005, 'Suresh Kumar', 'M', 32, '2020-11-05', 'Operations Manager', 105, 4, 65000.00),

(1006, 'Meena Devi', 'F', 27, '2022-09-18', 'Marketing Analyst', 106, 5, 40000.00),

(1007, 'Vijay Anand', 'M', 29, '2023-06-22', 'Sales Executive', 107, 6, 38000.00),

(1008, 'Nithya S', 'F', 24, '2024-04-01', 'Admin Assistant', 108, 8, 28000.00),

(1009, 'Prakash M', 'M', 35, '2019-03-11', 'Senior Accountant', 101, 2, 48000.00),

(1010, 'Kavitha R', 'F', 31, '2021-12-10', 'HR Manager', 102, 7, 60000.00);
```

------------------------------------------------------------------------

## Notes

-   The DDL section is presented in the same sequence as the assignment
    questions.
-   The Constraints section recreates the database and creates the three
    tables with the requested constraints.
-   The sample data insertion section includes all 8 department records,
    8 location records, and 10 employee records supplied in the SQL
    script.
-   Run the DDL section before the Constraints section. The DDL section
    ends by dropping the database; the Constraints section then creates
    it again.
-   In the Constraints section, create `Departments` and `Location`
    before `Employees`, because `Employees` references them through
    foreign keys.
