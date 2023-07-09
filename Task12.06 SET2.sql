/*Set 2
1. **Conversion Functions**: Show the job_id in the "jobs" table in all uppercase.*/
select upper(job_id) from jobs;

/*2. Find all employees in the "employees" table whose salary is above the average salary of their respective departments.*/
select * from employees e
where salary > (
select avg(salary) from employees
where department_id = e.department_id);

/*3. Use the UNION operator to create a list of all unique job_ids from both the "employees" and "job_history" tables.*/
select job_id from employees
union
select job_id from job_history;

/*4. Delete all records from the "employees_backup" table where the salary is below 3000.*/
delete from employees_backup
where salary<3000;

/*5. Add a new column to the "employees_backup" table called "performance_score" of type INTEGER.*/
alter table employees_backup
add performance_score int;