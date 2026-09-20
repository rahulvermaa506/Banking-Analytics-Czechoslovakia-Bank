# Data

This folder contains information about the datasets used in the Banking Analytics project.

## Dataset Overview

The project is based on the **Czechoslovakia Banking Financial Dataset**, consisting of interconnected banking tables covering:

- Customer information
- Account information
- Transactions
- Loans
- Cards
- Standing payment orders
- District and regional information
- Customer-account relationships

The dataset contains approximately **1 million transaction records** across the banking tables.

## Data Architecture

### Fact Tables
- Transactions
- Loans
- Orders

### Dimension Tables
- Clients
- Accounts
- Cards
- Districts

### Bridge Table
- Disposition

The **Account** table acts as the central entity connecting major banking activities, while the **Disposition** table connects customers with accounts.

## Data Privacy & Availability

The original banking dataset is not included in this repository.

The repository contains the SQL scripts, Python notebooks, Power BI dashboard, dashboard screenshots, and project documentation used for the analysis.

> Raw data files are excluded from this repository to keep the project focused on the analytical workflow and to avoid redistributing the source dataset.
