# Data

The project uses the **Czechoslovakia Banking Financial Dataset**, consisting
of 8 interconnected tables covering customers, accounts, transactions,
loans, cards, standing orders and district-level information.

The **Account** entity acts as the central hub of the analytical model.
Transactions, Loans and Orders connect directly to Account, while
Disposition connects customers with accounts and cards. District provides
geographic and economic context. :contentReference[oaicite:1]{index=1}

## Dataset Overview

| Table | Records | Type | Primary Key | Main Purpose |
|---|---:|---|---|---|
| Client | 5,369 | Dimension | client_id | Customer demographics |
| Account | 4,500 | Central Entity | account_id | Account information |
| Disposition | 5,369 | Bridge | disp_id | Customer–account relationship |
| Card | 892 | Dimension | card_id | Card information |
| Loan | 682 | Fact | loan_id | Loan portfolio and status |
| Orders | 6,471 | Fact | order_id | Standing / recurring payments |
| Transactions | 1,048,575 | Fact | trans_id | Financial transactions |
| District | 77 | Dimension | district_id | Regional and economic information |

---

## Table Structure

### 1. Client

| Column | Key | Data Type | Description |
|---|---|---|---|
| `client_id` | PK | SMALLINT | Unique customer identifier |
| `birth_number` | — | INT | Encoded birth date and gender |
| `district_id` | FK | TINYINT | Customer residence district |

**Business Usage:** Customer demographics, segmentation and regional analysis.

---

### 2. Account

| Column | Key | Data Type | Description |
|---|---|---|---|
| `account_id` | PK | SMALLINT | Unique account identifier |
| `district_id` | FK | TINYINT | Account district |
| `frequency` | — | NVARCHAR | Statement frequency |
| `date` | — | DATE | Account opening date |
| `account_type` | — | NVARCHAR | Type of bank account |

**Business Usage:** Account analysis, customer behaviour and account-level
financial activity.

---

### 3. Disposition

| Column | Key | Data Type | Description |
|---|---|---|---|
| `disp_id` | PK | SMALLINT | Unique disposition identifier |
| `client_id` | FK | SMALLINT | Customer identifier |
| `account_id` | FK | SMALLINT | Account identifier |
| `type` | — | NVARCHAR | Owner / Authorized User |

**Business Usage:** Customer–account relationship and ownership analysis.

---

### 4. Card

| Column | Key | Data Type | Description |
|---|---|---|---|
| `card_id` | PK | SMALLINT | Unique card identifier |
| `disp_id` | FK | SMALLINT | Linked disposition |
| `type` | — | NVARCHAR | Classic / Gold / Junior |
| `issued` | — | NVARCHAR | Card issue date |

**Business Usage:** Card adoption, card type and issuance analysis.

---

### 5. Loan

| Column | Key | Data Type | Description |
|---|---|---|---|
| `loan_id` | PK | SMALLINT | Unique loan identifier |
| `account_id` | FK | SMALLINT | Associated account |
| `date` | — | DATE | Loan date |
| `amount` | — | INT | Loan amount |
| `duration` | — | TINYINT | Loan duration in months |
| `payments` | — | FLOAT | Payment amount |
| `status` | — | NVARCHAR | Loan status A / B / C / D |

**Business Usage:** Loan portfolio, loan amount, duration and risk analysis.

---

### 6. Orders

| Column | Key | Data Type | Description |
|---|---|---|---|
| `order_id` | PK | NCHAR | Unique order identifier |
| `account_id` | FK | NCHAR | Associated account |
| `bank_to` | — | NVARCHAR | Recipient bank |
| `account_to` | — | INT | Recipient account |
| `amount` | — | FLOAT | Payment amount |

**Business Usage:** Standing instructions, recurring payments and payment
behaviour analysis.

> **Note:** Orders represent standing / recurring payment instructions.
> They are not treated as banking products in this project.

---

### 7. Transactions

| Column | Key | Data Type | Description |
|---|---|---|---|
| `trans_id` | PK | INT | Unique transaction identifier |
| `account_id` | FK | SMALLINT | Associated account |
| `date` | — | DATE | Transaction date |
| `type` | — | NVARCHAR | Credit / Withdrawal |
| `operation` | — | NVARCHAR | Transaction operation |
| `amount` | — | NVARCHAR | Transaction amount |
| `balance` | — | NVARCHAR | Account balance after transaction |
| `purpose` | — | NVARCHAR | Transaction purpose |
| `bank` | — | NVARCHAR | Partner bank |
| `account_partern_id` | — | NVARCHAR | Partner account identifier |

**Business Usage:** Transaction volume, transaction value, credit /
withdrawal analysis, operations, purposes and financial trends.

---

### 8. District

| Column | Key | Data Type | Description |
|---|---|---|---|
| `district_id` | PK | TINYINT | District identifier |
| `a2` | — | NVARCHAR | District name |
| `a3` | — | NVARCHAR | Region |
| `a4` | — | INT | Population |
| `a5`–`a8` | — | TINYINT | Municipality population categories |
| `a9` | — | TINYINT | Number of cities |
| `a10` | — | FLOAT | Urban population ratio |
| `a11` | — | SMALLINT | Average salary |
| `a12`–`a13` | — | FLOAT | Unemployment indicators |
| `a14` | — | TINYINT | Entrepreneurs |
| `a15`–`a16` | — | INT | Crime indicators |

**Business Usage:** Regional analysis, population-normalized penetration,
district economic context and market analysis.

---

## Data Relationships

```text
                         District
                        /        \
                       /          \
                  Client          Account
                    │                │
                    │                ├── Transactions
                    ▼                ├── Loans
               Disposition           └── Orders
                    │
                    └── Card
