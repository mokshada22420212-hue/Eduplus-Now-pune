-- 1. Create a database named student_db.

CREATE DATABASE student_db;

-- 2. Use the student_db database.
USE student_db;

-- 3. Create a table named students with columns: student_id (INT, PRIMARY KEY, AUTO_INCREMENT), name (VARCHAR(50)), gender (VARCHAR(10)), 
-- course (VARCHAR(50)), marks (INT), and city (VARCHAR(50)).

CREATE TABLE students (student_id INT PRIMARY KEY AUTO_INCREMENT,
				name VARCHAR(50),
                gender VARCHAR(10),
                course VARCHAR(50),
                marks INT,
                city VARCHAR(10));
                
-- 4. Insert at least 10 sample records into the students table with different marks, courses, and cities.

	INSERT INTO students (name, gender, course, marks, city)
VALUES
('Amit', 'Male', 'BCA', 78, 'Pune'),
('Sneha', 'Female', 'BBA', 85, 'Mumbai'),
('Rahul', 'Male', 'BCA', 67, 'Nashik'),
('Neha', 'Female', 'BSc', 92, 'Pune'),
('Ravi', 'Male', 'BCom', 74, 'Delhi'),
('Priya', 'Female', 'BCA', 88, 'Mumbai'),
('Karan', 'Male', 'BBA', 59, 'Pune'),
('Anjali', 'Female', 'BSc', 81, 'Nagpur'),
('Vikas', 'Male', 'BCom', 69, 'Delhi'),
('Meera', 'Female', 'BCA', 95, 'Mumbai');



-- 5. Display all records from the students table.
SELECT * FROM students;

-- 6. Display only the name and marks columns of all students.

SELECT name ,marks FROM students;

-- 7. Display distinct course names from the students table.

SELECT DISTINCT course FROM students;

-- 8. Display distinct city names of students.


SELECT DISTINCT city FROM students;

-- 9. Display all student details ordered by marks in descending order.
SELECT *FROM students ORDER BY marks ASC;

-- 10. Display top 3 students with highest marks using LIMIT.
 SELECT *FROM students ORDER BY marks DESC LIMIT 3;
 
 -- 11. Display top 5 students from the students table using LIMIT clause.
 SELECT *FROM students ORDER BY marks DESC LIMIT 5;
 
 -- 12. Display the next 3 students after skipping first 2 using LIMIT with OFFSET.
 SELECT * FROM students LIMIT 3 OFFSET 2;
 
 -- 13. Display students from 6th to 10th position using LIMIT and OFFSET.
SELECT * 
FROM students
LIMIT 5 OFFSET 5;
 
 
 -- 14. Display names of students having marks greater than 70 and limit result to 4 students.
 
 SELECT name
FROM students
WHERE marks > 70
LIMIT 4;
 
 -- 15. Display only the first 2 distinct cities from the students table.
SELECT DISTINCT city
FROM students
ORDER BY city
LIMIT 2;

-- 16. Display top 3 students enrolled in 'Computer Science' course.
SELECT * 
FROM students
WHERE course = 'Computer Science'
ORDER BY marks DESC
LIMIT 3; 

-- 17. Display students from 3rd to 6th record when ordered by marks descending.

SELECT * 
FROM students
ORDER BY marks DESC
LIMIT 4 OFFSET 2;


-- 18. Display the 2nd highest marks student using LIMIT and OFFSET.
SELECT * 
FROM students
ORDER BY marks DESC
LIMIT 1 OFFSET 1;

-- 19. Display only top 1 student from each distinct city (hint: use subquery or LIMIT).
 
 SELECT *
FROM students s
WHERE marks = (
    SELECT MAX(marks)
    FROM students
    WHERE city = s.city
);

-- 20. Display all students whose course name exists in another table named courses.
SELECT *
FROM students
WHERE course IN (SELECT course FROM students);

-- 21. Create another table named courses with columns: course_id, course_name.
CREATE TABLE coursess(
course_id INT PRIMARY KEY AUTO_INCREMENT ,
course_name VARCHAR(100));

-- 22. Insert 5 course names into the courses table.

INSERT INTO courses(course_name)
VALUES('Engineering'),
		('law'),
		('CA'),
		('BCA'),
		('BSC');
        
-- 23. Display all students whose course exists in the courses table using EXISTS.

SELECT *
FROM students s
WHERE EXISTS (
    SELECT 1
    FROM courses c
    WHERE c.course_name = s.course
);

-- 24. Display all students whose course does not exist in the courses table using NOT EXISTS.

SELECT * FROM students 
WHERE EXISTS(
SELECT 0
FROM courses c
WHERE c.course_name = s.coursess
);

-- 25. Display all students who exist in both students and another table named alumni (based on name).
SELECT *
FROM students s
WHERE EXISTS (
    SELECT 1
    FROM alumnii a
    WHERE a.name = s.name
)
LIMIT 0, 1000;

