/*Set 6
1. **Aggregate Functions**: Find the mode of the salary (most frequently occurring salary) in the "employees" table.*/
SELECT MODE(salary) AS mode_salary
FROM employees;

/*2. Display all employees who report to the manager who manages the most employees in the "employees" table.*/
select salary from(
    select salary, count(*),
    rank() over (order by count(*) desc) as rank
    from employees
    group by salary)
where rank=1;

select salary as mode_salary
from(
    select salary, count(*) from employees
    group by salary
    order by count(*) desc)
fetch first 1 row only;

SELECT salary AS mode_salary
FROM (
  SELECT salary, COUNT(*) AS frequency
  FROM employees
  GROUP BY salary
  ORDER BY COUNT(*) DESC
)
WHERE ROWNUM = 1;

/*3. Use the CONCAT function to display each employee's full name (first name and last name) in the "employees" table.*/ 
select concat(concat(first_name, ' '), last_name) from employees;

/*4. Write a query to display the first_name, last_ name, and department_name of all employees 
who work in countries that have a country_name starting with 'U'.*/
select e.first_name, e.last_name, d.department_name from employees e
join departments d on e.department_id=d.department_id
join locations l on d.location_id=l.location_id
join countries c on l.country_id=c.country_id
where country_name like 'U%';

/*5. Add a "country_id" column to the "employee_projects" table.*/
alter table employee_projects
add country_id number;