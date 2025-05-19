# DataAnalytics-Assessment

Per-Question Explanations: Explain your approach to each question.
Challenges: Document any particular difficulties you encountered and how you resolved them.

Repository Structure

DataAnalytics-Assessment/
│
|
|
|
|
Assessment_Q1.sql

High-Value Customers with Multiple Products
Scenario: The business wants to identify customers who have both a savings and an investment plan (cross-selling opportunity).
Task: Write a query to find customers with at least one funded savings plan AND one funded investment plan, sorted by total deposits.

Tables: users_customuser || savings_savingsaccount || plans_plan


Per-Question Explanations: 
1. The name column was returning NULL. I used the Concat function to Concatenat the firstname and last name. 
2.The Business want to want to know customers with savings and investment. this might be to cross sell investment to customers that has savings this would benefit both the customers and the business as both parties get higher returns on investment.
3. Sorting the deposit helps the organization to know their High Net-Worth Individuals (HNI), Enagaing this HNI brings more revenue for the Business and the Investor.


Challenges: At first I could not access the file because MySQL had no local instance. I resolved it by uninstalling and reinstalling MySQL with the local server properly set up.


Assessment_Q2.sql

Transaction Frequency Analysis
Scenario: The finance team wants to analyze how often customers transact to segment them (e.g., frequent vs. occasional users).
Task: Calculate the average number of transactions per customer per month and categorize them:
"High Frequency" (≥10 transactions/month)
"Medium Frequency" (3-9 transactions/month)
"Low Frequency" (≤2 transactions/month)

Tables: users_customuser || savings_savingsaccount || Per-Question Explanations: 

Per-Question Explanations: The finance team wants to know how frequents customer transacts. This would enable them become more productive and efficient as they can easily identify High frequent customers transaction and automate their process. 

Challenges: I got this error message "ERROR: 2013. Lost connection to MySQL server during query". I resolved this by increasing the Limit of rows on MySQL workbench 


Assessment_Q3.sql

Account Inactivity Alert
Scenario: The ops team wants to flag accounts with no inflow transactions for over one year.
Task: Find all active accounts (savings or investments) with no transactions in the last 1 year (365 days) .
Tables: plans_plan || savings_savingsaccount

Per-Question Explanations: The operation team wants to flag Dormant accounts. This would enable the sales team reach out to dormant account holders through email blasts and generate more revenue for the company after conversion(Track Conversion Rate)

Challenges: I noticed that the DATE TIMESTAMP needed to be formatted to just date. I used the DATE function for the formatting


Assessment_Q4.sql

Customer Lifetime Value (CLV) Estimation
Scenario: Marketing wants to estimate CLV based on account tenure and transaction volume (simplified model).
Task: For each customer, assuming the profit_per_transaction is 0.1% of the transaction value, 
calculate:
Account tenure (months since signup)
Total transactions
Estimated CLV (Assume: CLV = (total_transactions / tenure) * 12 * avg_profit_per_transaction)
Order by estimated CLV from highest to lowest

Tables: users_customuser || savings_savingsaccount


Per-Question Explanations: The marketing team wants to know their top customer that generate more revenue for the business. This would assist them target the top customer hence we filter estimated CLV in Descending order

Challenges: The Tip for getting Estimated CLV was really helpful. I was able to navigate the calculation with the formular Tip and notice Chima Ataman is our highest revenue generating Customer.
