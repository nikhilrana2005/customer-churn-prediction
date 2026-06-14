import pandas as pd

from sklearn.model_selection import train_test_split
from sklearn.linear_model import LogisticRegression
from sklearn.ensemble import RandomForestClassifier

from sklearn.metrics import (
    accuracy_score,
    classification_report,
    confusion_matrix
)

# Load Data
df = pd.read_csv("clean_telco_data.csv")

# Features and Target
X = df.drop("Churn", axis=1)
y = df["Churn"]

# Split Data
X_train, X_test, y_train, y_test = train_test_split(
    X,
    y,
    test_size=0.2,
    random_state=42
)

# --------------------------
# Logistic Regression
# --------------------------

lr_model = LogisticRegression(max_iter=5000)

lr_model.fit(X_train, y_train)

lr_pred = lr_model.predict(X_test)

print("="*50)
print("LOGISTIC REGRESSION")
print("="*50)

print("Accuracy:",
      accuracy_score(y_test, lr_pred))

print(classification_report(
    y_test,
    lr_pred
))

# --------------------------
# Random Forest
# --------------------------

rf_model = RandomForestClassifier(
    n_estimators=100,
    random_state=42
)

rf_model.fit(X_train, y_train)

rf_pred = rf_model.predict(X_test)

print("="*50)
print("RANDOM FOREST")
print("="*50)

print("Accuracy:",
      accuracy_score(y_test, rf_pred))

print(classification_report(
    y_test,
    rf_pred
))

print("\nConfusion Matrix")
print(confusion_matrix(
    y_test,
    rf_pred
))


feature_importance = pd.DataFrame({
    "Feature": X.columns,
    "Importance": rf_model.feature_importances_
})

feature_importance = feature_importance.sort_values(
    by="Importance",
    ascending=False
)

print(feature_importance.head(10))


feature_importance.to_csv(
    "feature_importance.csv",
    index=False
)