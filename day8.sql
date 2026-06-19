
CREATE TABLE telco_customers (
    gender INT,
    SeniorCitizen INT,
    Partner INT,
    Dependents INT,
    tenure INT,
    PhoneService INT,
    MultipleLines INT,
    InternetService INT,
    OnlineSecurity INT,
    OnlineBackup INT,
    DeviceProtection INT,
    TechSupport INT,
    StreamingTV INT,
    StreamingMovies INT,
    Contract INT,
    PaperlessBilling INT,
    PaymentMethod INT,
    MonthlyCharges DECIMAL(10,2),
    TotalCharges DECIMAL(10,2),
    Churn INT,
    RevenuePerMonth DECIMAL(10,2),
    YearlyRevenue DECIMAL(10,2)
);

SELECT * FROM telco_customers;

-- ==========================================
-- DAY 8 : CUSTOMER CHURN SQL ANALYSIS
-- ==========================================

-- 1. Total Customers

SELECT COUNT(*) AS total_customers
FROM telco_customers;


-- 2. Total Churned Customers

SELECT COUNT(*) AS churned_customers
FROM telco_customers
WHERE Churn = 1;


-- 3. Overall Churn Rate

SELECT ROUND(
    100.0 * SUM(Churn) / COUNT(*),
    2
) AS churn_rate_percentage
FROM telco_customers;


-- 4. Average Monthly Charges

SELECT ROUND(
    AVG(MonthlyCharges),
    2
) AS avg_monthly_charges
FROM telco_customers;


-- 5. Average Tenure

SELECT ROUND(
    AVG(tenure),
    2
) AS avg_tenure
FROM telco_customers;


-- 6. Contract Type vs Churn

SELECT
    Contract,
    COUNT(*) AS total_customers,
    SUM(Churn) AS churned_customers,
    ROUND(
        100.0 * SUM(Churn) / COUNT(*),
        2
    ) AS churn_rate
FROM telco_customers
GROUP BY Contract
ORDER BY churn_rate DESC;


-- 7. Internet Service vs Churn

SELECT
    InternetService,
    COUNT(*) AS total_customers,
    SUM(Churn) AS churned_customers,
    ROUND(
        100.0 * SUM(Churn) / COUNT(*),
        2
    ) AS churn_rate
FROM telco_customers
GROUP BY InternetService
ORDER BY churn_rate DESC;


-- 8. Tech Support vs Churn

SELECT
    TechSupport,
    COUNT(*) AS total_customers,
    SUM(Churn) AS churned_customers,
    ROUND(
        100.0 * SUM(Churn) / COUNT(*),
        2
    ) AS churn_rate
FROM telco_customers
GROUP BY TechSupport
ORDER BY churn_rate DESC;


-- 9. Paperless Billing vs Churn

SELECT
    PaperlessBilling,
    COUNT(*) AS total_customers,
    SUM(Churn) AS churned_customers,
    ROUND(
        100.0 * SUM(Churn) / COUNT(*),
        2
    ) AS churn_rate
FROM telco_customers
GROUP BY PaperlessBilling
ORDER BY churn_rate DESC;


-- 10. Payment Method vs Churn

SELECT
    PaymentMethod,
    COUNT(*) AS total_customers,
    SUM(Churn) AS churned_customers,
    ROUND(
        100.0 * SUM(Churn) / COUNT(*),
        2
    ) AS churn_rate
FROM telco_customers
GROUP BY PaymentMethod
ORDER BY churn_rate DESC;


-- 11. Average Revenue by Churn Status

SELECT
    Churn,
    ROUND(AVG(RevenuePerMonth), 2) AS avg_revenue_per_month,
    ROUND(AVG(YearlyRevenue), 2) AS avg_yearly_revenue
FROM telco_customers
GROUP BY Churn;


-- 12. Top 10 High Value Customers

SELECT
    TotalCharges,
    tenure,
    MonthlyCharges
FROM telco_customers
ORDER BY TotalCharges DESC
LIMIT 10;