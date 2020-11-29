-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/TGneYt
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE `Departments` (
    `dept_no` varchar(4)  NOT NULL ,
    `dept_name` varchar(30)  NOT NULL ,
    PRIMARY KEY (
        `dept_no`
    )
);

CREATE TABLE `titles` (
    `title_id` varchar(5)  NOT NULL ,
    `title` varchar(30)  NOT NULL ,
    PRIMARY KEY (
        `title_id`
    )
);

CREATE TABLE `employees` (
    `emp_no` int  NOT NULL ,
    `emp_title_id` varchar(10)  NOT NULL ,
    `birth_date` date  NOT NULL ,
    `first_name` varchar(20)  NOT NULL ,
    `last_name` varchar(20)  NOT NULL ,
    `sex` varchar(10)  NOT NULL ,
    `hire_date` date  NOT NULL ,
    PRIMARY KEY (
        `emp_no`
    )
);

CREATE TABLE `salaries` (
    `emp_no` int  NOT NULL ,
    `salary` int  NOT NULL 
);

CREATE TABLE `dept_emp` (
    `emp_no` int  NOT NULL ,
    `dept_no` varchar(30)  NOT NULL 
);

CREATE TABLE `dept_manager` (
    `dept_no` varchar(30)  NOT NULL ,
    `emp_no` int  NOT NULL 
);

ALTER TABLE `Departments` ADD CONSTRAINT `fk_Departments_dept_no` FOREIGN KEY(`dept_no`)
REFERENCES `dept_manager` (`dept_no`);

ALTER TABLE `employees` ADD CONSTRAINT `fk_employees_emp_title_id` FOREIGN KEY(`emp_title_id`)
REFERENCES `titles` (`title_id`);

ALTER TABLE `salaries` ADD CONSTRAINT `fk_salaries_emp_no` FOREIGN KEY(`emp_no`)
REFERENCES `employees` (`emp_no`);

ALTER TABLE `dept_emp` ADD CONSTRAINT `fk_dept_emp_emp_no` FOREIGN KEY(`emp_no`)
REFERENCES `employees` (`emp_no`);

ALTER TABLE `dept_emp` ADD CONSTRAINT `fk_dept_emp_dept_no` FOREIGN KEY(`dept_no`)
REFERENCES `Departments` (`dept_no`);

ALTER TABLE `dept_manager` ADD CONSTRAINT `fk_dept_manager_emp_no` FOREIGN KEY(`emp_no`)
REFERENCES `employees` (`emp_no`);

