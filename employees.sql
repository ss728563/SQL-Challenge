CREATE TABLE Departments (
    dept_no varchar(4)  NOT NULL ,
    dept_name varchar(30)  NOT NULL ,
    PRIMARY KEY (
        dept_no
    )
);

CREATE TABLE titles (
    title_id varchar(5)  NOT NULL ,
    title varchar(30)  NOT NULL ,
    PRIMARY KEY (
        title_id
    )
);

CREATE TABLE employees (
    emp_no int  NOT NULL ,
    emp_title_id varchar(10)  NOT NULL ,
    birth_date date  NOT NULL ,
    first_name varchar(20)  NOT NULL ,
    last_name varchar(20)  NOT NULL ,
    sex varchar(10)  NOT NULL ,
    hire_date date  NOT NULL ,
    PRIMARY KEY (
        emp_no
    )
);

CREATE TABLE salaries (
    emp_no int  NOT NULL ,
    salary int  NOT NULL 
);

CREATE TABLE dept_emp (
    emp_no int  NOT NULL ,
    dept_no varchar(30)  NOT NULL 
);

CREATE TABLE dept_manager (
    dept_no varchar(30)  NOT NULL ,
    emp_no int  NOT NULL 
);

--1 List the following details of each employee: employee number, last name, first name, sex, and salary.--

SELECT employees.emp_no, employees.last_name, employees.first_name, employees.sex, salaries.salary
FROM employees
JOIN salaries
ON employees.emp_no = salaries.emp_no;


--2 List first name, last name, and hire date for employees who were hired in 1986.--

SELECT employees.first_name, employees.last_name, employees.hire_date
From employees
where hire_date between '01/01/1986' and '12/31/1986';

--3 List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.--

SELECT dept_emp.dept_no, departments.dept_name, employees.emp_no, employees.last_name, employees.first_name, titles.title_id, titles.title
FROM employees
JOIN dept_emp
ON dept_emp.emp_no = employees.emp_no
left JOIN DEPARTMENTS  on departments.dept_no =dept_emp.dept_no
left join titles on titles.title_id = employees.emp_title_id
where title ='Manager'

--4 List the department of each employee with the following information: employee number, last name, first name, and department name.--

Select employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
from employees
join dept_emp on dept_emp.emp_no = employees.emp_no
left join departments on departments.dept_no= dept_emp.dept_no;

--5 List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."--

select employees.first_name, employees.last_name, employees.sex
from employees
where employees.first_name= 'Hercules'
and employees.last_name like 'B%'

--6 List all employees in the Sales department, including their employee number, last name, first name, and department name.--

SELECT dept_emp.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM dept_emp
JOIN employees ON dept_emp.emp_no = employees.emp_no
JOIN departments ON dept_emp.dept_no = departments.dept_no
WHERE departments.dept_name = 'Sales';

--7 List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.--

SELECT dept_emp.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM dept_emp
JOIN employees ON dept_emp.emp_no = employees.emp_no
JOIN departments ON dept_emp.dept_no = departments.dept_no
WHERE departments.dept_name = 'Sales' OR departments.dept_name = 'Development';

--8 In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.--

SELECT last_name,
COUNT(last_name) AS "frequency"
FROM employees
GROUP BY last_name
ORDER BY
COUNT(last_name) DESC;
