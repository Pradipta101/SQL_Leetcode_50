# Write your MySQL query statement below
-- Employees with primary department
select employee_id, department_id
from employee
where primary_flag = 'Y'

union

-- Employees with only one department
select employee_id, max(department_id) as department_id
from employee
group by employee_id
having count(*) = 1