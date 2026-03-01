-- 1. Create a database named 'companyDB'.
CREATE DATABASE companyDB;

USE companyDB;
-- 2. Create a table 'employees' with columns: emp_id (INT), name (VARCHAR(50)), department (VARCHAR(50)), salary (INT), experience (INT).

CREATE TABLE employees(
emp_id INT ,
name VARCHAR(50),
department VARCHAR(50),
salary INT,
experience INT);

-- 3. Insert at least 10 records into 'employees' table with varying departments, salaries, and experiences.

INSERT INTO employees (emp_id, name, department, salary, experience) VALUES
(1, 'Amit Sharma', 'IT', 75000, 6),
(2, 'Anita Desai', 'HR', 48000, 4),
(3, 'Raj Malhotra', 'Finance', 68000, 7),
(4, 'Sneha Patil', 'IT', 52000, 3),
(5, 'Arjun Mehta', 'Marketing', 45000, 5),
(6, 'Neha Nair', 'Finance', 72000, 9),
(7, 'Karan Singh', 'IT', 80000, 10),
(8, 'Pooja Verma', 'HR', 39000, 2),
(9, 'Rohan Jain', 'Marketing', 61000, 6),
(10, 'Alok Menon', 'IT', 55000, 4),
(11, 'Vikas Yadav', 'Finance', 47000, 5),
(12, 'Anil Khan', 'HR', 65000, 8);


-- 4. Display all employee details.

SELECT * FROM employees;

-- 5. Display only the names and departments of all employees.

SELECT name, department FROM employees;

-- 6. Display the names and salaries of employees who earn more than 50000.

SELECT name,salary FROM employees where salary>50000;

-- 7. Display all employees who work in the 'IT' department.

SELECT * FROM employees where department='IT';

-- 8. Display all employees whose name starts with the letter 'A'.

SELECT * FROM employees WHERE name LIKE 'A%';

-- 9. Display all employees who have more than 5 years of experience.
SELECT* FROM employees WHERE experience>5;

-- 10. Display employees whose salary is between 40000 and 70000.
SELECT * FROM employees where salary BETWEEN 40000 AND 70000;

-- 11. Display employees who belong to either 'HR' or 'Finance' department.

SELECT * FROM employees WHERE department = 'Finance' OR 'HR';

-- 12. Display employees whose names end with the letter 'n'.
SELECT * FROM employees WHERE name LIKE '%n';

-- 13. Display employees sorted by their salary in descending order.
SELECT * FROM employees ORDER BY salary DESC;

-- 14. Display the top 3 highest paid employees.

SELECT *
FROM employees
ORDER BY salary DESC
LIMIT 3;

-- 15. Display the 2 lowest paid employees.

SELECT *
FROM employees
ORDER BY salary ASC
LIMIT 2;

-- 16. Display employees with salary greater than the average salary.
SELECT *
FROM employees
WHERE salary > (SELECT AVG(salary) FROM employees);

-- 17. Display total salary expenditure of the company.

-- 18. Display total number of employees in the company.
SELECT 
    name, 
    COUNT(*) AS total_employees
FROM
    employees
GROUP BY name;

-- 19. Display the average salary of employees in each department.
SELECT 
    department, 
    AVG(salary) AS avg_salary
FROM
    employees
GROUP BY department;

-- 20. Display the maximum and minimum salary in each department.
SELECT 
    department, 
    MIN(salary) AS min_salary
FROM
    employees
GROUP BY department;

SELECT 
    department, 
    MAX(salary) AS max_salary
FROM
    employees
GROUP BY department;

-- 21. Display total number of employees in each department

SELECT 
    department, 
    COUNT(*) AS total_employees
FROM
    employees
GROUP BY department;

-- 22. Display departments having more than 3 employees.

SELECT department, COUNT(*) AS total_employees
FROM employees
GROUP BY department
HAVING COUNT(*) > 3;

-- 23. Display departments whose average salary exceeds 60000.

SELECT department, AVG(salary) AS avg_salary
FROM employees
GROUP BY department
HAVING AVG(salary) > 60000;

-- 24. Display employees who are in departments with total salary greater than 200000.
SELECT *
FROM employees
WHERE department IN (
    SELECT department
    FROM employees
    GROUP BY department
    HAVING SUM(salary) > 200000
);

-- 25. Display the count of employees grouped by experience years.

SELECT experience, COUNT(*) AS total_employees
FROM employees
GROUP BY experience
ORDER BY experience;


-- 26. Display average experience of employees grouped by department.

SELECT department, AVG(experience) AS avg_experience
FROM employees
GROUP BY department;

-- 27. Display only departments that have more than 2 employees with salary greater than 50000.

SELECT department, COUNT(*) AS high_salary_count
FROM employees
WHERE salary > 50000
GROUP BY department
HAVING COUNT(*) > 2;

