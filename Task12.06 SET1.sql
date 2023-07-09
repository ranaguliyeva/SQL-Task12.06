--SET1
/*1. **DDL operations**: Create a copy of the "employees" table named "employees_backup" without including the data.*/
create table employees_backup as
select * from employees
where 1=0;
select * from employees_backup;

/*2. **DML operations (UPDATE)**: 
Update the salary of all employees in the "employees_backup" table 
by adding a 15% raise for those who were hired in the year 2000.*/
update employees_backup
set salary=1.15*salary 
where extract(year from hire_date)=2000;

/*3. **Single Function (Date)**: 
List all employees in the "employees" table who were hired on a Friday.*/
select * from employees
where to_char(hire_date, 'D') = 5;

/*4. **Aggregate Functions**: Calculate the total salary paid per job in the "employees" table.*/
select sum(salary), job_id from employees
group by job_id;

/*5. **Joins**: Using a LEFT JOIN, list all departments from the "departments" table and 
the count of employees in each department from the "employees" table.*/
select count(e.employee_id), d.department_name from departments d
left join employees e on e.department_id=d.department_id
group by d.department_name;