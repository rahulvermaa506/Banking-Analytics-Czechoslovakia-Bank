# Business Insights — Banking Analytics

This document presents the key business findings identified through the
SQL, Python EDA, Customer 360 analysis and Power BI dashboards developed
for the Czechoslovakia Bank analytics project.

The objective is to move beyond descriptive charts and connect analytical
findings with their business interpretation and potential actions.

---

## 1. Executive Banking Insights

The analysis covered approximately **1 million transaction records**,
**5,369 customers**, **4,500 accounts** and **682 loans**.

The major findings were:

- Transaction activity increased substantially across the available
  transaction years.
- Withdrawal transactions represent the larger share of transaction volume.
- Banking activity varies considerably across regions and districts.
- Customer activity differs across Low, Medium and High activity segments.
- The loan portfolio contains both active and completed loan categories.
- Product adoption, particularly card adoption, varies across the customer base.

These findings were analysed further through customer, transaction, loan,
product and regional perspectives.

---

# 2. Customer & Account Insights

## 2.1 Account Structure

### Finding

Savings, NRI and Salary accounts have relatively similar representation
within the account base, with no single account type overwhelmingly
dominating the dataset.

`POPLATEK MESICNE` is the dominant account statement frequency, while
weekly and after-transaction frequencies represent smaller portions.

Account openings vary across the available years, with **1996 recording
the highest number of account openings**.

### Business Interpretation

The account base is distributed across multiple account types, while
monthly statement frequency represents the dominant operating pattern.

### Suggested Action

Monitor transaction activity, customer behaviour and product usage by
account type to understand whether different account categories are
associated with different levels of customer engagement.

---

## 2.2 Customer Activity

### Finding

Customer activity varies across **Low, Medium and High** transaction-activity
segments.

High-activity customers show a higher concentration of high
transaction-value behaviour.

### Business Interpretation

Customer engagement is not uniform across the customer base. Customers
with different activity levels demonstrate different transaction and
product-usage patterns.

### Suggested Action

Use Customer 360 to monitor customer activity segments together with
transaction behaviour, loan adoption and card usage.

This allows customer analysis to be performed at segment level rather
than treating the entire customer base as one group.

---

# 3. Transaction & Financial Insights

## 3.1 Transaction Volume

### Finding

A total of **1,048,575 transactions** were analysed.

- **648,366** withdrawal transactions
- **400,209** credit transactions

Withdrawal transactions therefore represent the larger share of
transaction volume.

Transaction activity also increased substantially across the available
years.

### Business Interpretation

The bank's transaction activity is heavily driven by withdrawal-related
transactions, while overall transaction activity expanded over the
available analysis period.

### Suggested Action

Monitor transaction volume and value by:

- Transaction type
- Operation
- Month
- Region

Significant changes in these dimensions can then be investigated to
understand changes in customer banking behaviour.

---

## 3.2 Transaction Operations & Purposes

### Finding

`Withdrawal in Cash` is the largest transaction operation by volume,
followed by `Remittance to Another Bank`.

Among transaction purposes, `Interest Credit`, `Payment on Statement`
and `Household` are major categories by volume.

### Business Interpretation

Transaction activity is concentrated in a limited number of major
operations and purposes.

### Suggested Action

Track major transaction operations and purposes over time to identify
changes in banking activity and understand which transaction categories
contribute most to overall volume and value.

---

## 3.3 High-Value Transaction Concentration

### Finding

The median transaction amount is approximately **2,100**, while the
90th percentile is approximately **18,467**.

The top **20% of transactions by value account for approximately 52.24%**
of total transaction value.

### Business Interpretation

Transaction value is not evenly distributed across transactions.
A relatively smaller group of higher-value transactions contributes a
substantial share of total transaction value.

### Suggested Action

Monitor high-value transaction segments separately from normal transaction
activity and investigate significant changes in high-value transaction
patterns.

---

# 4. Loan Portfolio & Risk Insights

## 4.1 Loan Portfolio

### Finding

A total of **682 loans** were analysed.

- Average loan amount: approximately **151,410**
- Median loan amount: approximately **116,928**
- Common durations: **12, 24, 36, 48 and 60 months**

Loan amounts vary considerably across the portfolio.

### Business Interpretation

The loan portfolio contains loans with different amounts and repayment
durations, creating variation in portfolio structure.

### Suggested Action

Monitor loan amount and duration distributions regularly, particularly
when reviewing changes in portfolio composition across regions and
account types.

---

## 4.2 Problematic Loan Indicators

### Finding

**76 of 682 loans** fall under the project's problematic **B+D status
grouping**, resulting in a problematic loan rate of approximately
**11.14%**.

Problematic loan rates vary across issuance years, regions and account
types.

The 1998 issuance year shows a noticeably lower problematic loan rate
than earlier years. The analysis does not establish the reason for this
difference.

### Business Interpretation

Problematic-loan indicators are not evenly distributed across the
portfolio. Portfolio monitoring should therefore consider relevant
segments rather than relying only on the overall rate.

### Suggested Action

Use the following dimensions during loan portfolio reviews:

- Loan status
- Issuance year
- Region
- Account type

Segments showing relatively higher problematic-loan rates can be
investigated further by the relevant risk or collections teams.

> **Important:** B+D is a project-defined problematic-loan grouping based
> on the available status definitions. It is not treated as a formal bank
> default or NPL classification.

---

# 5. Product & Card Insights

## 5.1 Card Adoption

### Finding

The dataset contains **892 cards** across Classic, Gold and Junior
card types.

Card adoption represents a smaller share of the overall customer base.

### Business Interpretation

Card products are used by a smaller portion of the customer base relative
to the total customer population.

