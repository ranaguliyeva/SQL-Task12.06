/*Set 4
1. Alter the "employees_backup" table by dropping the "performance_score" column.*/
alter table employees_backup
drop column performance_score;
commit;

/*2. Insert a new record into the "employees_backup" table. Use your own discretion for the values.*/
insert into employees_backup(employee_id, first_name, last_name, email, phone_number, hire_date, job_id, salary, commission_pct, manager_id, department_id, middle_name)
values (28, 'Jack', 'Mook', 'jackmook@gmail.com', '+712345678', '12-Jan-2022', 4, 15000, null, 3, 23, 'JM');
select * from employees_backup;

/*3. Use the ROUND function to round the salary of all employees to the nearest hundred in the "employees" table.*/
select round(salary, -2) from employees;

/*4. Find the department with the highest number of employees in the "employees" table.*/
select department_id, count(employee_id) as employee_count
from employees
group by department_id
order by employee_count desc
fetch first 1 row only;

/*5. Display the hire_date of all employees in the "employees" table in the format 'YYYY-Q' where Q represents the quarter of the year.*/
select to_char(hire_date, 'YYYY') || '-' || to_char(hire_date, 'Q') as hire_quarter
from employees;
