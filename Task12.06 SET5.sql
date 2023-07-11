/*Set 5
1. Use the MINUS operator to display all employees in the "employees" table who have never been a manager 
(based on the manager_id column).*/
select * from employees
minus
select * from employees
where manager_id is not null;

/*2. Write a query that INNER JOINs the "employees" table with the "jobs" table and displays the 
employee's first name, last name, and job title.*/
select e.first_name, e.last_name, j.job_title from employees e 
join jobs j on e.job_id = j.job_id;

/*3. Select the first_name, last_name, salary, and department_id from the "employees" table where 
the salary is not in the top 5 salaries.*/
select first_name, last_name, salary, department_id from employees 
where salary not in(
select salary from employees
order by salary desc
fetch next 5 rows only);

/*4. Create a new table called "employee_projects" that includes the following columns: 
"project_id" (integer), "employee_id" (integer), "start_date" (date), "end_date" (date), "role" (varchar).*/
create table employee_projects(
    project_id integer,
    employee_id integer,
    start_date date,
    end_date date,
    role varchar(50));

/*5. In the "employees_backup" table, set the commission_pct to 0 for all employees who don't have a commission_pct.*/
update employees_backup
set commission_pct=0
where commission_pct is null;
commit;