-- First write a query for montly transaction count 
WITH monthly_counts AS (
    SELECT
        s.owner_id,
        YEAR(s.transaction_date) AS year,
        MONTH(s.transaction_date) AS month,
        COUNT(*) AS trans_count
    FROM savings_savingsaccount AS s
    WHERE s.confirmed_amount > 0
    GROUP BY s.owner_id, YEAR(s.transaction_date), MONTH(s.transaction_date)
),
-- use the monthly trancation counts to get the Average counts per month
customer_avg AS (
    SELECT
        owner_id,
        AVG(trans_count) AS avg_trans_per_month
    FROM monthly_counts
    GROUP BY owner_id
)
SELECT 
    CASE
        WHEN avg_trans_per_month >= 10 THEN 'High Frequency'
        WHEN avg_trans_per_month >= 3 THEN 'Medium Frequency'
        ELSE 'Low Frequency'
    END AS frequency_category,
    COUNT(*) AS customer_count,
    ROUND(AVG(avg_trans_per_month), 2) AS avg_transactions_per_month
    -- Use case to filter the segements
FROM customer_avg
GROUP BY frequency_category;
