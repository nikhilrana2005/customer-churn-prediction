# Customer Churn Analysis & LTV Engine

An end-to-end data analytics project designed to predict customer churn and estimate Customer Lifetime Value (LTV) using the IBM Telco Customer Churn dataset.

This project helps businesses identify customers who are likely to leave and enables data-driven retention strategies to improve customer satisfaction and reduce acquisition costs.

---

## Project Overview

Customer churn is one of the biggest challenges for subscription-based businesses. Acquiring new customers is significantly more expensive than retaining existing ones.

This project analyzes customer demographics, billing information, contract details, and service usage patterns to:

- Identify customers at high risk of churn
- Understand key factors driving churn
- Segment customers based on behavior
- Estimate Customer Lifetime Value (LTV)
- Support targeted retention campaigns

---

## Business Problem

Telecommunication companies often experience revenue loss due to customer attrition.

The primary objectives of this project are:

- Reduce customer churn
- Improve customer retention strategies
- Optimize marketing spend
- Increase customer lifetime value
- Enable proactive decision-making

---

## Dataset Information

**Dataset:** IBM Telco Customer Churn Dataset

**Source:** Kaggle / IBM Watson Analytics

**Records:** 7,043 customers

**Features:** 21 variables including:

- Customer demographics
- Contract details
- Internet services
- Billing information
- Payment methods
- Customer tenure
- Churn status

**Target Variable:** `Churn`

---

## Project Workflow

### 1. Data Ingestion

- Imported raw CSV data
- Loaded data into PostgreSQL
- Performed initial data validation

### 2. Exploratory Data Analysis (EDA)

- Churn distribution analysis
- Contract type analysis
- Tenure analysis
- Payment method analysis
- Monthly charges analysis
- Correlation analysis

### 3. Data Preprocessing

- Handled missing values
- Converted data types
- Encoded categorical variables
- Feature scaling
- Feature engineering

### 4. Predictive Modeling

Models used:

- Logistic Regression
- Random Forest
- XGBoost

Evaluation metrics:

- Accuracy
- Precision
- Recall
- F1-Score
- ROC-AUC

### 5. Model Explainability

- SHAP values
- Feature importance analysis

### 6. Dashboard Development

Built an interactive dashboard to monitor:

- Total customers
- Churn rate
- Contract-wise churn
- Payment method trends
- Tenure distribution
- High-risk customer segments
- LTV segmentation

---

## Dashboard Preview

Add your dashboard screenshot below.

```text
dashboard/dashboard_preview.png


| Category         | Tools & Technologies          |
| ---------------- | ----------------------------- |
| Programming      | Python, SQL                   |
| Database         | PostgreSQL                    |
| Data Analysis    | Pandas, NumPy                 |
| Visualization    | Power BI, Matplotlib, Seaborn |
| Machine Learning | Scikit-learn, XGBoost         |
| Explainability   | SHAP                          |
| API              | FastAPI                       |
| Version Control  | Git, GitHub                   |
