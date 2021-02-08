--1. List the following details of each employee: 
--employee number, last name, first name, sex, and salary.
SELECT 
	e.emp_no "Employee Number", 
	e.last_name "Last Name", 
	e.first_name "First Name", 
	e.sex "Gender", 
	s.salary "Employee Salary"  
FROM employees AS e
INNER JOIN salaries AS s ON s.emp_no = e.emp_no;

--2. List first name, last name, and hire date for employees who were hired in 1986.
--First I have to fix the date column to filter
ALTER TABLE employees ALTER COLUMN hire_date TYPE DATE 
using to_date(hire_date, 'MM-DD-YYYY');

SELECT 
	first_name "First Name", 
	last_name "Last Name", 
	hire_date "Date Hired" 
FROM employees 
WHERE hire_date >= '1986-01-01' AND hire_date <= '1986-12-31'
ORDER BY hire_date;

--3. List the manager of each department with the following information: 
--department number, department name, the manager's employee number, last name, first name.
SELECT 
	dm.dept_no "Department Number", 
	d.dept_name "Department Name", 
	dm.emp_no "Employee Number", 
	e.last_name "Last Name",
	e.first_name "First Name"
FROM dept_manager AS dm
INNER JOIN departments AS d ON d.dept_no = dm.dept_no
INNER JOIN employees AS e ON e.emp_no = dm.emp_no;

--4. List the department of each employee with the following information: 
--employee number, last name, first name, and department name.
SELECT 
	de.emp_no "Employee Number", 
	e.last_name "Last Name", 
	e.first_name "First Name", 
	d.dept_name "Department Name"
FROM dept_emp AS de
INNER JOIN departments AS d ON d.dept_no = de.dept_no
INNER JOIN employees AS e ON e.emp_no = de.emp_no;

--5. List first name, last name, and sex for employees whose 
--first name is "Hercules" and last names begin with "B."
SELECT 
	first_name "First Name", 
	last_name "Last Name", 
	sex "Gender"
FROM employees
WHERE first_name = 'Hercules' AND
      last_name LIKE 'B%';

--6. List all employees in the Sales department, 
--including their employee number, last name, first name, and department name.

SELECT 
	de.emp_no "Employee Number", 
	e.last_name "Last Name", 
	e.first_name "First Name", 
	d.dept_name "Department Name"
FROM dept_emp AS de
INNER JOIN employees AS e ON e.emp_no = de.emp_no
INNER JOIN departments AS d ON d.dept_no = de.dept_no
WHERE d.dept_name = 'Sales';

--7. List all employees in the Sales and Development departments, 
--including their employee number, last name, first name, and department name.
SELECT 
	de.emp_no "Employee Number", 
	e.last_name "Last Name", 
	e.first_name "First Name", 
	d.dept_name "Department Name"
FROM dept_emp AS de
INNER JOIN employees AS e ON e.emp_no = de.emp_no
INNER JOIN departments AS d ON d.dept_no = de.dept_no
WHERE d.dept_name = 'Sales' OR
      d.dept_name = 'Development';

--8. In descending order, list the frequency count of employee last names, 
--i.e., how many employees share each last name.

SELECT 
	last_name "Last Name",
	COUNT (last_name) "Frequency count of Last Name"
FROM employees
GROUP BY last_name
ORDER BY "Frequency count of Last Name" DESC;
