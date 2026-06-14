import pandas as pd

# Load Dataset
df = pd.read_csv("Telco-Customer-Churn.csv")

# Shape
print("Dataset Shape:")
print(df.shape)

# Columns
print("\nColumns:")
print(df.columns)

# Information
print("\nDataset Info:")
print(df.info())

# Missing Values
print("\nMissing Values:")
print(df.isnull().sum())

# Churn Distribution
print("\nChurn Distribution:")
print(df["Churn"].value_counts())

# First 5 Records
print("\nFirst 5 Rows:")
print(df.head())