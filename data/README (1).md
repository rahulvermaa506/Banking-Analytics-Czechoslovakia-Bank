# Banking Analytics — Czechoslovakia Bank

> End-to-end banking analytics project using SQL Server, Python and Power BI to analyse customer behaviour, financial activity, loan portfolio, product usage and regional performance.

---

## Project Overview

This project analyses the **Czechoslovakia Banking Financial Dataset**, which contains approximately **1 million records across 8 interconnected tables covering 5 years of banking operations**.

The project follows a practical Data Analyst workflow:

**SQL Audit → Data Validation → Python Cleaning & EDA → Account 360 / Customer 360 → Power BI → Business Insights**

The objective is to transform raw, relational banking data into business-oriented analytical views that support customer, financial, loan, product and regional analysis.

---

## Business Areas Covered

- Customer Analytics
- Financial & Transaction Performance
- Product Analysis
- Loan Portfolio & Risk Analysis
- Regional & Market Analysis

---

## Dataset Overview

The dataset contains **8 interconnected tables**.

| Table | Role | Description |
|---|---|---|
| **Transactions** | Fact | Financial transactions across bank accounts |
| **Loans** | Fact | Loan records, amounts, payments and status |
| **Orders** | Fact | Standing payment orders and recurring payment instructions |
| **Client** | Dimension | Customer demographic information |
| **Account** | Central Entity | Bank account details and account-level context |
| **Card** | Dimension | Issued card information and card types |
| **District** | Dimension | District, regional, demographic and economic information |
| **Disposition** | Bridge | Customer-to-account relationship |

### Data Architecture

```text
                         District
                        /        \
                       /          \
                  Client          Account
                    |                |
                    |                ├── Transactions
               Disposition           ├── Loans
                    |                └── Orders
                    |
                    └── Card
```

**Account** acts as the central banking entity. Transactions, Loans and Orders are directly associated with accounts. **Disposition** connects Clients with Accounts, while Cards are linked through Disposition. District provides geographic and economic context.

For detailed architecture and table-level documentation, see:

[`docs/02_Data_Architecture.md`](docs/02_Data_Architecture.md)

---

## Key Data Relationships

```text
Client
   ↓
Disposition
   ↓
Account
   ├── Transactions
   ├── Loans
   ├── Orders
   ├── Card Relationship
   └── District Context
```

This structure enables two important analytical views:

### Account 360

Consolidates account-level information including:

- Transaction activity and value
- Credit and withdrawal values
- Loan activity and loan amount
- Problematic loan indicators
- Order activity
- Card counts
- Account and regional information

### Customer 360

Extends the account-level view to customers using the Client and Disposition relationships.

It combines:

- Customer demographics
- Customer district and region
- Account relationships
- Transaction behaviour
- Loan activity
- Card activity

---

## Project Highlights

- ~1M transaction records analysed
- 5,369 customers
- 4,500 accounts
- 682 loans
- 892 cards
- 6,471 standing orders
- Customer 360 analysis
- Account 360 analysis
- SQL-based data audit and validation
- Python-based data cleaning and EDA
- Customer behavioural analysis
- Loan portfolio and risk analysis
- Transaction and financial performance analysis
- Card and product adoption analysis
- Regional and district-level analysis
- 5 interactive Power BI dashboards

---

## Tools & Technologies

- **SQL Server** — data audit, validation, relationship checks and analytical SQL
- **Python** — data cleaning, EDA and customer behavioural analysis
- **Pandas / NumPy** — data manipulation and analysis
- **Matplotlib / Seaborn** — exploratory visualisation
- **Power BI** — data modelling, DAX and interactive dashboards
- **GitHub** — project documentation and portfolio presentation

---

# Power BI Dashboard

## 01. Bank Executive Overview

![Bank Executive Overview](powerbi_screenshots/01_Bank_Executive_Overview.png)

