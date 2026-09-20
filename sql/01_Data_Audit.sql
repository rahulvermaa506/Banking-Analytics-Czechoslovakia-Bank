use alabs;

-- Dataset Overview 

select TABLE_NAME from INFORMATION_SCHEMA.TABLES
where TABLE_TYPE= 'Base Table'
order by TABLE_NAME;

-- Number of rows Each Table 

SELECT 'ACCOUNT' AS TABLE_NAME, COUNT(*) AS TOTAL_ROWS FROM ACCOUNT
UNION ALL 
SELECT 'CARD' AS TABLE_NAME , COUNT(*) AS TOTAL_ROWS FROM CARD
UNION ALL
SELECT 'CLIENT' AS TABLE_NAME , COUNT(*) AS TOTAL_ROWS FROM CLIENT
UNION ALL
SELECT 'DISP' AS TABLE_NAME , COUNT(*) AS TOTAL_ROWS FROM DISP
UNION ALL 
SELECT 'DISTRICT' AS TABLE_NAME , COUNT(*) AS TOTAL_ROWS FROM DISTRICT
UNION ALL 
SELECT 'LOAN' AS TABLE_NAME, COUNT(*) AS TOTAL_ROWS FROM LOAN
UNION ALL 
SELECT 'ORDERS' AS TABLE_NAME , COUNT(*) AS TOTAL_ROWS FROM DBO.orders
UNION ALL
SELECT 'TRNX_16' AS TABLE_NAME , COUNT(*) AS TOTAL_ROWS FROM TRNX_16
UNION ALL
SELECT 'TRNX_17' AS TABLE_NAME , COUNT(*) AS TOTAL_ROWS FROM TRNX_17
UNION ALL 
SELECT 'TRNX_18' AS TABLE_NAME , COUNT(*) AS TOTAL_ROWS FROM TRNX_18
UNION ALL
SELECT 'TRNX_19_NEW' AS TABLE_NAME , COUNT(*) AS TOTAL_ROWS FROM TRNX_19_NEW
UNION ALL
SELECT 'TRNX_20_NEW' AS TABLE_NAME , COUNT(*) AS TOTAL_ROWS FROM TRNX_20_NEW
UNION ALL 
SELECT 'TRNX_21_NEW' AS TABLE_NAME , COUNT(*) AS TOTAL_ROWS FROM TRNX_21_NEW;

-- Number of Columns 

select TABLE_NAME , count(COLUMN_NAME) as TOTAL_COLUMNS from INFORMATION_SCHEMA.COLUMNS group by TABLE_NAME;

-- DATA TYPES

select TABLE_NAME , COLUMN_NAME , DATA_TYPE from INFORMATION_SCHEMA.COLUMNS
ORDER BY TABLE_NAME;

-- Data Type Review
-- Orders table order_id and account_id is nchar we need to change into int 
select * from orders
where try_cast(order_id as int) is null
select * from orders
where try_cast(account_id as smallint) is null 

-- there is no problem 

-- card table issued is nvarchar we need to change into date 

select * from card
where try_cast(issued as datetime) is null ;

--there is no problem 

-- trans 

select * from trnx_16
where try_cast(amount as decimal(18,2)) is null 
or
(try_cast(balance as decimal(18,2)) is null and balance is not null)
or (try_cast(account_partern_id as int) is null and account_partern_id is not null);

select * from trnx_17
where try_cast(amount as decimal(18,2)) is null 
or
(try_cast(balance as decimal(18,2)) is null and balance is not null)
or (try_cast(account_partern_id as int) is null and account_partern_id is not null);

select * from trnx_18
where try_cast(amount as decimal(18,2)) is null 
or
(try_cast(balance as decimal(18,2)) is null and balance is not null)
or (try_cast(account_partern_id as int) is null and account_partern_id is not null);

