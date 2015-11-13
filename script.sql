SET VERIFY OFF
SELECT loan_id, TO_CHAR(loan_amount, '$9,999,999')AS "Loan Amount",&&col_name AS "Column Name"
FROM loan
WHERE loan_amount BETWEEN &low_amount AND 
&hi_amount
ORDER BY &&col_name;
UNDEFINE col_name
