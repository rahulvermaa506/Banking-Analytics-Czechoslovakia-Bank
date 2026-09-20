use alabs

-- loan Validation 

SELECT
    SUM(CASE WHEN amount <= 0 THEN 1 ELSE 0 END) AS Invalid_Amount,
    SUM(CASE WHEN duration <= 0 THEN 1 ELSE 0 END) AS Invalid_Duration,
    SUM(CASE WHEN payments <= 0 THEN 1 ELSE 0 END) AS Invalid_Payments
FROM loan;

-- ZERO 


-- Date Validation 

SELECT *
FROM account
WHERE date > GETDATE();

SELECT *
FROM loan
WHERE date > GETDATE();

SELECT *
FROM card
WHERE TRY_CAST(issued AS DATE) > CAST(GETDATE() AS DATE);


SELECT *
FROM trnx_16
WHERE Date > CAST(GETDATE() AS DATE);

SELECT *
FROM trnx_17
WHERE Date > CAST(GETDATE() AS DATE);

SELECT *
FROM trnx_18
WHERE Date > CAST(GETDATE() AS DATE);

SELECT *
FROM trnx_19_new
WHERE Date > CAST(GETDATE() AS DATE);

SELECT *
FROM trnx_20_new
WHERE Date > CAST(GETDATE() AS DATE);

SELECT *
FROM trnx_21_new
WHERE Date > CAST(GETDATE() AS DATE);


-- ID CROSS CHECK 

SELECT l.*
FROM loan AS l
LEFT JOIN account AS a
    ON l.account_id = a.account_id
WHERE a.account_id IS NULL;

SELECT d.*
FROM disp AS d
LEFT JOIN client AS c
    ON d.client_id = c.client_id
WHERE c.client_id IS NULL;

SELECT d.*
FROM disp AS d
LEFT JOIN account AS a
    ON d.account_id = a.account_id
WHERE a.account_id IS NULL;


SELECT c.*
FROM card AS c
LEFT JOIN disp AS d
    ON c.disp_id = d.disp_id
WHERE d.disp_id IS NULL;

SELECT o.*
FROM orders AS o
LEFT JOIN account AS a
    ON TRY_CAST(o.account_id AS SMALLINT) = a.account_id
WHERE a.account_id IS NULL;

SELECT t.*
FROM trnx_16 AS t
LEFT JOIN account AS a
    ON t.account_id = a.account_id
WHERE a.account_id IS NULL;

SELECT t.*
FROM trnx_17 AS t
LEFT JOIN account AS a
    ON t.account_id = a.account_id
WHERE a.account_id IS NULL;

SELECT t.*
FROM trnx_18 AS t
LEFT JOIN account AS a
    ON t.account_id = a.account_id
WHERE a.account_id IS NULL;


SELECT t.*
FROM trnx_19_new AS t
LEFT JOIN account AS a
    ON t.account_id = a.account_id
WHERE a.account_id IS NULL;

SELECT t.*
FROM trnx_20_new AS t
LEFT JOIN account AS a
    ON t.account_id = a.account_id
WHERE a.account_id IS NULL;

SELECT t.*
FROM trnx_21_new AS t
LEFT JOIN account AS a
    ON t.account_id = a.account_id
WHERE a.account_id IS NULL;

-- LOAN STATUS 

SELECT *
FROM loan
WHERE status NOT IN ('A','B','C','D');

SELECT
    status,
    COUNT(*) AS Loan_Count
FROM loan
GROUP BY status
ORDER BY status;

-- LOAN ACCOUNT OWNER 

SELECT 
    l.loan_id,
    l.account_id
FROM loan l
WHERE NOT EXISTS (
    SELECT d.account_id
    FROM disp d
    WHERE d.account_id = l.account_id
      AND d.type = 'OWNER'
);

-- Transaction Type and Operation 

SELECT type ,operation , COUNT(*) AS TRANSACTION_COUNT
FROM trnx_16
GROUP BY type , operation
ORDER BY type , operation

SELECT type ,operation , COUNT(*) AS TRANSACTION_COUNT
FROM trnx_17
GROUP BY type , operation
ORDER BY type , operation

SELECT type ,operation , COUNT(*) AS TRANSACTION_COUNT
FROM trnx_18
GROUP BY type , operation
ORDER BY type , operation

SELECT type ,operation , COUNT(*) AS TRANSACTION_COUNT
FROM trnx_19_new
GROUP BY type , operation
ORDER BY type , operation

SELECT type ,operation , COUNT(*) AS TRANSACTION_COUNT
FROM trnx_20_new
GROUP BY type , operation
ORDER BY type , operation

SELECT type ,operation , COUNT(*) AS TRANSACTION_COUNT
FROM trnx_21_new
GROUP BY type , operation
ORDER BY type , operation


--INVALID TRANSACTION CHECK 

SELECT 
    SUM(CASE WHEN TRY_CAST(amount AS DECIMAL(18,2)) < 0 THEN 1 ELSE 0 END) AS Invalid_Amount,
    SUM(CASE WHEN TRY_CAST(balance AS DECIMAL(18,2)) IS NULL THEN 1 ELSE 0 END) AS Invalid_Balance
FROM trnx_16;

SELECT 
    SUM(CASE WHEN TRY_CAST(amount AS DECIMAL(18,2)) < 0 THEN 1 ELSE 0 END) AS Invalid_Amount,
    SUM(CASE WHEN TRY_CAST(balance AS DECIMAL(18,2)) IS NULL THEN 1 ELSE 0 END) AS Invalid_Balance
FROM trnx_17;

SELECT 
    SUM(CASE WHEN TRY_CAST(amount AS DECIMAL(18,2)) < 0 THEN 1 ELSE 0 END) AS Invalid_Amount,
    SUM(CASE WHEN TRY_CAST(balance AS DECIMAL(18,2)) IS NULL THEN 1 ELSE 0 END) AS Invalid_Balance
FROM trnx_18;

SELECT 
    SUM(CASE WHEN TRY_CAST(amount AS DECIMAL(18,2)) < 0 THEN 1 ELSE 0 END) AS Invalid_Amount,
    SUM(CASE WHEN TRY_CAST(balance AS DECIMAL(18,2)) IS NULL THEN 1 ELSE 0 END) AS Invalid_Balance
FROM trnx_19_new;

SELECT 
    SUM(CASE WHEN TRY_CAST(amount AS DECIMAL(18,2)) <0 THEN 1 ELSE 0 END) AS Invalid_Amount,
    SUM(CASE WHEN TRY_CAST(balance AS DECIMAL(18,2)) IS NULL THEN 1 ELSE 0 END) AS Invalid_Balance
FROM trnx_20_new;

SELECT 
    SUM(CASE WHEN TRY_CAST(amount AS DECIMAL(18,2)) < 0 THEN 1 ELSE 0 END) AS Invalid_Amount,
    SUM(CASE WHEN TRY_CAST(balance AS DECIMAL(18,2)) IS NULL THEN 1 ELSE 0 END) AS Invalid_Balance
FROM trnx_21_new;