### Suggested Action

Analyse card adoption by:

- Account type
- Customer activity segment
- Customer product combination

This can help identify customer groups with relatively lower card usage
for further product-engagement analysis.

---

## 5.2 Card Issuance

### Finding

Card issuance increased across the available issuance years, with
**2021 recording the highest issuance**.

### Business Interpretation

The number of cards issued increased over the available period, indicating
growth in card issuance activity.

### Suggested Action

Continue monitoring card issuance trends alongside customer activity and
account type to understand which customer groups contribute to changes
in card adoption.

---

## 5.3 Customer Product Cross-Usage

### Finding

Customer 360 analysis shows customers holding both loan and card products.

Loan adoption also differs across customer activity segments.

### Business Interpretation

Customer product usage is not uniform, and product relationships can be
analysed together with customer activity.

### Suggested Action

Use Customer 360 to analyse product combinations and identify customer
segments with different levels of product adoption.

---

# 6. Regional & Market Insights

## 6.1 Regional Transaction Activity

### Finding

Transaction value varies considerably across regions and districts.

A relatively small group of districts contributes a significant share
of transaction activity.

### Business Interpretation

Banking activity is geographically concentrated and differs across
districts.

### Suggested Action

Use district-level transaction value to identify areas requiring further
investigation and combine transaction activity with customer and account
metrics.

---

## 6.2 Customer & Account Penetration

### Finding

Customer and account penetration differ across regions after normalizing
activity by population.

### Business Interpretation

Raw customer or account counts alone can be misleading when comparing
districts with different population sizes.

Population-normalized measures provide additional context for regional
comparison.

### Suggested Action

Use:

- Customer penetration per 1,000 population
- Account penetration per 1,000 population
- Transaction value
- Customer count
- Account count

together when reviewing regional banking activity.

> **Note:** Population-normalized penetration provides comparative context.
> It does not independently indicate whether a region is performing well
> or poorly.

---

## 6.3 District Economic Context

### Finding

District-level average salary and unemployment indicators provide
additional economic context for regional banking activity.

The District Economic Profile compares salary, unemployment and
transaction activity at district level.

### Business Interpretation

Regional banking activity should be interpreted alongside the economic
characteristics of the districts rather than using transaction value alone.

### Suggested Action

During regional reviews, compare banking activity with population and
economic indicators to identify areas that require further investigation.

The analysis shows relationships between these variables but does not
establish causation.

---

# 7. Key Business Findings

The complete analysis highlights the following major findings:

| Business Area | Key Finding | Business Focus |
|---|---|---|
| Customer Behaviour | Customer activity differs across Low, Medium and High segments | Segment-level customer analysis using Customer 360 |
| Account Usage | Account types have relatively similar representation while monthly statement frequency dominates | Monitor activity and usage by account type |
| Transaction Activity | Withdrawals represent the larger share of transaction volume | Monitor transaction type, operation and value trends |
| High-Value Transactions | Top 20% of transactions by value contribute approximately 52.24% of total transaction value | Monitor high-value transaction behaviour |
| Loan Portfolio | 682 loans were analysed with different amounts and durations | Monitor portfolio structure by amount, duration and segment |
| Problematic Loans | 76 of 682 loans fall under the project-defined B+D grouping | Segment-based loan monitoring |
| Card Adoption | Card adoption is smaller than the overall customer base | Analyse adoption by customer and account segments |
| Card Issuance | 2021 recorded the highest card issuance | Monitor issuance trends and customer segments |
| Regional Activity | Transaction activity varies considerably across districts | Combine transaction activity with regional context |
| Regional Penetration | Customer and account penetration differ after population normalization | Use population-normalized measures for comparison |

---

# 8. Business Action Areas

Based on the findings, the analysis identifies five practical areas
for continued business investigation.

### 1. Customer Engagement

Use Customer 360 to monitor customer activity, transaction behaviour
and product adoption at segment level.

### 2. Transaction Monitoring

Track transaction volume and value by type, operation, month and region,
with additional attention to high-value transaction activity.

### 3. Loan Portfolio Monitoring

Review loan status and problematic-loan indicators across issuance year,
region and account type rather than relying only on the overall portfolio
rate.

### 4. Product Adoption

Analyse card adoption and customer product combinations to understand
where product usage differs across customer segments.

### 5. Regional Analysis

Review district-level banking activity together with population,
customer penetration, account penetration, salary and unemployment
indicators.

---

# 9. Analytical Scope & Limitations

The findings in this document are based on the available banking dataset
and the analytical definitions used in this project.

Important limitations include:

- The dataset does not provide a formal loan-application approval field,
  so an approval rate was not calculated.
- The problematic loan indicator uses the project's B+D status grouping
  and should not be interpreted as a formal default or NPL measure.
- Regional economic relationships are descriptive; the analysis does not
  establish causal relationships.
- Customer activity segments are analytical segments created for this
  project and should not be interpreted as official bank customer tiers.
- Machine Learning was excluded from the final scope because the available
  loan dataset contains only 682 records, including 76 records in the
  project-defined problematic grouping.

---

# 10. Final Business Perspective

The analysis converts fragmented banking data into a business-oriented
analytical framework covering:

**Customer → Account → Transaction → Product → Loan → Region**

The most important business themes identified are:

- Differences in customer activity and product usage
- Strong growth in transaction activity
- Higher transaction volume from withdrawals
- Concentration of transaction value in higher-value transactions
- Variation in problematic-loan indicators
- Differences in card adoption and issuance
- Significant variation in district-level banking activity

The resulting SQL, Python and Power BI solution provides the bank with
a structured foundation for monitoring these areas and identifying
segments that require further business investigation.
