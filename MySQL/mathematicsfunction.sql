-- STEP 1: CREATE DATABASE
CREATE DATABASE math_functions_db;

-- USE DATABASE
USE math_functions_db;


-- STEP 2: CREATE TABLE
CREATE TABLE numbers (
    id INT PRIMARY KEY AUTO_INCREMENT,
    value1 INT,
    value2 INT
);


-- STEP 3: INSERT RECORDS
INSERT INTO numbers (value1, value2) VALUES
(1, 10),
(2, 20),
(0.5, 30),
(0.25, 45),
(3, 60);


-- DISPLAY DATA
SELECT * FROM numbers;

-- EXP(x) calculates e raised to the power x.
-- The value of e is approximately 2.71828.
-- It is used in mathematical and engineering calculations.
-- EXP() - Returns e raised to the power of value1

SELECT id, value1, EXP(value1) AS exponential_value
FROM numbers;


-- LOG(x) returns natural logarithm (base e).
-- It is the reverse operation of EXP().
-- LOG(1) = 0.
-- LOG() - Returns natural logarithm (base e)
SELECT id, value1, LOG(value1) AS log_value
FROM numbers;



-- LOG10(x) returns logarithm with base 10.
-- LOG10(10) = 1.
-- LOG10(100) = 2.

-- LOG10() - Returns logarithm base 10
SELECT id, value1, LOG10(value1) AS log10_value
FROM numbers;


-- LN(x) also returns natural logarithm.
-- LN() and LOG() are same in MySQL.
-- LN() - Same as LOG() (natural logarithm)
SELECT id, value1, LN(value1) AS ln_value
FROM numbers;


-- ASIN() - Returns inverse sine (value must be between -1 and 1)
-- Converts degree to radians.
-- ASIN(x) returns inverse sine.
-- Input value must be between -1 and 1.
-- Output is in radians.

SELECT id, value1, ASIN(value1) AS asin_value
FROM numbers
WHERE value1 BETWEEN -1 AND 1;



-- ACOS() - Returns inverse cosine (value must be between -1 and 1)
-- ACOS(x) returns inverse cosine.
-- Input must be between -1 and 1.
-- Output is in radians.

SELECT id, value1, ACOS(value1) AS acos_value
FROM numbers
WHERE value1 BETWEEN -1 AND 1;



-- ATAN() - Returns inverse tangent
-- ATAN(x) returns inverse tangent.
-- No input restriction like ASIN/ACOS.
-- Output is in radians.

SELECT id, value1, ATAN(value1) AS atan_value
FROM numbers;



-- RADIANS() - Converts degrees to radians
-- Converts degree to radians.
-- Formula: radians = degrees × π / 180.

SELECT id, value2, RADIANS(value2) AS radians_value
FROM numbers;



-- DEGREES() - Converts radians to degrees
-- Converts radians to degrees.
-- Formula: degrees = radians × 180 / π.

SELECT id, value1, DEGREES(value1) AS degrees_value
FROM numbers;



-- SIN() - Returns sine of angle (convert degree to radian first)
SELECT id, value2, SIN(RADIANS(value2)) AS sin_value
FROM numbers;



-- COS() - Returns cosine of angle
SELECT id, value2, COS(RADIANS(value2)) AS cos_value
FROM numbers;



-- TAN() - Returns tangent of angle
SELECT id, value2, TAN(RADIANS(value2)) AS tan_value
FROM numbers;