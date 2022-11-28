-- 7.3.1 - Determine Retirement Eligibility
SELECT first_name, last_name
FROM employees
WHERE birth_date BETWEEN '1952-01-01' AND '1955-12-31';
-- Successfully run. Total query runtime: 203 msec. 90398 rows affected.

-- query only 1952 birthdates
SELECT first_name, last_name
FROM employees
WHERE birth_date BETWEEN '1952-01-01' AND '1952-12-31';
-- Successfully run. Total query runtime: 73 msec. 21209 rows affected.

-- Skill Drill: query 1953, 1954, and 1955 

-- 1953
SELECT first_name, last_name
FROM employees
WHERE birth_date BETWEEN '1953-01-01' AND '1953-12-31';
--Successfully run. Total query runtime: 74 msec. 22857 rows affected.

-- 1954
SELECT first_name, last_name
FROM employees
WHERE birth_date BETWEEN '1954-01-01' AND '1954-12-31';
--Successfully run. Total query runtime: 74 msec. 23228 rows affected.

-- 1955
SELECT first_name, last_name
FROM employees
WHERE birth_date BETWEEN '1955-01-01' AND '1955-12-31';
--Successfully run. Total query runtime: 72 msec. 23104 rows affected.

-- Narrow the Search for Retirement Eligibility
SELECT first_name, last_name
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');
-- Successfully run. Total query runtime: 109 msec. 41380 rows affected.

-- Count the Queries
SELECT COUNT(first_name)
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');
-- 41380

-- Create New Tables - retirement_info
SELECT first_name, last_name
INTO retirement_info
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');
-- see what it looks like
SELECT * FROM retirement_info;