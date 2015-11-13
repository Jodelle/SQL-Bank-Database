--sql queries for the BANK Database

--Q1 displays unique customer id with a checking OR saving account
SELECT DISTINCT c_id AS "Customer's Identification"
FROM account
WHERE account_type = 'CHECKING' OR account_type = 'SAVING'
ORDER BY 1;

--Q2 using the decode function, this query displays the classification of all customer's based on the value of the column loan_type
SELECT loan_type, decode (loan_type,  'Student', 'D',
'Auto',  'C',            
'Mortgage',    'B',                       
'Investment',   'A',                                              
'0')CLASSIFICATION
FROM loan
ORDER BY 1;

--Q3 counts all the  unique primary keys in the customer's table
SELECT COUNT (DISTINCT c_id) AS "Number"
FROM customer;

--Q4 Joins the bank id table  branch's address
SELECT b.bank_id AS "The Bank", br.address AS "Address"
FROM bank b JOIN branch br
ON (b.bank_id = br.bank_id)
ORDER BY 2;

--Q5 Find the highest loan amount using a single value subquery
SELECT loan_id,loan_type AS "TYPE"
FROM loan
WHERE loan_amount = (SELECT MAX(loan_amount)
                     FROM loan);
                     
--Q6 SELECT all customers' id, last name and first name NOT living in the state of Georgia(GA)
SELECT c_id, c_last, c_first
FROM customer
MINUS
SELECT c_id, c_last, c_first
FROM customer
WHERE c_state = 'GA';

--Q7 Display each customer’s last name, date of birth, and loan review date, which is the first Friday after six months of requesting a loan. 
SELECT c_first || ', '|| c_last AS "Full Name", c_dob AS "Birth Date",
TO_CHAR(NEXT_DAY(ADD_MONTHS(c_dob, 6),'FRIDAY'),'fmDay, "the" Ddspth "of" Month, YYYY')AS "REVIEW CUSTOMER TRANSACTIONS"
FROM customer
WHERE c_dob <= '01-JAN-00'
ORDER BY c_dob;

--Q8 displays customer's balance from the account table
SELECT TO_CHAR(balance, '$9,999,999') AS "Customer's Balance"
FROM account;

--Q9 Displays the full name of all customers with an account.Do not repeat any name
--except for sean smith both have different id's but same name
SELECT c_first || ', '|| c_last AS "Full Name"
FROM customer
WHERE c_id IN
            (SELECT DISTINCT c_id
            FROM account WHERE account_id IS NOT NULL);
            
--Q10 Display the id, last and first name of all customers in the customer table.  Include those accounts even if they do not have a matching customer'sid.
SELECT c.c_last AS "Last Name", c.c_first AS "First Name", a.c_id AS "Customer's Identification"
FROM CUSTOMER c LEFT OUTER JOIN ACCOUNT a
ON c.c_id = a.c_id
ORDER BY 3;

