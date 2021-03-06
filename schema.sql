---SQL Schema ran in PGAdmin--

DROP TABLE IF EXISTS salaries;
DROP TABLE IF EXISTS dept_manager;
DROP TABLE IF EXISTS dept_emp;
DROP TABLE IF EXISTS employees;
DROP TABLE IF EXISTS titles;
DROP TABLE IF EXISTS departments;

CREATE TABLE titles (
	title_id VARCHAR(5) NOT NULL,
	PRIMARY KEY (title_id),
	title VARCHAR(255) NOT NULL
);

CREATE TABLE employees (
	emp_no INTEGER NOT NULL,
	PRIMARY KEY(emp_no),
	emp_title_id VARCHAR(5) NOT NULL,
	FOREIGN KEY (emp_title_id) REFERENCES titles(title_id),
	birth_date VARCHAR(255) NOT NULL,
	first_name VARCHAR(255) NOT NULL,
	last_name VARCHAR(255) NOT NULL,
	sex VARCHAR(255) NOT NULL,
	hire_date VARCHAR(255) NOT NULL
);

CREATE TABLE departments (
	dept_no VARCHAR(4) NOT NULL,
	PRIMARY KEY (dept_no),
	dept_name VARCHAR(255) NOT NULL
);

CREATE TABLE dept_emp (
	emp_no INTEGER NOT NULL, 
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	dept_no VARCHAR(4) NOT NULL, 
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
	PRIMARY KEY(dept_no, emp_no) --COMPOSITE PRIMARY KEY (JUNCTION TABLE)
);

CREATE TABLE dept_manager (
	dept_no VARCHAR(4) NOT NULL, 
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
	emp_no INTEGER NOT NULL, 
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	PRIMARY KEY(dept_no, emp_no) --COMPOSITE PRIMARY KEY (JUNCTION TABLE)
);

--NOTE NO PRIMARY KEY. IS THIS PROBLEMATIC?
CREATE TABLE salaries (
	emp_no INTEGER NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	salary INTEGER NOT NULL
);
