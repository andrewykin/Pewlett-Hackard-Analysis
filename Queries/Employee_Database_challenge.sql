-- Deliverable #1

-- 1. Retrieve the emp_no, first_name, and last_name columns from the Employees table.
-- 2. Retrieve the title, from_date, and to_date columns from the Titles table.
-- 3. Create a new table using the INTO clause.
-- 4. Join both tables on the primary key.
-- 5. Filter the data on the birth_date column to retrieve the employees who were born between 1952 and 1955. Then, order by the employee number.
-- 6. Export the Retirement Titles table from the previous step as retirement_titles.csv and save it to your Data folder in the Pewlett-Hackard-Analysis folder.
-- 7. Before you export your table, confirm that it looks like this image:
SELECT e.emp_no, e.first_name, e.last_name,
	ti.title, ti.from_date, ti.to_date
INTO retirement_titles
FROM employees as e
INNER JOIN titles as ti
ON e.emp_no = ti.emp_no
WHERE e.birth_date BETWEEN '1952-01-01' AND '1955-12-31'
ORDER BY emp_no;

-- Note: There are duplicate entries for some employees because they have switched titles over the years. Use the following instructions to remove these duplicates and keep only the most recent title of each employee.
-- 8. Copy the query from the Employee_Challenge_starter_code.sql and add it to your Employee_Database_challenge.sql file.
-- Use Dictinct with Orderby to remove duplicate rows
-- 9. Retrieve the employee number, first and last name, and title columns from the Retirement Titles table.
--   These columns will be in the new table that will hold the most recent title of each employee.
-- 10. Use the DISTINCT ON statement to retrieve the first occurrence of the employee number for each set of rows defined by the ON () clause.
-- 11. Exclude those employees that have already left the company by filtering on to_date to keep only those dates that are equal to '9999-01-01'.
-- 12. Create a Unique Titles table using the INTO clause.
-- 13. Sort the Unique Titles table in ascending order by the employee number and descending order by the last date (i.e., to_date) of the most recent title.
-- 14. Export the Unique Titles table as unique_titles.csv and save it to your Data folder in the Pewlett-Hackard-Analysis folder.
-- 15. Before you export your table, confirm that it looks like this image:
SELECT DISTINCT ON (emp_no) emp_no,
	first_name,
	last_name,
	title
INTO unique_titles
FROM retirement_titles
WHERE to_date = '9999-01-01'
ORDER BY emp_no, to_date DESC;

-- 16. Write another query in the Employee_Database_challenge.sql file to retrieve the number of employees by their most recent job title who are about to retire.
-- 17. First, retrieve the number of titles from the Unique Titles table.
-- 18. Then, create a Retiring Titles table to hold the required information.
-- 19. Group the table by title, then sort the count column in descending order.
-- 20. Export the Retiring Titles table as retiring_titles.csv and save it to your Data folder in the Pewlett-Hackard-Analysis folder.
-- 21. Before you export your table, confirm that it looks like this image:
-- 22. Save your Employee_Database_challenge.sql file in your Queries folder in the Pewlett-Hackard folder.
SELECT COUNT(title), title
INTO retiring_titles
FROM unique_titles
GROUP BY title
ORDER BY 1 DESC;

-- Deliverable #2

-- In the Employee_Database_challenge.sql file, write a query to create a Mentorship Eligibility table that holds the employees who are eligible to participate in a mentorship program.
-- 1. Retrieve the emp_no, first_name, last_name, and birth_date columns from the Employees table.
-- 2. Retrieve the from_date and to_date columns from the Department Employee table.
-- 3. Retrieve the title column from the Titles table.
-- 4. Use a DISTINCT ON statement to retrieve the first occurrence of the employee number for each set of rows defined by the ON () clause.
-- 5. Create a new table using the INTO clause.
-- 6. Join the Employees and the Department Employee tables on the primary key.
-- 7. Join the Employees and the Titles tables on the primary key.
-- 8. Filter the data on the to_date column to all the current employees, then filter the data on the birth_date columns to get all the employees whose birth dates are between January 1, 1965 and December 31, 1965.
-- 9. Order the table by the employee number.
-- 10. Export the Mentorship Eligibility table as mentorship_eligibilty.csv and save it to your Data folder in the Pewlett-Hackard-Analysis folder.
-- 11. Before you export your table, confirm that it looks like this image:
SELECT DISTINCT ON (e.emp_no) e.emp_no, e.first_name, e.last_name, e.birth_date,
	de.from_date, de.to_date,
	ti.title
INTO mentorship_eligibility
FROM employees AS e
INNER JOIN dept_emp AS de
	ON e.emp_no = de.emp_no
INNER JOIN titles AS ti
	ON de.emp_no = ti.emp_no
WHERE (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31') 
	AND (de.to_date = '9999-01-01')
ORDER BY e.emp_no;

-- Count mentorship_eligibility
SELECT COUNT (title), title
FROM mentorship_eligibility
GROUP BY title
ORDER BY 1 DESC;