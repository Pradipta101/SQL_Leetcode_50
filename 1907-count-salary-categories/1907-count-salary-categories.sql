# Write your MySQL query statement below
/*SELECT 
    category,
    COUNT(account_id) AS accounts_count
FROM (
    SELECT account_id,
           CASE 
               WHEN income < 20000 THEN 'Low Salary'
               WHEN income BETWEEN 20000 AND 50000 THEN 'Average Salary'
               ELSE 'High Salary'
           END AS category
    FROM Accounts
) t
RIGHT JOIN (
    SELECT 'Low Salary' AS category
    UNION ALL
    SELECT 'Average Salary'
    UNION ALL
    SELECT 'High Salary'
) c
USING (category)
GROUP BY category;*/

SELECT 
    'Low Salary' AS category,
    SUM(CASE WHEN income < 20000 THEN 1 ELSE 0 END) AS accounts_count
FROM Accounts

UNION ALL

SELECT 
    'Average Salary',
    SUM(CASE WHEN income BETWEEN 20000 AND 50000 THEN 1 ELSE 0 END)
FROM Accounts

UNION ALL

SELECT 
    'High Salary',
    SUM(CASE WHEN income > 50000 THEN 1 ELSE 0 END)
FROM Accounts;