SET PAGESIZE 22
SET LINESIZE 50
TTITLE 'Account|Report'
BTITLE 'Confidential'
COL account_type HEADING 'Account|Category' FORMAT A15
COL c_id HEADING 'Customer|Number'
COL balance HEADING 'Balance' FORMAT $9,999,999
BREAK ON account_type SKIP 1
--SQL STATEMENT
SELECT account_type, c_id, balance
FROM account
WHERE balance < 1000000
ORDER BY account_type
/
SET PAGESIZE 24
SET LINESIZE 80
TTITLE OFF
BTITLE OFF
CLEAR COL
CLEAR BREAKS
