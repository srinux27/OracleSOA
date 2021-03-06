--JDBsoademo_create.sql
--rp 2014.07.09
SPOOL JDBsoademo_create.log

PROMPT create table 'BCA_SHIPTYPES'
CREATE TABLE BCA_SHIPTYPES
(
  SHIP_ID NUMERIC(10) NOT NULL,
  SHIP_TYPE VARCHAR(20) NOT NULL,
  SHIP_COMPANY VARCHAR(20) NOT NULL
, CONSTRAINT SHIPTYPE_PK PRIMARY KEY
  (
    SHIP_ID
  )
  
)
;

PROMPT create table 'BCA_EXTERNAL_STORE'
CREATE TABLE BCA_EXTERNAL_STORE
(
  PROD_ID VARCHAR(20) NOT NULL,
  QUANTITY NUMERIC(6)
, CONSTRAINT EXTERNAL_STORE_PK PRIMARY KEY
  (
    PROD_ID
  )
  
)
;

PROMPT create table 'BCA_ADDRESS'
CREATE TABLE BCA_ADDRESS
(
  ADDR_ID NUMERIC(6) NOT NULL,
  CUST_ID NUMERIC(6) NOT NULL,
  STREET VARCHAR(50),
  CITY VARCHAR(40),
  STATE VARCHAR(40),
  ZIP VARCHAR(20),
  COUNTRY VARCHAR(40)
, CONSTRAINT TABLE1_PK PRIMARY KEY
  (
    ADDR_ID
  )
  
)
;

PROMPT create table 'BCA_CREDITCARDS'
CREATE TABLE BCA_CREDITCARDS
(
  CARD_NUMBER VARCHAR(20) NOT NULL,
  CARD_TYPE VARCHAR(10) NOT NULL,
  CUST_ID NUMERIC(6) NOT NULL,
  CREDIT_LIMIT NUMERIC(9, 2) NOT NULL,
  STATUS VARCHAR(20) NOT NULL,
  RATING NUMERIC(2)
, CONSTRAINT CREDITCARDS_PK PRIMARY KEY
  (
    CARD_NUMBER
  )
  
)
;

PROMPT create table 'BCA_CUSTOMERS'
CREATE TABLE BCA_CUSTOMERS
(
  CUST_ID NUMERIC(6) NOT NULL,
  FIRST_NAME VARCHAR(40) NOT NULL,
  LAST_NAME VARCHAR(40) NOT NULL,
  EMAIL VARCHAR(40) NOT NULL,
  USERNAME VARCHAR(40) NOT NULL,
  PASSWRD VARCHAR(40) NOT NULL,
  STATUS VARCHAR(20) NOT NULL
, CONSTRAINT CUSTOMERS_PK PRIMARY KEY
  (
    CUST_ID
  )
  
)
;

PROMPT create table 'BCA_ITEMS'
CREATE TABLE BCA_ITEMS
(
  ITEM_ID NUMERIC(6) NOT NULL,
  ORD_ID NUMERIC(6) NOT NULL,
  PROD_ID VARCHAR(20) NOT NULL,
  PROD_NAME VARCHAR (20) NOT NULL,
  PRICE NUMERIC(9, 2) NOT NULL,
  QUANTITY NUMERIC(6)
, CONSTRAINT ITEMS_PK PRIMARY KEY
  (
    ITEM_ID,
    ORD_ID
  )
  
)
;

PROMPT create table 'BCA_PRODUCTS'
CREATE TABLE BCA_PRODUCTS
(
  PROD_ID VARCHAR(20) NOT NULL,
  PROD_NAME VARCHAR(50),
  RETAIL_PRICE NUMERIC(9, 2)
, CONSTRAINT PRODUCTS_PK PRIMARY KEY
  (
    PROD_ID
  )
  
)
;

PROMPT create table 'BCA_INTERNAL_STORE'
CREATE TABLE BCA_INTERNAL_STORE
(
  PROD_ID VARCHAR(20) NOT NULL,
  QUANTITY NUMERIC(6)
, CONSTRAINT INTERNAL_STORE_PK PRIMARY KEY
  (
    PROD_ID
  )
  
)
;

PROMPT create table 'BCA_INVENTORY'
CREATE TABLE BCA_INVENTORY
(
  PROD_ID VARCHAR(20) NOT NULL,
  QUANTITY NUMERIC(6)
, CONSTRAINT INVENTORY_PK PRIMARY KEY
  (
    PROD_ID
  )
  
)
;

