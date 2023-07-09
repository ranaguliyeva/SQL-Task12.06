/*Set 3
1. Select the last_name, job_id, and department_id from the "employees" table where the last_name like 'S%'.*/
select last_name, job_id, department_id from employees
where last_name like 'S%';

/*2. **Single Function (Analytical)**: Use the RANK() function to display employees' salary ranking within their department.*/
select employee_id, department_id, salary,
rank () over (partition by department_id
              order by salary) as salary_rank
from employees;

/*3. Find the highest, lowest, and average number of employees in each job from the "employees" table.*/
SELECT job_id, MAX(employee_count) AS highest_employee_count, MIN(employee_count) AS lowest_employee_count, AVG(employee_count) AS average_employee_count
FROM (
    SELECT job_id, COUNT(*) AS employee_count
    FROM employees
    GROUP BY job_id
)job_count
GROUP BY job_id;

/*4. Write a query that FULL OUTER JOINs the "employees" table with the "departments" table and 
displays the employee's first name, last name, and department name.*/
select e.first_name, e.last_name, d.department_name
from employees e full join departments d
on e.department_id=d.department_id;

/*5. Write a query that selects all employees in the "employees" table who work in a department with more than 80 employees.*/
select * from employees
where department_id = (
select department_id from employees
group by department_id
having count(employee_id)>80);