select * from trnx_19_new
where try_cast(amount as decimal(18,2)) is null 
or
(try_cast(balance as decimal(18,2)) is null and balance is not null)
or (try_cast(account_partern_id as int) is null and account_partern_id is not null);

select * from trnx_20_new
where try_cast(amount as decimal(18,2)) is null 
or
(try_cast(balance as decimal(18,2)) is null and balance is not null)
or (try_cast(account_partern_id as int) is null and account_partern_id is not null);

select * from trnx_21_new
where try_cast(amount as decimal(18,2)) is null 
or
(try_cast(balance as decimal(18,2)) is null and balance is not null)
or (try_cast(account_partern_id as int) is null and account_partern_id is not null);

-- there is no problem 

-- DUPLICATES CHECK 

SELECT ACCOUNT_ID ,COUNT(*) AS DUPLICATE_COUNT FROM ACCOUNT 
GROUP BY ACCOUNT_ID
HAVING COUNT(*)>1;

SELECT CARD_ID ,COUNT(*) AS DUPLICATE_COUNT FROM CARD 
GROUP BY CARD_ID
HAVING COUNT(*)>1;

SELECT client_id ,COUNT(*) AS DUPLICATE_COUNT FROM CLIENT
GROUP BY client_id
HAVING COUNT(*)>1;

SELECT disp_id ,COUNT(*) AS DUPLICATE_COUNT FROM DISP 
GROUP BY disp_id
HAVING COUNT(*)>1;

SELECT district_id ,COUNT(*) AS DUPLICATE_COUNT FROM district
GROUP BY district_id
HAVING COUNT(*)>1;

SELECT loan_id ,COUNT(*) AS DUPLICATE_COUNT FROM LOAN 
GROUP BY loan_id
HAVING COUNT(*)>1;

SELECT ORDER_ID ,COUNT(*) AS DUPLICATE_COUNT FROM ORDERS 
GROUP BY ORDER_ID
HAVING COUNT(*)>1;

SELECT trans_id ,COUNT(*) AS DUPLICATE_COUNT FROM trnx_16 
GROUP BY trans_id
HAVING COUNT(*)>1;

SELECT trans_id ,COUNT(*) AS DUPLICATE_COUNT FROM trnx_17 
GROUP BY trans_id
HAVING COUNT(*)>1;

SELECT trans_id ,COUNT(*) AS DUPLICATE_COUNT FROM trnx_18 
GROUP BY trans_id
HAVING COUNT(*)>1;

SELECT trans_id ,COUNT(*) AS DUPLICATE_COUNT FROM trnx_19_new 
GROUP BY trans_id
HAVING COUNT(*)>1;

SELECT trans_id ,COUNT(*) AS DUPLICATE_COUNT FROM trnx_20_new
GROUP BY trans_id
HAVING COUNT(*)>1;

SELECT trans_id ,COUNT(*) AS DUPLICATE_COUNT FROM trnx_21_new
GROUP BY trans_id
HAVING COUNT(*)>1;



-- NULL CHECK 

-- ACCOUNT
SELECT 
SUM(CASE WHEN account_id IS NULL THEN 1 ELSE 0 END) AS NULL_ACCOUNT_ID,
SUM(CASE WHEN district_id IS NULL THEN 1 ELSE 0 END) AS NULL_DISTRIC_ID,
SUM(CASE WHEN frequency IS NULL THEN 1 ELSE 0 END ) AS NULL_FREQUENCY,
SUM(CASE WHEN date IS NULL THEN 1 ELSE 0 END ) AS NULL_DATE,
SUM(CASE WHEN Account_type IS NULL THEN 1 ELSE 0 END) AS NULL_ACCOUNT_TYPE 
FROM ACCOUNT;

