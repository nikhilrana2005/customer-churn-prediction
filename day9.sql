-- ==========================================
-- DAY 9 : ADVANCED SQL ANALYSIS
-- ==========================================

-- 1. Customer Risk Segmentation

SELECT
    tenure,
    MonthlyCharges,
    Churn,

    CASE
        WHEN tenure < 12 THEN 'High Risk'
        WHEN tenure BETWEEN 12 AND 24 THEN 'Medium Risk'
        ELSE 'Low Risk'
    END AS risk_category

FROM telco_customers
LIMIT 20;


-- 2. Churn Rate by Risk Category

SELECT
    CASE
        WHEN tenure < 12 THEN 'High Risk'
        WHEN tenure BETWEEN 12 AND 24 THEN 'Medium Risk'
        ELSE 'Low Risk'
    END AS risk_category,

    COUNT(*) AS total_customers,

    SUM(Churn) AS churned_customers,

    ROUND(
        100.0 * SUM(Churn) / COUNT(*),
        2
    ) AS churn_rate

FROM telco_customers

GROUP BY risk_category

ORDER BY churn_rate DESC;


-- 3. Create View for Dashboard

CREATE OR REPLACE VIEW churn_summary AS

SELECT
    Contract,
    InternetService,
    TechSupport,

    COUNT(*) AS total_customers,

    SUM(Churn) AS churned_customers,

    ROUND(
        100.0 * SUM(Churn) / COUNT(*),
        2
    ) AS churn_rate

FROM telco_customers

GROUP BY
    Contract,
    InternetService,
    TechSupport;


-- Check View

SELECT *
FROM churn_summary
LIMIT 20;


-- 4. Revenue Ranking

SELECT
    TotalCharges,

    RANK() OVER (
        ORDER BY TotalCharges DESC
    ) AS revenue_rank

FROM telco_customers
LIMIT 20;


-- 5. Top 10 Revenue Customers

SELECT
    TotalCharges,
    tenure,
    MonthlyCharges,

    RANK() OVER (
        ORDER BY TotalCharges DESC
    ) AS revenue_rank

FROM telco_customers

ORDER BY TotalCharges DESC

LIMIT 10;


-- 6. Average Monthly Charges by Churn

SELECT
    Churn,

    ROUND(
        AVG(MonthlyCharges),
        2
    ) AS avg_monthly_charges

FROM telco_customers

GROUP BY Churn;


-- 7. Running Total Revenue

SELECT
    tenure,
    TotalCharges,

    SUM(TotalCharges) OVER (
        ORDER BY tenure
    ) AS cumulative_revenue

FROM telco_customers

LIMIT 20;


-- 8. Revenue Quartiles

SELECT
    TotalCharges,

    NTILE(4) OVER (
        ORDER BY TotalCharges DESC
    ) AS revenue_quartile

FROM telco_customers

LIMIT 20;


SELECT * FROM churn_summary;


psql -U postgres -d c