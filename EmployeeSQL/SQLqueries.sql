Select * From employees;
Select * from salaries;

--List the following details of each employee: employee number, last name, first name, sex, and salary.
SELECT salaries.emp_no,
	salaries.salary,
	employees.emp_no,
	employees.emp_title_id,
	employees.first_name,
	employees.last_name,
	employees.sex
 	FROM employees, salaries
	WHERE salaries.emp_no = employees.emp_no;
	

--List first name, last name, and hire date for employees who were hired in 1986.
SELECT employees.first_name,
	employees.last_name,
	employees.hire_date
	FROM employees
	WHERE EXTRACT (year FROM employees.hire_date) = 1986


--List the manager of each department with the following information: department number, 
--department name, the manager's employee number, last name, first name.
Select department_manager.dept_no,
	departments.dept_name,
	department_manager.emp_no, 
	employees.last_name, 
	employees.first_name
FROM department_manager
	INNER JOIN departments 
		ON (department_manager.dept_no = departments.dept_no)
	INNER JOIN employees
		ON (department_manager.emp_no = employees.emp_no);
	
	
--List the department of each employee with the following information: employee number, 
--last name, first name, and department name.
SELECT employees.emp_no,
       employees.last_name,
       employees.first_name,
       departments.dept_name
FROM employees 
    INNER JOIN department_employee
    ON employees.emp_no = department_employee.emp_no
inner join departments
on department_employee.dept_no = departments.dept_no;


--List first name, last name, and sex for employees 
--whose first name is "Hercules" and last names begin with "B."
SELECT employees.first_name,
	   employees.last_name,
	   employees.sex
FROM employees
WHERE employees.first_name = 'Hercules' 
AND employees.last_name LIKE 'B%';


--List all employees in the Sales department, including their employee number,
--last name, first name, and department name.
SELECT employees.emp_no,
	   employees.last_name,
	   employees.first_name,
	   departments.dept_name
FROM employees
LEFT JOIN department_employee 
ON department_employee.emp_no = employees.emp_no
LEFT JOIN departments
ON department_employee.dept_no=departments.dept_no
WHERE dept_name = 'Sales';


--List all employees in the Sales and Development departments, including 
--their employee number, last name, first name, and department name.
SELECT employees.emp_no,
	   employees.last_name,
	   employees.first_name,
	   departments.dept_name
FROM employees
LEFT JOIN department_employee
ON department_employee.emp_no=  employees.emp_no
LEFT JOIN departments
ON department_employee.dept_no = departments.dept_no
WHERE dept_name = 'Sales' OR  dept_name='Development'; 


--In descending order, list the frequency count of employee 
--last names, i.e., how many employees share each last name.
SELECT COUNT (DISTINCT employees.last_name)
FROM employees;



