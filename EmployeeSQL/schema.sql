--Drop any tables if they exist
DROP TABLE IF EXISTS departments CASCADE;
DROP TABLE IF EXISTS dept_emp CASCADE;
DROP TABLE IF EXISTS dept_manager CASCADE;
DROP TABLE IF EXISTS employees CASCADE;
DROP TABLE IF EXISTS salaries CASCADE;
DROP TABLE IF EXISTS titles;

--1. Create the departments table
CREATE TABLE departments (
  dept_no varchar NOT NULL PRIMARY KEY,
  dept_name varchar NOT NULL 
);

--2. Create the titles table
CREATE TABLE titles (
	title_id varchar NOT NULL PRIMARY KEY,
	title varchar NOT NULL 	
);

--3. Create the employees table
CREATE TABLE employees (
	emp_no int NOT NULL PRIMARY KEY,
	emp_title_id varchar NOT NULL,
	birth_date varchar NOT NULL,
	first_name varchar NOT NULL,
	last_name varchar NOT NULL,
	sex varchar NOT NULL,
	hire_date varchar NOT NULL,
	FOREIGN KEY (emp_title_id) REFERENCES titles (title_id)
);

--4. Create the dept_manager table
CREATE TABLE dept_manager (
	dept_no varchar NOT NULL,
	emp_no int NOT NULL PRIMARY KEY,
	FOREIGN KEY ( emp_no ) REFERENCES employees(emp_no),
	FOREIGN KEY ( dept_no ) REFERENCES departments(dept_no)	
);

--5. Create the dept_emp table
CREATE TABLE dept_emp (
 	emp_no int NOT NULL,
 	dept_no varchar NOT NULL,
 	FOREIGN KEY ( emp_no ) REFERENCES employees(emp_no),
 	FOREIGN KEY ( dept_no ) REFERENCES departments(dept_no)
);

--6. Create the salaries table
CREATE TABLE salaries (
	emp_no int NOT NULL PRIMARY KEY,
	salary int NOT NULL, 
	FOREIGN KEY ( emp_no ) REFERENCES employees(emp_no)	
);