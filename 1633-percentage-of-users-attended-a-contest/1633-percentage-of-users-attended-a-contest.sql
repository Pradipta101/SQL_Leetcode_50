# Write your MySQL query statement below
SELECT
    r.contest_id,
    ROUND(COUNT(DISTINCT r.user_id) * 100.0 / u.total_users, 2) AS percentage
FROM Register r
CROSS JOIN (
    SELECT COUNT(*) AS total_users
    FROM Users
) u
GROUP BY r.contest_id
ORDER BY percentage DESC, r.contest_id ASC;

/*select r.contest_id ,
round(count(distinct u.user_id)*100/( select count(user_id)from users) ,2)as percentage
from users u
join register r
on u.user_id = r.user_id
group by r.contest_id
order by percentage desc, r.contest_id*/