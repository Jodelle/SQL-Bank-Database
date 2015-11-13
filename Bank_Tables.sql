-- script to create BANK database
--10g VERSION

DROP TABLE account CASCADE CONSTRAINTS;
DROP TABLE loan CASCADE CONSTRAINTS;
DROP TABLE customer CASCADE CONSTRAINTS;
DROP TABLE branch CASCADE CONSTRAINTS;
DROP TABLE bank CASCADE CONSTRAINTS;

CREATE TABLE bank
(
   bank_id NUMBER(6),
   bank_name VARCHAR2(30) NOT NULL,
   email VARCHAR2(25),
   CONSTRAINT bank_bank_id_pk PRIMARY KEY (bank_id)
);

CREATE TABLE branch
(
    branch_id NUMBER(6),
    branch_name VARCHAR2(30),
    bank_id NUMBER(6),
    address VARCHAR2(32),
    city VARCHAR2(32),
    state CHAR(2),
    phone_number VARCHAR2 (20),
    CONSTRAINT branch_branch_id_pk PRIMARY KEY (branch_id),
    CONSTRAINT branch_bank_id_fk FOREIGN KEY (bank_id) REFERENCES bank(bank_id)
);

CREATE TABLE customer
(
   c_id NUMBER(6),
   c_last VARCHAR2(30) NOT NULL,
   c_first VARCHAR2(30),
   bank_id NUMBER(5),
   c_address VARCHAR2(32),
   c_city VARCHAR2(20),
   c_state CHAR(2),
   c_zip VARCHAR2(10),
   c_phone VARCHAR2(20),
   c_dob DATE,
   c_email VARCHAR2(25),
   CONSTRAINT customer_c_id_pk PRIMARY KEY (c_id),
   CONSTRAINT customer_bank_id_fk FOREIGN KEY (bank_id) REFERENCES bank(bank_id)
);

CREATE TABLE loan
(
   loan_id NUMBER(6),
   loan_amount DECIMAL(19,4),
   branch_id NUMBER(6),
   c_id NUMBER(6),
   No_payment NUMBER(3,0),
   loan_type VARCHAR(30),
   interest_rate DECIMAL(5,2),
   CONSTRAINT loan_loan_id_pk PRIMARY KEY (loan_id),
   CONSTRAINT loan_branch_id_fk FOREIGN KEY (branch_id) REFERENCES branch(branch_id),
   CONSTRAINT loan_c_id_fk FOREIGN KEY (c_id) REFERENCES customer(c_id)
);


CREATE TABLE account
(
   account_id NUMBER(6),
   account_type VARCHAR2(20),
   c_id NUMBER (6),
   balance NUMBER(9,2),
   CONSTRAINT account_account_id_pk PRIMARY KEY (account_id),
   CONSTRAINT account_account_type_cc CHECK  ((account_type = 'CHECKING') OR (account_type = 'SAVING')),
   CONSTRAINT account_c_id_fk FOREIGN KEY (c_id) REFERENCES customer(c_id)
);


---- inserting into BANK table
INSERT INTO bank VALUES
(1, 'Bank Of America', 'online@bankofamerica.com');

INSERT INTO bank VALUES
(2, 'Chase', 'online@chase.com');

INSERT INTO bank VALUES
(3, 'Wells Fargo', 'online@wellsfargo.com');

INSERT INTO bank VALUES
(4, 'Sun Trust', 'online@suntrust.com');

INSERT INTO bank VALUES
(5, 'Bank Of Atlanta', 'online@bankofatlanta');

INSERT INTO bank VALUES
(6, 'Capital One', 'online@capitalone');

INSERT INTO bank VALUES
(7, 'Citizens Trust Bank', 'online@ctb.com');

INSERT INTO bank VALUES
(8, 'Fidelity Bank', 'online@lionbank.com');

INSERT INTO bank VALUES
(9, 'Bank Of Hawaii', 'online@bankofhawaii.com');

INSERT INTO bank VALUES
(10, 'PNC Bank', 'online@pncbank.com');


---- inserting into BRANCH table
INSERT INTO branch VALUES
(1,'Buford Main', 1, '1500 Buford Hwy', 'Burford', 'GA','770-945-9536');

INSERT INTO branch VALUES
(2, 'Branch', 1, '615 West Pike St', 'Lawrenceville', 'GA', '770-995-3150');

INSERT INTO branch VALUES
(3, 'Lenox Gardens', 1, 'W 117th St', 'New York', 'NY', '212-662-0102');

INSERT INTO branch VALUES
(4,'Muse', 2, '51 Broad St Nw', 'Atlanta', 'GA', '');

INSERT INTO branch VALUES
(5, 'Branch', 4, '1665 Alton Road', 'Miami', 'FL', '305-674-5200');

INSERT INTO branch VALUES
(6,'Pleasant Hill', 1, '2608 Pleasant Hill Rd', 'Duluth', 'GA','678-323-0222');

INSERT INTO branch VALUES
(7, 'Wells Fargo', 3, '1250 Poydras St', 'New Orleans', 'LA', '504-581-1404');

INSERT INTO branch VALUES
(8, 'PNC Bank', 10, '291 Gwinnett Dr', 'Lawrenceville', 'GA', '404-495-6180');

