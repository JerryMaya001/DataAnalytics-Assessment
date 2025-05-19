-- Write a query to show the last transaction and inactive days for savings
SELECT 
    p.id AS plan_id,
    p.owner_id AS owner_id,
    'Savings' AS type,
    DATE(MAX(s.transaction_date)) AS last_transaction_date, -- TRUNCATE DATE TIMESTAMP 
    DATEDIFF(CURRENT_DATE(), MAX(s.transaction_date)) AS inactivity_days
FROM plans_plan p
JOIN savings_savingsaccount s 
ON p.id = s.plan_id
WHERE
    p.is_regular_savings = 1
        AND 
	s.confirmed_amount > 0
GROUP BY p.id , p.owner_id
HAVING MAX(s.transaction_date) < CURRENT_DATE() - INTERVAL 365 DAY
 
UNION ALL 

-- Write a query to show the last transaction and inactive days for investment
SELECT 
    p.id AS plan_id,
    p.owner_id AS owner_id,
    'Investment' AS type,
    p.last_returns_date AS last_transaction_date,
    DATEDIFF(CURRENT_DATE(), p.last_returns_date) AS inactivity_days
FROM plans_plan p
WHERE
    p.is_a_fund = 1
        AND 
	p.last_returns_date < CURRENT_DATE() - INTERVAL 365 DAY;
