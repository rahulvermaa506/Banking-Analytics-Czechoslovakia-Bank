# Project Architecture — Banking Analytics

## 1. Project Overview

This project is an end-to-end banking analytics solution built using the
Czechoslovakia Banking Financial Dataset.

The dataset contains interconnected information related to customers,
accounts, transactions, loans, cards, standing orders, and district-level
demographic and economic indicators.

The objective of the project is to transform these related datasets into a
structured analytical solution that helps understand:

- Customer behaviour
- Account and product usage
- Transaction and financial activity
- Loan portfolio characteristics and risk indicators
- Regional and district-level banking performance
- Customer and account-level behaviour

The project follows a practical Data Analyst workflow, beginning with data
understanding, auditing and validation, followed by Python-based cleaning and
analysis, Customer 360 development, Power BI reporting, and business insights.

---

## 2. Business Problem

The bank has historical customer, account, transaction, loan, card and
district-level information distributed across multiple related tables.

Without a structured analytical framework, it becomes difficult to:

- Understand customer demographics and banking behaviour
- Analyse account and product usage
- Monitor transaction activity over time
- Understand the structure of the loan portfolio
- Identify differences in banking activity across regions and districts
- Connect customer information with account-level banking activity

The project therefore focuses on integrating these datasets and creating a
business-oriented analytical framework for customer, transaction, product,
loan and regional analysis.

---

## 3. Business Objectives

### 3.1 Customer Analytics

- Understand customer demographics
- Analyse customer distribution by age, gender and geography
- Analyse customer activity patterns
- Examine customer product adoption
- Create customer-level analytical views

### 3.2 Financial & Transaction Performance

- Analyse transaction value and volume
- Monitor transaction trends over time
- Compare credit and withdrawal activity
- Analyse transaction operations and purposes
- Understand transaction behaviour at account level

### 3.3 Product Analysis

- Analyse account types
- Analyse card types and issuance trends
- Examine card adoption
- Analyse customer usage across banking products

### 3.4 Loan Portfolio & Risk Analysis

- Analyse loan distribution
- Examine loan amounts and durations
- Analyse loan status
- Monitor problematic loan indicators
- Compare loan portfolio characteristics across regions and account types

### 3.5 Regional & Market Analysis

- Compare banking activity across regions
- Analyse district-level transaction activity
- Normalize customer and account activity using population
- Compare transaction activity with district-level economic indicators

---

## 4. Project Scope

The project focuses on descriptive and diagnostic banking analytics using
SQL Server, Python and Power BI.

The final analytical workflow is:

```text
Raw Banking Data
       ↓
SQL Server
       ↓
Data Audit & Validation
       ↓
Python
       ↓
Data Cleaning & Exploratory Analysis
       ↓
Customer 360 / Account 360
       ↓
Power BI
       ↓
Business Dashboards
       ↓
Business Insights & Presentation