-- 28. Display department names along with total number of employees sorted by employee count descending.

SELECT department, COUNT(*) AS total_employees
FROM employees
GROUP BY department
ORDER BY total_employees DESC;

-- 29. Display department names and their average salaries in ascending order of average salary.
SELECT department, AVG(salary) AS avg_salary
FROM employees
GROUP BY department
ORDER BY avg_salary ASC;

-- 30. Display all departments having average experience greater than 4 years.
SELECT department, AVG(experience) AS avg_experience
FROM employees
GROUP BY department
HAVING AVG(experience) > 4;

-- 31. Display total employees having salary less than the average salary across company.

SELECT COUNT(*) AS total_employees
FROM employees
WHERE salary < (SELECT AVG(salary) FROM employees);

-- 32. Display employee names with 10% bonus added to their salaries.
SELECT name, salary, salary * 1.10 AS salary_with_bonus
FROM employees;

-- 33. Display employee names and their new salary after applying 15% tax deduction.

SELECT name,
       salary,
       salary - (salary * 0.15) AS new_salary
FROM employees;


-- 34. Display employee names along with their salary category: 'High' if >70000, 'Medium' if between 40000-70000, else 'Low'.
SELECT name, salary,
CASE
    WHEN salary > 70000 THEN 'High'
    WHEN salary BETWEEN 40000 AND 70000 THEN 'Medium'
    ELSE 'Low'
END AS salary_category
FROM employees;


SELECT name, salary,
CASE
    WHEN salary > 70000 THEN 'High'
    WHEN salary BETWEEN 40000 AND 70000 THEN 'Medium'
    ELSE 'Low'
END AS salary_category
FROM employees;

-- 35. Display employee names along with their experience level: 'Senior' (>8 years), 'Mid' (4-8 years), 'Junior' (<4 years).
SELECT name, experience,
CASE
    WHEN experience > 8 THEN 'Senior'
    WHEN experience BETWEEN 4 AND 8 THEN 'Mid'
    ELSE 'Junior'
END AS experience_level
FROM employees;


-- 36. Display department-wise total salary using expression addition.
SELECT department, SUM(salary) AS total_salary
FROM employees
GROUP BY department;

-- 37. Display department-wise salary after adding 5% increment
SELECT department,SUM(salary*0.05)AS total_salary
FROM employees
GROUP BY department;

-- 38. Display average salary for employees with experience greater than 5 years in each department.
SELECT department, AVG(salary) AS avg_salary
FROM employees
WHERE experience > 5
GROUP BY department;

-- 39. Display names of employees and the remainder when their salary is divided by 10000.
SELECT name, salary, salary % 10000 AS remainder
FROM employees;


-- 40. Display employees who earn the same salary as another employee.
SELECT * FROM employees
WHERE salary IN (
    SELECT salary FROM employees GROUP BY salary HAVING COUNT(*) > 1
);

-- 41. Create another table 'interns' with columns: intern_id, name, department, stipend.

CREATE TABLE interns (
intern_id INT PRIMARY KEY AUTO_INCREMENT,
name VARCHAR(100),
department VARCHAR(100),
stipend INT );

-- 42. Insert 5 records into 'interns' table.
INSERT INTO interns VALUES
(1, 'Aman Gupta', 'IT', 15000),
(2, 'Riya Sen', 'HR', 12000),
(3, 'Dev Patel', 'Finance', 18000),

(4, 'Sara Khan', 'Marketing', 10000),
(5, 'Arnav Rao', 'IT', 20000);

-- 43. Display all employee names and intern names together.
SELECT name AS person_name
FROM employees;

SELECT name AS person_name
FROM interns;

-- 44. Display all unique department names from both employees and interns.

SELECT DISTINCT name FROM employees;
SELECT DISTINCT name FROM interns;

-- 45. Display top 2 interns with highest stipend and top 2 employees with highest salary together.



-- 46. Display all records from employees where salary is not NULL.
SELECT * FROM employees WHERE salary IS NOT NULL;


-- 47. Display employees sorted by experience and then by salary.

SELECT *
FROM employees
ORDER BY experience ASC, salary ASC;


-- 48. Display employees where department name contains the letter 'e'.

SELECT * FROM employees WHERE department LIKE '%e%';


-- 49. Display departments where total salary is greater than 100000 and average experience > 5 years.

SELECT department
FROM employees
GROUP BY department
HAVING SUM(salary) > 100000 AND AVG(experience) > 5;

-- 50. Display department, total salary, and label as 'OverBudget' if total salary > 200000 else 'WithinBudget' using CASE WHEN.

SELECT department , SUM(salary) AS total_salary ,
CASE WHEN SUM(salary)>200000  THEN 'OverBudget'
ELSE 'WithinBudget'
END AS budget_status
FROM employees
GROUP BY department;