-- CARD 
SELECT 
SUM(CASE WHEN card_id IS NULL THEN 1 ELSE 0 END) AS NULL_CARD_ID,
SUM(CASE WHEN DISP_ID IS NULL THEN 1 ELSE 0 END) AS NULL_DISP_ID,
SUM(CASE WHEN TYPE IS NULL THEN 1 ELSE 0 END) AS NULL_TYPE,
SUM(CASE WHEN issued IS NULL THEN 1 ELSE 0 END ) AS NULL_ISSUED
FROM CARD;

-- CLIENT 
SELECT 
SUM(CASE WHEN client_id IS NULL THEN 1 ELSE 0 END) AS NULL_CLIENT_ID,
SUM(CASE WHEN birth_number IS NULL THEN 1 ELSE 0 END) AS NULL_BIRTH_NUMBER,
SUM(CASE WHEN district_id IS NULL THEN 1 ELSE 0 END ) AS NULL_DISTRICT_ID
FROM CLIENT;

-- DISP
SELECT 
SUM(CASE WHEN disp_id IS NULL THEN 1 ELSE 0 END) AS NULL_DISP_ID,
SUM(CASE WHEN client_id IS NULL THEN 1 ELSE 0 END ) AS NULL_CLIENT_ID,
SUM(CASE WHEN account_id IS NULL THEN 1 ELSE 0 END ) AS NULL_ACCOUNT_ID,
SUM(CASE WHEN type IS NULL THEN 1 ELSE 0 END) AS NULL_TYPE
FROM DISP;

-- DISTRICT 
SELECT
    SUM(CASE WHEN district_id IS NULL THEN 1 ELSE 0 END) AS Null_DISTRICT_ID,
    SUM(CASE WHEN A2 IS NULL THEN 1 ELSE 0 END) AS Null_A2,
    SUM(CASE WHEN A3 IS NULL THEN 1 ELSE 0 END) AS Null_A3,
    SUM(CASE WHEN A4 IS NULL THEN 1 ELSE 0 END) AS Null_A4,
    SUM(CASE WHEN A5 IS NULL THEN 1 ELSE 0 END) AS Null_A5,
    SUM(CASE WHEN A6 IS NULL THEN 1 ELSE 0 END) AS Null_A6,
    SUM(CASE WHEN A7 IS NULL THEN 1 ELSE 0 END) AS Null_A7,
    SUM(CASE WHEN A8 IS NULL THEN 1 ELSE 0 END) AS Null_A8,
    SUM(CASE WHEN A9 IS NULL THEN 1 ELSE 0 END) AS Null_A9,
    SUM(CASE WHEN A10 IS NULL THEN 1 ELSE 0 END) AS Null_A10,
    SUM(CASE WHEN A11 IS NULL THEN 1 ELSE 0 END) AS Null_A11,
    SUM(CASE WHEN A12 IS NULL THEN 1 ELSE 0 END) AS Null_A12,
    SUM(CASE WHEN A13 IS NULL THEN 1 ELSE 0 END) AS Null_A13,
    SUM(CASE WHEN A14 IS NULL THEN 1 ELSE 0 END) AS Null_A14,
    SUM(CASE WHEN A15 IS NULL THEN 1 ELSE 0 END) AS Null_A15,
    SUM(CASE WHEN A16 IS NULL THEN 1 ELSE 0 END) AS Null_A16
FROM district;


-- LOAN 

SELECT
    SUM(CASE WHEN loan_id IS NULL THEN 1 ELSE 0 END) AS Null_Loan_ID,
    SUM(CASE WHEN account_id IS NULL THEN 1 ELSE 0 END) AS Null_Account_ID,
    SUM(CASE WHEN date IS NULL THEN 1 ELSE 0 END) AS Null_Date,
    SUM(CASE WHEN amount IS NULL THEN 1 ELSE 0 END) AS Null_Amount,
    SUM(CASE WHEN duration IS NULL THEN 1 ELSE 0 END) AS Null_Duration,
    SUM(CASE WHEN payments IS NULL THEN 1 ELSE 0 END) AS Null_Payments,
    SUM(CASE WHEN status IS NULL THEN 1 ELSE 0 END) AS Null_Status
