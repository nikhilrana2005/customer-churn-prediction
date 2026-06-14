import pandas as pd
from sklearn.preprocessing import LabelEncoder

df = pd.read_csv("Telco-Customer-Churn.csv")

df["TotalCharges"] = pd.to_numeric(
    df["TotalCharges"],
    errors="coerce"
)
 
df["TotalCharges"] = df["TotalCharges"].fillna(
    df["TotalCharges"].median()
)

df.drop("customerID", axis=1, inplace=True)

df["RevenuePerMonth"] = (
    df["TotalCharges"] /
    (df["tenure"] + 1)
)

df["YearlyRevenue"] = (
    df["MonthlyCharges"] * 12
)

le = LabelEncoder()

for col in df.select_dtypes(include="object").columns:
    df[col] = le.fit_transform(df[col])

df.to_csv(
    "clean_telco_data.csv",
    index=False
)

print(df.info())
print(df.head())