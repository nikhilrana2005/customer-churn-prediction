import pandas as pd

df = pd.read_csv("clean_telco_data.csv")

print("Total Customers:", len(df))

print("\nChurn Distribution:")
print(df["Churn"].value_counts())

print("\nAverage Tenure:")
print(df["tenure"].mean())

print("\nAverage Monthly Charges:")
print(df["MonthlyCharges"].mean())

print("\nContract Type Distribution:")
print(df["Contract"].value_counts())