FROM loan;

-- ORDERS 

SELECT 
    SUM(CASE WHEN order_id IS NULL THEN 1 ELSE 0 END) AS NULL_ORDEER_ID,
    SUM(CASE WHEN account_id IS NULL THEN 1 ELSE 0 END ) AS NULL_ACCOUNT_ID,
    SUM(CASE WHEN Bank_to IS NULL THEN 1 ELSE 0 END) AS NULL_BANK_TO,
    SUM(CASE WHEN account_to IS NULL THEN 1 ELSE 0 END ) AS NULL_ACCOUNT_TO,
    SUM(CASE WHEN amount IS NULL THEN 1 ELSE 0 END ) AS NULL_AMOUNT
FROM ORDERS;



-- TRNX_16

SELECT 
    SUM(CASE WHEN trans_id IS NULL THEN 1 ELSE 0 END) AS NULL_TRANS_ID,
    SUM(CASE WHEN account_id IS NULL THEN 1 ELSE 0 END ) AS NULL_ACCOUNT_ID,
    SUM(CASE WHEN DATE IS NULL THEN 1 ELSE 0 END ) AS NULL_DATE,
    SUM(CASE WHEN TYPE IS NULL THEN 1 ELSE 0 END ) AS NULL_TYPE,
    SUM(CASE WHEN operation IS NULL THEN 1 ELSE 0 END ) AS NULL_OPERATION,
    SUM(CASE WHEN AMOUNT IS NULL THEN 1 ELSE 0 END) AS NULL_AMOUNT ,
    SUM(CASE WHEN balance IS NULL THEN 1 ELSE 0 END ) AS NULL_BALANCE,
    SUM(CASE WHEN Purpose IS NULL THEN 1 ELSE 0 END ) AS NULL_PURPOSE ,
    SUM(CASE WHEN bank IS NULL THEN 1 ELSE 0 END ) AS NULL_BANK,
    SUM(CASE WHEN account_partern_id IS NULL THEN 1 ELSE 0 END) AS NULL_ACCOUNT_PARTERN_ID
FROM TRNX_16;

-- TRNX_17

SELECT 
    SUM(CASE WHEN trans_id IS NULL THEN 1 ELSE 0 END) AS NULL_TRANS_ID,
    SUM(CASE WHEN account_id IS NULL THEN 1 ELSE 0 END ) AS NULL_ACCOUNT_ID,
    SUM(CASE WHEN DATE IS NULL THEN 1 ELSE 0 END ) AS NULL_DATE,
    SUM(CASE WHEN TYPE IS NULL THEN 1 ELSE 0 END ) AS NULL_TYPE,
    SUM(CASE WHEN operation IS NULL THEN 1 ELSE 0 END ) AS NULL_OPERATION,
    SUM(CASE WHEN AMOUNT IS NULL THEN 1 ELSE 0 END) AS NULL_AMOUNT ,
    SUM(CASE WHEN balance IS NULL THEN 1 ELSE 0 END ) AS NULL_BALANCE,
    SUM(CASE WHEN Purpose IS NULL THEN 1 ELSE 0 END ) AS NULL_PURPOSE ,
    SUM(CASE WHEN bank IS NULL THEN 1 ELSE 0 END ) AS NULL_BANK,
    SUM(CASE WHEN account_partern_id IS NULL THEN 1 ELSE 0 END) AS NULL_ACCOUNT_PARTERN_ID
FROM TRNX_17;

-- TRNX_18

