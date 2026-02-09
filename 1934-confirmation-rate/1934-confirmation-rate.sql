# Write your MySQL query statement below
/*select  s.user_id,  
round(avg(if(c.action='confirmed',1,0)),2) as confirmation_rate
from Signups s
left join Confirmations c
on s.user_id = c.user_id 
group by s.user_id*/

SELECT s.user_id,
       IFNULL(ROUND(c.confirmed / c.total, 2), 0) AS confirmation_rate
FROM Signups s
LEFT JOIN (
    SELECT user_id,
           SUM(action = 'confirmed') AS confirmed,
           COUNT(*) AS total
    FROM Confirmations
    GROUP BY user_id
) c
ON s.user_id = c.user_id;