INSERT INTO branch VALUES
(9, 'PNC Bank Branch', 10, '3199 S Crater Rd', 'Petersburgh', 'VA', '800-627-3999');

INSERT INTO branch VALUES
(10, 'Marketplace Branch', 9, '270 Dairy Rd', 'Kahului', 'HI', '504-581-1404');

INSERT INTO branch VALUES
(11, 'First Fidelity', 8, 'N Greenway Hayden Loop', ' Scottsdale', 'AZ', '800-627-3999');


---- inserting into CUSTOMER table
INSERT INTO customer VALUES
(101, 'Smith', 'Sean', 1, '2560 Pinto Dr', 'Duluth', 'GA', '30093', '404-901-4222',TO_DATE('03-JAN-1990', 'dd-MON-yyyy'), 'ssmith@aol.com');

INSERT INTO customer VALUES
(102, 'Alsina', 'August', 3, '435 Ford St', 'New Orleans', 'LA', '70112', '504-221-5123',TO_DATE('12-MAY-1989', 'dd-MON-yyyy'), 'aalsina@hotmail.com');

INSERT INTO customer VALUES
(103, 'Christopher', 'Brown', 9, '102 Peter St', 'Petersburgh', 'VA', '23805', '804-256-2015',TO_DATE('22-MAY-1987', 'dd-MON-yyyy'), 'cbrowm@hotmail.com');

INSERT INTO customer VALUES
(104, 'Smith', 'Sean', 10, '2560 Steve Reynold Blvd', 'Duluth', 'GA', '30093', '770-901-1472',TO_DATE('03-JAN-1990', 'dd-MON-yyyy'), 'ssmith@gmail.com');

INSERT INTO customer VALUES
(105, 'Sanchez', 'Robert', 10, '322 Honolulu St', 'Kahului', 'HI', '96732', '808-901-2105',TO_DATE('16-DEC-1879', 'dd-MON-yyyy'), 'srobert@yahoo.fr');

INSERT INTO customer VALUES
(106, 'Bayla', 'Amy', 4, '400 Rickenbacker Causeway', 'Miami', 'FL', '33102', '305-022-3061',TO_DATE('27-FEB-1976', 'dd-MON-yyyy'), 'bamy@yahoo.fr');

INSERT INTO customer VALUES
(107, 'King', 'Matthew', 1, '1523 Silver St', 'Duluth', 'GA', '30093', '770-901-4222',TO_DATE('10-MAY-1969', 'dd-MON-yyyy'), 'mking@gmail.com');

INSERT INTO customer VALUES
(108, 'Sylvain', 'Jacky', 9, '335 Dairy Rd', 'Kahului', 'HI',  '96732', '504-185-1404',TO_DATE('24-SEP-1995', 'dd-MON-yyyy'), 'jsylvain@aol.com');

INSERT INTO customer VALUES
(109, 'Vick', 'Michael', 2, ' 65 Valley Road', 'Atlanta', 'GA',  '30342', '404-221-6241',TO_DATE('05-JUN-1994', 'dd-MON-yyyy'), 'mvick@gmail.com');

INSERT INTO customer VALUES
(110, 'Miller', 'Amanda', 8, 'N. 32nd Street', 'Scottsdale',  'AZ', '85251','602-912-5500',TO_DATE('11-JUL-1988', 'dd-MON-yyyy'), 'amiller@yahoo.fr');



---- inserting into LOAN table
INSERT INTO loan VALUES
(10, 5000, 1, 102, 12, 'Auto', 0.5);

INSERT INTO loan VALUES
(20, 200000, 3, 103, 40, 'Mortgage', 2.5);

INSERT INTO loan VALUES
(30, 2005000, 8, 105, 123, 'Investment', 12.5);

INSERT INTO loan VALUES
(40, 2300, 4, 109, 6, 'Auto', 1.07);

INSERT INTO loan VALUES
(50, 16253000, 9, 104, 123, 'Mortgage', 3.12);

INSERT INTO loan VALUES
(60, 50000, 10, 103, 30, 'Mortgage', 8.20);

INSERT INTO loan VALUES
(70, 251000, 8, 105, 21, 'Auto', 5.11);

INSERT INTO loan VALUES
(80, 80000, 1, 102, 22, 'Mortgage', 6.01);

INSERT INTO loan VALUES
(90, 23500000, 6, 101, 105, 'Investment', 12.25);

INSERT INTO loan VALUES
(100, 200000, 3, 107, 200, 'Student', 9.10);


---- inserting into ACCOUNT table
INSERT INTO account VALUES
(1, 'CHECKING', 101, 1000);

INSERT INTO account VALUES
(2, 'CHECKING', 102, 4500);

INSERT INTO account VALUES
(3, 'SAVING', 101, 300);

INSERT INTO account VALUES
(4, 'CHECKING', 107, 5000);

INSERT INTO account VALUES
(5, 'CHECKING', 104, 50000);

INSERT INTO account VALUES
(6, 'SAVING', 104, 6300);

INSERT INTO account VALUES
(7, 'CHECKING', 105, 900000);

INSERT INTO account VALUES
(8, 'CHECKING', 110, 125500);

INSERT INTO account VALUES
(9, 'SAVING', 108, 5200);

INSERT INTO account VALUES
(10, 'SAVING', 105, 5626000);