SELECT 
    SUM(CASE WHEN trans_id IS NULL THEN 1 ELSE 0 END) AS NULL_TRANS_ID,
    SUM(CASE WHEN account_id IS NULL THEN 1 ELSE 0 END ) AS NULL_ACCOUNT_ID,
    SUM(CASE WHEN DATE IS NULL THEN 1 ELSE 0 END ) AS NULL_DATE,
    SUM(CASE WHEN TYPE IS NULL THEN 1 ELSE 0 END ) AS NULL_TYPE,
    SUM(CASE WHEN operation IS NULL THEN 1 ELSE 0 END ) AS NULL_OPERATION,
    SUM(CASE WHEN AMOUNT IS NULL THEN 1 ELSE 0 END) AS NULL_AMOUNT ,
    SUM(CASE WHEN balance IS NULL THEN 1 ELSE 0 END ) AS NULL_BALANCE,
    SUM(CASE WHEN Purpose IS NULL THEN 1 ELSE 0 END ) AS NULL_PURPOSE ,
    SUM(CASE WHEN bank IS NULL THEN 1 ELSE 0 END ) AS NULL_BANK,
    SUM(CASE WHEN account_partern_id IS NULL THEN 1 ELSE 0 END) AS NULL_ACCOUNT_PARTERN_ID
FROM TRNX_18;



-- TRNX_19

SELECT 
    SUM(CASE WHEN trans_id IS NULL THEN 1 ELSE 0 END) AS NULL_TRANS_ID,
    SUM(CASE WHEN account_id IS NULL THEN 1 ELSE 0 END ) AS NULL_ACCOUNT_ID,
    SUM(CASE WHEN DATE IS NULL THEN 1 ELSE 0 END ) AS NULL_DATE,
    SUM(CASE WHEN TYPE IS NULL THEN 1 ELSE 0 END ) AS NULL_TYPE,
    SUM(CASE WHEN operation IS NULL THEN 1 ELSE 0 END ) AS NULL_OPERATION,
    SUM(CASE WHEN AMOUNT IS NULL THEN 1 ELSE 0 END) AS NULL_AMOUNT ,
    SUM(CASE WHEN balance IS NULL THEN 1 ELSE 0 END ) AS NULL_BALANCE,
    SUM(CASE WHEN Purpose IS NULL THEN 1 ELSE 0 END ) AS NULL_PURPOSE ,
    SUM(CASE WHEN bank IS NULL THEN 1 ELSE 0 END ) AS NULL_BANK,
    SUM(CASE WHEN account_partern_id IS NULL THEN 1 ELSE 0 END) AS NULL_ACCOUNT_PARTERN_ID
FROM trnx_19_new;


-- TRNX_20

SELECT 
    SUM(CASE WHEN trans_id IS NULL THEN 1 ELSE 0 END) AS NULL_TRANS_ID,
    SUM(CASE WHEN account_id IS NULL THEN 1 ELSE 0 END ) AS NULL_ACCOUNT_ID,
    SUM(CASE WHEN DATE IS NULL THEN 1 ELSE 0 END ) AS NULL_DATE,
    SUM(CASE WHEN TYPE IS NULL THEN 1 ELSE 0 END ) AS NULL_TYPE,
    SUM(CASE WHEN operation IS NULL THEN 1 ELSE 0 END ) AS NULL_OPERATION,
    SUM(CASE WHEN AMOUNT IS NULL THEN 1 ELSE 0 END) AS NULL_AMOUNT ,
    SUM(CASE WHEN balance IS NULL THEN 1 ELSE 0 END ) AS NULL_BALANCE,
    SUM(CASE WHEN Purpose IS NULL THEN 1 ELSE 0 END ) AS NULL_PURPOSE ,
    SUM(CASE WHEN bank IS NULL THEN 1 ELSE 0 END ) AS NULL_BANK,
    SUM(CASE WHEN account_partern_id IS NULL THEN 1 ELSE 0 END) AS NULL_ACCOUNT_PARTERN_ID
FROM trnx_20_new;


-- TRNX_21

