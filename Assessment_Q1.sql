SELECT 
    u.id AS Owner_id,
    CONCAT(first_name, " ", last_name) AS Full_Name,
    p.savings_count,
    p.investment_count,
    COALESCE(sa.total, 0) / 100.0 AS total_deposits
    -- Since the total_deposit is in Kobo we divide by 100 also coalesce to avoid NULL values
FROM (
    -- Aggregate plan counts per user; 
    SELECT
        owner_id,
        SUM(CASE WHEN is_regular_savings = 1 THEN 1 ELSE 0 END) AS savings_count,
        SUM(CASE WHEN is_a_fund = 1 THEN 1 ELSE 0 END)         AS investment_count
    FROM plans_plan
    GROUP BY owner_id
    HAVING 
        SUM(CASE WHEN is_regular_savings = 1 THEN 1 ELSE 0 END) >= 1
        AND 
        SUM(CASE WHEN is_a_fund = 1 THEN 1 ELSE 0 END) >= 1
) AS p
JOIN users_customuser AS u
    ON u.id = p.owner_id
LEFT JOIN (
    -- Sum deposits(confirmed_amount) per user
    SELECT 
		owner_id, 
		SUM(confirmed_amount) AS total
    FROM savings_savingsaccount
    GROUP BY owner_id
) AS sa
    ON sa.owner_id = u.id
ORDER BY total_deposits DESC;