**Focus**
- Overall banking activity
- Transaction performance
- Account distribution
- Loan portfolio
- Regional customer distribution

---

## 02. Customer & Product Analytics

![Customer & Product Analytics](powerbi_screenshots/02_Customer_Product_Analytics.png)

**Focus**
- Customer demographics
- Customer activity segments
- Loan adoption
- Card adoption
- Product cross-usage

---

## 03. Loan Portfolio & Risk Analytics

![Loan Portfolio & Risk Analytics](powerbi_screenshots/03_Loan_Portfolio_Risk_Analytics.png)

**Focus**
- Loan portfolio
- Loan status
- Loan issuance trends
- Problematic loan indicators
- Regional and account-type comparison

**Project-defined problematic loan grouping:** B + D loan statuses.

---

## 04. Transaction & Financial Performance

![Transaction & Financial Performance](powerbi_screenshots/04_Transaction_Financial_Performance.png)

**Focus**
- Credit vs withdrawal value
- Transaction operations
- Transaction purposes
- Transaction volume
- Average transaction value
- Monthly transaction activity

---

## 05. Regional & Market Analysis

![Regional & Market Analysis](powerbi_screenshots/05_Regional_Market_Analysis.png)

**Focus**
- Regional transaction value
- Customer penetration
- Account penetration
- Top districts by transaction value
- District salary and unemployment context
- Regional performance comparison

---

# Key Business Insights

### Customer & Product

- Customer activity varies across Low, Medium and High activity segments.
- Loan adoption differs across customer activity segments.
- Card adoption represents a smaller share of the overall customer base.
- Customer product cross-usage identifies customers holding both loan and card products.

### Loan Portfolio

- The dataset contains 682 loan records.
- 76 loans fall under the project's B+D problematic status grouping.
- Problematic loan rates vary across loan issuance years.
- Loan portfolio characteristics differ across regions and account types.

### Transactions

- Withdrawal transactions have higher transaction volume than credit transactions.
- Transaction activity increased substantially across the available years.
- Transaction value is distributed across different banking operations and purposes.
- Credit and withdrawal activity show different patterns across the analysis period.

### Regional Performance

- Transaction value varies considerably across regions and districts.
- Customer and account penetration differ after population normalisation.
- A smaller group of districts contributes a significant share of transaction activity.
- District salary and unemployment provide additional context for regional analysis.

---

# Project Structure

```text
Banking-Analytics-Czechoslovakia-Bank/
│
├── sql/
│   ├── 01_Data_Audit.sql
│   ├── 02_Data_Validation.sql
│   └── 03_Customer_360.sql
│
├── python/
│   ├── 01_Data_Cleaning.ipynb
│   └── 02_Data_EDA.ipynb
│
├── powerbi_screenshots/
│   ├── 01_Bank_Executive_Overview.png
│   ├── 02_Customer_Product_Analytics.png
│   ├── 03_Loan_Portfolio_Risk_Analytics.png
│   ├── 04_Transaction_Financial_Performance.png
│   └── 05_Regional_Market_Analysis.png
│
├── docs/
│   └── 02_Data_Architecture.md
│
├── presentation/
│   └── Banking_Analytics_Final_Presentation.pptx
│
└── README.md
```

---

# Project Scope

The final project focuses on **descriptive and diagnostic analytics** using SQL Server, Python and Power BI.

Machine Learning and Streamlit were not included in the final scope because the available loan dataset contains only **682 loan records**, with a limited number of records in the project's problematic status grouping. Rather than forcing a predictive model without sufficient project value, the final portfolio focuses on data quality, analytical depth, Customer 360, business dashboards and actionable insights.

---

# Documentation

Detailed project documentation is maintained separately:

- [`02_Data_Architecture.md`](docs/02_Data_Architecture.md) — dataset architecture, table roles, relationships, Account 360 and Customer 360

---

# Author

**Rahul Verma**

BCA | Aspiring Data Analyst / Data Scientist