SELECT 
    SUM(CASE WHEN trans_id IS NULL THEN 1 ELSE 0 END) AS NULL_TRANS_ID,
    SUM(CASE WHEN account_id IS NULL THEN 1 ELSE 0 END ) AS NULL_ACCOUNT_ID,
    SUM(CASE WHEN DATE IS NULL THEN 1 ELSE 0 END ) AS NULL_DATE,
    SUM(CASE WHEN TYPE IS NULL THEN 1 ELSE 0 END ) AS NULL_TYPE,
    SUM(CASE WHEN operation IS NULL THEN 1 ELSE 0 END ) AS NULL_OPERATION,
    SUM(CASE WHEN AMOUNT IS NULL THEN 1 ELSE 0 END) AS NULL_AMOUNT ,
    SUM(CASE WHEN balance IS NULL THEN 1 ELSE 0 END ) AS NULL_BALANCE,
    SUM(CASE WHEN Purpose IS NULL THEN 1 ELSE 0 END ) AS NULL_PURPOSE ,
    SUM(CASE WHEN bank IS NULL THEN 1 ELSE 0 END ) AS NULL_BANK,
    SUM(CASE WHEN account_partern_id IS NULL THEN 1 ELSE 0 END) AS NULL_ACCOUNT_PARTERN_ID
FROM trnx_21_new;



-- Blank 
--account
select 
sum(case when ltrim(rtrim(frequency))='' then 1 else 0 end) as blank_frequency,
sum(case when ltrim(rtrim(Account_type))='' then 1 else 0 end) as blank_account_type
from account;

-- card 
select 
sum(case when ltrim(rtrim(type))='' then 1 else 0 end ) as blank_type,
sum(case when ltrim(rtrim(issued))='' then 1 else 0 end) as blank_issued
from card;

-- disp
select 
sum( case when ltrim(rtrim(type))='' then 1 else 0 end ) as blank_type
from disp

-- loan 
select 
sum(case when ltrim(rtrim(payments))='' then 1 else 0 end ) as blank_payments,
sum(case when ltrim(rtrim(status))='' then 1 else 0 end ) as blank_satus
from loan;

-- orders 
select 
sum(case when ltrim(rtrim(Bank_to))='' then 1 else 0 end) as blank_bank_to
from orders;

-- trans 

select 
sum(case when ltrim(rtrim(Type))='' then 1 else 0 end) as blank_type,
sum(case when ltrim(rtrim(operation))='' then 1 else 0 end) as blank_operation,
sum(case when ltrim(rtrim(Purpose))='' then 1 else 0 end) as blank_purpose,
sum(case when ltrim(rtrim(bank))='' then 1 else 0 end) as blank_bank,
sum(case when ltrim(rtrim(account_partern_id))='' then 1 else 0 end) as blank_account_partener_id
from trnx_16;

select 
sum(case when ltrim(rtrim(Type))='' then 1 else 0 end) as blank_type,
sum(case when ltrim(rtrim(operation))='' then 1 else 0 end) as blank_operation,
sum(case when ltrim(rtrim(Purpose))='' then 1 else 0 end) as blank_purpose,
sum(case when ltrim(rtrim(bank))='' then 1 else 0 end) as blank_bank,
sum(case when ltrim(rtrim(account_partern_id))='' then 1 else 0 end) as blank_account_partener_id
from trnx_17;

select 
sum(case when ltrim(rtrim(Type))='' then 1 else 0 end) as blank_type,
sum(case when ltrim(rtrim(operation))='' then 1 else 0 end) as blank_operation,
sum(case when ltrim(rtrim(Purpose))='' then 1 else 0 end) as blank_purpose,
sum(case when ltrim(rtrim(bank))='' then 1 else 0 end) as blank_bank,
sum(case when ltrim(rtrim(account_partern_id))='' then 1 else 0 end) as blank_account_partener_id
from trnx_18
;
select 
sum(case when ltrim(rtrim(Type))='' then 1 else 0 end) as blank_type,
sum(case when ltrim(rtrim(operation))='' then 1 else 0 end) as blank_operation,
sum(case when ltrim(rtrim(Purpose))='' then 1 else 0 end) as blank_purpose,
sum(case when ltrim(rtrim(bank))='' then 1 else 0 end) as blank_bank,
sum(case when ltrim(rtrim(account_partern_id))='' then 1 else 0 end) as blank_account_partener_id
from trnx_19_new;