PROMPT create table 'BCA_PRODID_XREFS'
CREATE TABLE BCA_PRODID_XREFS
(
  INT_ID VARCHAR(20) NOT NULL,
  EXT_ID VARCHAR(20) NOT NULL
, CONSTRAINT PRODID_XREFS_PK PRIMARY KEY
  (
    INT_ID
  )
  
)
;

PROMPT create table 'BCA_ONLINE_STORE'
CREATE TABLE BCA_ONLINE_STORE
(
  PROD_ID VARCHAR(20) NOT NULL,
  QUANTITY NUMERIC(6)
, CONSTRAINT ONLINE_STORE_PK1 PRIMARY KEY
  (
    PROD_ID
  )
  
)
;

PROMPT create table 'BCA_ORDERS'
CREATE TABLE BCA_ORDERS
(
  ORD_ID NUMERIC(6) NOT NULL,
  CUST_ID NUMERIC(6) NOT NULL,
  PAY_METHOD VARCHAR (20),
  SHIP_METHOD VARCHAR (20),
  CARRIER VARCHAR (20),
  CARD_TYPE VARCHAR (20),
  CARD_NUMBER VARCHAR (20),
  TOTAL_PRICE NUMERIC(9, 2) NOT NULL,
  DATE_ORDERED DATE NOT NULL,
  DATE_SHIPPED DATE,
  STATUS VARCHAR(20)
, CONSTRAINT ORDERS_PK PRIMARY KEY
  (
    ORD_ID
  )
  
)
;


PROMPT create unique key constraint on 'BCA_PRODID_XREFS'
ALTER TABLE BCA_PRODID_XREFS
ADD CONSTRAINT PRODID_XREFS_UK1 UNIQUE
(
  EXT_ID
)
 
;

PROMPT create foreign key constraint on 'BCA_ADDRESS'
ALTER TABLE BCA_ADDRESS
ADD CONSTRAINT ADDRESS_CUSTOMERS_FK1 FOREIGN KEY
(
  CUST_ID
)
REFERENCES BCA_CUSTOMERS
(
  CUST_ID
)
 
;

PROMPT create foreign key constraint on 'BCA_CREDITCARDS'
ALTER TABLE BCA_CREDITCARDS
ADD CONSTRAINT CREDITCARDS_CUSTOMERS_FK1 FOREIGN KEY
(
  CUST_ID
)
REFERENCES BCA_CUSTOMERS
(
  CUST_ID
)
 
;

PROMPT create foreign key constraint on 'BCA_ITEMS'
ALTER TABLE BCA_ITEMS
ADD CONSTRAINT ITEMS_ORDERS_FK FOREIGN KEY
(
  ORD_ID
)
REFERENCES BCA_ORDERS
(
  ORD_ID
)
 
;

PROMPT create foreign key constraint on 'BCA_ITEMS'
ALTER TABLE BCA_ITEMS
ADD CONSTRAINT ITEMS_PRODUCTS_FK FOREIGN KEY
(
  PROD_ID
)
REFERENCES BCA_PRODUCTS
(
  PROD_ID
)
 
;

PROMPT create foreign key constraint on 'BCA_ORDERS'
ALTER TABLE BCA_ORDERS
ADD CONSTRAINT ORDERS_CUSTOMERS_FK1 FOREIGN KEY
(
  CUST_ID
)
REFERENCES BCA_CUSTOMERS
(
  CUST_ID
)
 
;

PROMPT create check constraint on 'BCA_CUSTOMERS'
ALTER TABLE BCA_CUSTOMERS
ADD CONSTRAINT CUSTOMERS_STATUS_CHK1 CHECK
(STATUS IN ('bronze', 'silver', 'gold', 'platinum'))
 
;

PROMPT create sequence 'ITEM_SEQ'
CREATE SEQUENCE ITEM_SEQ INCREMENT BY 1 START WITH 100;

PROMPT create sequence 'ORDER_SEQ'
CREATE SEQUENCE ORDER_SEQ INCREMENT BY 1 START WITH 100;

PROMPT create sequence 'CUSTOMER_SEQ'
CREATE SEQUENCE CUSTOMER_SEQ INCREMENT BY 1 START WITH 1;

PROMPT create sequence 'ADDRESS_SEQ'
CREATE SEQUENCE ADDRESS_SEQ INCREMENT BY 1 START WITH 1;

SPOOL OFF
EXIT