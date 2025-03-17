use [Bank Loan];

select *
from [dbo].[loan_tables];

-- KPI'S


-- TOTAL LOAN APPLICATION
select count(id) as Total_Application
from [dbo].[loan_tables];

-- 

-- Month-To-Date (MTD) LOAN APPLICATION
select count(id) as Total_Application
from [dbo].[loan_tables]
where month(issue_date) = 12;

-- PMTD LOAN APPLICATION
SELECT COUNT(id) AS Total_Applications FROM [dbo].[loan_tables]
WHERE MONTH(issue_date) = 11;


-- TOTAL FUNDED AMOUNT
SELECT SUM(loan_amount) 
AS Total_Funded_Amount FROM [dbo].[loan_tables];

-- Month-To-Date TOTAL FUNDED AMOUNT
SELECT SUM(loan_amount) 
AS Total_Funded_Amount 
FROM [dbo].[loan_tables]
WHERE MONTH(issue_date) = 12;

-- MTD TOTAL FUNDED AMOUNT
SELECT SUM(loan_amount)
AS Total_Funded_Amount 
FROM [dbo].[loan_tables]
WHERE MONTH(issue_date) = 12


-- PMTD TOTAL FUNDED AMOUNT
SELECT SUM(loan_amount) 
AS Total_Funded_Amount 
FROM [dbo].[loan_tables]
WHERE MONTH(issue_date) = 11;

-- TOTAL AMOUNT RECEIVED
select sum(total_payment) as Total_Amount_Collected 
from dbo.loan_tables;

-- MTD TOTAL AMOUNT RECEIVED
SELECT SUM(total_payment) 
AS Total_Amount_Collected 
FROM [dbo].[loan_tables]
WHERE MONTH(issue_date) = 12;

-- PMTD TOTAL AMOUNT RECEIVED
SELECT SUM(total_payment) 
AS Total_Amount_Collected 
FROM [dbo].[loan_tables]
WHERE MONTH(issue_date) = 11;

-- AVERAGE INTEREST RATE 
select avg (int_rate)*100 as Avf_Int_Rate
from [dbo].[loan_tables];

-- MTD AVERAGE INTEREST RATE
SELECT AVG(int_rate)*100
AS MTD_Avg_Int_Rate
FROM [dbo].[loan_tables]
WHERE MONTH(issue_date) = 12;

-- PMTD AVERAGE INTEREST RATE
SELECT AVG(int_rate)*100 
AS PMTD_Avg_Int_Rate 
FROM [dbo].[loan_tables]
WHERE MONTH(issue_date) = 11;

-- AVERAGE DTI
SELECT AVG(dti)*100 
AS Avg_DTI
FROM [dbo].[loan_tables];

-- MTD AVERAGE DTI
SELECT AVG(dti)*100 
AS MTD_Avg_DTI 
FROM [dbo].[loan_tables]
WHERE MONTH(issue_date) = 12;

-- PMTD AVERAGE DTI
SELECT AVG(dti)*100 
AS PMTD_Avg_DTI 
FROM [dbo].[loan_tables]
WHERE MONTH(issue_date) = 11;


-- GOOD LOAN ISSUED

-- GOOD LOAN PERCENTAGE
SELECT
    (COUNT(CASE WHEN loan_status = 'Fully Paid' OR loan_status = 'Current' THEN id END) * 100.0) / 
	COUNT(id) AS Good_Loan_Percentage
FROM [dbo].[loan_tables];

-- GOOD LOAN APPLICATION
SELECT COUNT(id) AS Good_Loan_Applications 
FROM [dbo].[loan_tables]
WHERE loan_status = 'Fully Paid' OR loan_status = 'Current';

-- GOOD LOAN FUNDED AMOUNT
SELECT SUM(loan_amount) AS Good_Loan_Funded_amount FROM [dbo].[loan_tables]
WHERE loan_status = 'Fully Paid' OR loan_status = 'Current';

-- GOOD LOAN AMOUNT RECEIVED
SELECT SUM(total_payment) AS Good_Loan_amount_received FROM [dbo].[loan_tables]
WHERE loan_status = 'Fully Paid' OR loan_status = 'Current';


-- BAD LOAN ISSUED

-- BAD LOAN PERCENTAGE
SELECT
    (COUNT(CASE WHEN loan_status = 'Charged Off' THEN id END) * 100.0) / 
	COUNT(id) AS Bad_Loan_Percentage
FROM [dbo].[loan_tables];

-- BAD LOAN APPLICATION
SELECT COUNT(id) AS Bad_Loan_Applications FROM [dbo].[loan_tables]
WHERE loan_status = 'Charged Off';

-- BAD LOAN FUNDED AMOUNT
SELECT SUM(loan_amount) AS Bad_Loan_Funded_amount FROM [dbo].[loan_tables]
WHERE loan_status = 'Charged Off';

-- BAD LOAN AMOUNT RECEIVED
SELECT SUM(total_payment) AS Bad_Loan_amount_received FROM [dbo].[loan_tables]
WHERE loan_status = 'Charged Off';


-- LOAN STATUS
SELECT
        loan_status,
        COUNT(id) AS LoanCount,
        SUM(total_payment) AS Total_Amount_Received,
        SUM(loan_amount) AS Total_Funded_Amount,
        AVG(int_rate * 100) AS Interest_Rate,
        AVG(dti * 100) AS DTI
    FROM
        [dbo].[loan_tables]
    GROUP BY
        loan_status;


SELECT 
	loan_status, 
	SUM(total_payment) AS MTD_Total_Amount_Received, 
	SUM(loan_amount) AS MTD_Total_Funded_Amount 
FROM [dbo].[loan_tables]
WHERE MONTH(issue_date) = 12 
GROUP BY loan_status;


-- BANK LOAN REPORT/MONTH
SELECT 
	MONTH(issue_date) AS Month_Munber, 
	DATENAME(MONTH, issue_date) AS Month_name, 
	COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Amount_Received
FROM [dbo].[loan_tables]
GROUP BY MONTH(issue_date), DATENAME(MONTH, issue_date)
ORDER BY MONTH(issue_date);


-- BANK LOAN REPORT/STATE
SELECT 
	address_state AS State, 
	COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Amount_Received
FROM [dbo].[loan_tables]
GROUP BY address_state
ORDER BY address_state;


-- BANK LOAN REPORT/TERM
SELECT 
	term AS Term, 
	COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Amount_Received
FROM [dbo].[loan_tables]
GROUP BY term
ORDER BY term;


-- EMPLOYEE LENGTH
SELECT 
	emp_length AS Employee_Length, 
	COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Amount_Received
FROM [dbo].[loan_tables]
GROUP BY emp_length
ORDER BY emp_length;


-- PURPOSE
SELECT 
	purpose AS PURPOSE, 
	COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Amount_Received
FROM [dbo].[loan_tables]
GROUP BY purpose
ORDER BY purpose;


-- HOME OWNERSHIP
SELECT 
	home_ownership AS Home_Ownership, 
	COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Amount_Received
FROM [dbo].[loan_tables]
GROUP BY home_ownership
ORDER BY home_ownership;





















