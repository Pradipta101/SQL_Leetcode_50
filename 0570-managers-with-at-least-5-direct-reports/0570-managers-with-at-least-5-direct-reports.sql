# Write your MySQL query statement below
# Write your MySQL query statement below
SELECT e1.name from 
employee as e1
JOIN employee as e2
on e1.id=e2.managerID
GROUP BY e1.name,e1.id
HAVING count(e1.id)>=5;