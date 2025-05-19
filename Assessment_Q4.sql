SELECT
  u.id AS customer_id,
  CONCAT(first_name, " ", last_name) AS Name,
  TIMESTAMPDIFF(MONTH, u.date_joined, CURRENT_DATE()) AS tenure_months,
  COUNT(a.owner_id) AS total_transactions,
  ROUND(
    (COUNT(a.owner_id) * 12.0 * AVG(a.confirmed_amount) * 0.001)
    / TIMESTAMPDIFF(MONTH, u.date_joined, CURRENT_DATE()),
    2
  ) AS estimated_clv
  
FROM users_customuser AS u
LEFT JOIN savings_savingsaccount AS a
ON u.id = a.owner_id
GROUP BY u.id, name, u.date_joined
ORDER BY estimated_clv DESC;