-- 26. Create another table named alumni with columns: alumni_id, name, course.

	CREATE TABLE alumnii (
    alumni_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100),
    course VARCHAR(100));
    
-- 27. Insert 3 students from students table into alumni table
INSERT INTO alumnii (name, course) VALUES
('Amit Sharma', 'BCA'),
('Sneha Patil', 'BSc Computer Science'),
('Rahul Verma', 'BBA');

-- 25. Display all students who exist in both students and another table named alumni (based on name).
SELECT *
FROM students s
WHERE EXISTS (
    SELECT 1
    FROM alumni a
    WHERE a.name = s.name
)
LIMIT 0, 1000;

-- 29. Display students who are not present in alumni table using NOT EXISTS.

SELECT *
FROM students s
WHERE NOT EXISTS (
    SELECT 0 FROM alumnii a
    WHERE a.name = s.name
);

-- 30. Display student names with “Pass” or “Fail” status using CASE WHEN marks >= 40 THEN 'Pass' ELSE 'Fail' END.


SELECT name ,
CASE 
WHEN marks>=40 THEN 'Pass'
ELSE 'Fail'
END AS Result
FROM students;

-- 31. Display student name, marks, and grade using CASE WHEN (marks >= 90 THEN 'A', marks >= 75 THEN 'B', marks >= 60 THEN 'C', ELSE 'D').

SELECT name,
marks ,
CASE 
WHEN marks >= 90 THEN 'A'
WHEN marks >= 75 THEN 'B'
WHEN marks >= 60 THEN 'C'
ELSE 'D'
END AS Grade
FROM students;

-- 32. Display name and result category as 'Excellent', 'Average', or 'Poor' based on marks using CASE WHEN.

SELECT name,
CASE
    WHEN marks >= 85 THEN 'Excellent'
    WHEN marks >= 60 THEN 'Average'
    ELSE 'Poor'
END AS Category
FROM students;

-- 33. Display student names and show 'Scholarship' for marks above 85 using CASE WHEN.
SELECT name,
CASE
    WHEN marks > 85 THEN 'Scholarship'
    ELSE 'No Scholarship'
END AS Status
FROM students;

-- 34. Display student names and show ‘Needs Improvement’ if marks < 40 using CASE WHEN.
SELECT name,
CASE 
WHEN marks < 40 THEN 'Needs Improvement'
ELSE 'Good'
END AS Remark
FROM students;

-- 35. Display each student's name along with the course type using CASE WHEN course = 'Biology' THEN 'Science' ELSE 'Other'.

SELECT name,
CASE
    WHEN course = 'Biology' THEN 'Science'
    ELSE 'Other'
END AS Course_Type
FROM students;

-- 36. Display name, marks, and a custom message: 'Top Performer' if marks > 90, 'Moderate' if 60–90, else 'Low'.

SELECT name, marks,
CASE
    WHEN marks > 90 THEN 'Top Performer'
    WHEN marks BETWEEN 60 AND 90 THEN 'Moderate'
    ELSE 'Low'
END AS Message
FROM students;

-- 37. Display city, and tag it as ‘Metro’ for 'Mumbai', 'Delhi', 'Bangalore' using CASE WHEN.

SELECT city,
CASE
    WHEN city IN ('Mumbai','Delhi','Bangalore') THEN 'Metro'
    ELSE 'Non-Metro'
END AS City_Type
FROM students;


-- 38. Display name, course, and whether they are in ‘Technical’ or ‘Non-Technical’ category using CASE WHEN.

SELECT name, course,
CASE
    WHEN course IN ('BCA','Computer Science') THEN 'Technical'
    ELSE 'Non-Technical'
END AS Category
FROM students;

-- 39. Display distinct combinations of course and city.

SELECT DISTINCT course, city
FROM students;

-- 40. Display count of distinct courses offered.
SELECT COUNT(DISTINCT course) AS Total_Courses
FROM students;

-- 41. Display total number of distinct cities students belong to.

SELECT COUNT(DISTINCT city) AS Total_Cities
FROM students;

-- 42. Display distinct gender values from the students table.

SELECT DISTINCT gender
FROM students;

-- 43. Display top 2 distinct courses alphabetically using LIMIT.
SELECT DISTINCT course
FROM students
ORDER BY course
LIMIT 2;

-- 44. Display distinct cities but skip the first 2 using OFFSET.
SELECT DISTINCT city
FROM students
LIMIT 100 OFFSET 2;

--  45. Display all students where course exists in the courses table but city does not exist in the alumni table.

-- 46. Display student records where both gender and city exist in another table named student_details.

SELECT *
FROM students s
WHERE EXISTS (
    SELECT 1 FROM studentS sd
    WHERE sd.gender = s.gender
    AND sd.city = s.city
);

-- 47. Display names of students whose marks are greater than average marks using EXISTS with subquery.

-- 48. Display students who exist in a subquery where marks are above 75 using EXISTS

SELECT *
FROM students s
WHERE EXISTS (
    SELECT 1
    FROM students
    WHERE marks > 75
    AND s.student_id = student_id
);