select 
sum(case when ltrim(rtrim(Type))='' then 1 else 0 end) as blank_type,
sum(case when ltrim(rtrim(operation))='' then 1 else 0 end) as blank_operation,
sum(case when ltrim(rtrim(Purpose))='' then 1 else 0 end) as blank_purpose,
sum(case when ltrim(rtrim(bank))='' then 1 else 0 end) as blank_bank,
sum(case when ltrim(rtrim(account_partern_id))='' then 1 else 0 end) as blank_account_partener_id
from trnx_20_new;

select 
sum(case when ltrim(rtrim(Type))='' then 1 else 0 end) as blank_type,
sum(case when ltrim(rtrim(operation))='' then 1 else 0 end) as blank_operation,
sum(case when ltrim(rtrim(Purpose))='' then 1 else 0 end) as blank_purpose,
sum(case when ltrim(rtrim(bank))='' then 1 else 0 end) as blank_bank,
sum(case when ltrim(rtrim(account_partern_id))='' then 1 else 0 end) as blank_account_partener_id
from trnx_21_new;


select TABLE_NAME , COLUMN_NAME , DATA_TYPE from INFORMATION_SCHEMA.COLUMNS
ORDER BY TABLE_NAME;

-- categorical data check 

-- account
select distinct frequency  from account order by frequency ;
select distinct Account_type  from account order by Account_type;

-- card 
select distinct type from card ;

-- disp 
select distinct type from disp;

select * from disp as d
left join account as a
on d.account_id = a.account_id
where a.account_id is null ;

select * from disp as d
left join client as c
on d.client_id = c.client_id
where c.client_id is null ;

-- loan 
select distinct status from loan;

-- orders
select distinct bank_to from orders ; 

select * from orders as o
left join account as a
on o.account_id = a.account_id
where a.account_id is null ;

-- trans

select distinct type from trnx_16;
select distinct operation from trnx_16;
select distinct Purpose from trnx_16;
select  bank ,  count(*) as total_transactions from trnx_16 group by bank;

select distinct type from trnx_17;
select distinct operation from trnx_17;
select distinct Purpose from trnx_17;
select  bank ,  count(*) as total_transactions from trnx_17 group by bank;


select distinct type from trnx_18;
select distinct operation from trnx_18;
select distinct Purpose from trnx_18;
select  bank ,  count(*) as total_transactions from trnx_18 group by bank;


select distinct type from trnx_19_new;
select distinct operation from trnx_19_new;
select distinct Purpose from trnx_19_new;
select  bank ,  count(*) as total_transactions from trnx_19_new group by bank;

select distinct type from trnx_20_new;
select distinct operation from trnx_20_new;
select distinct Purpose from trnx_20_new;
select  bank ,  count(*) as total_transactions from trnx_20_new group by bank;

select distinct type from trnx_21_new;
select distinct operation from trnx_21_new;
select distinct Purpose from trnx_21_new;
select  bank ,  count(*) as total_transactions from trnx_21_new group by bank;


select * from trnx_16 as t
left join account as a
on t.account_id = a.account_id
where a.account_id is null ;

select * from trnx_17 as t
left join account as a
on t.account_id = a.account_id
where a.account_id is null ;

select * from trnx_18 as t
left join account as a
on t.account_id = a.account_id
where a.account_id is null ;

select * from trnx_19_new as t
left join account as a
on t.account_id = a.account_id
where a.account_id is null ;

select * from trnx_20_new as t
left join account as a
on t.account_id = a.account_id
where a.account_id is null ;

select * from trnx_21_new as t
left join account as a
on t.account_id = a.account_id
where a.account_id is null ;


