--JDBcreate_waitingorders.sql
--rp 2014.07.09

SPOOL JDBcreate_waitingorders.log

--order for customer 1
INSERT INTO BCA_ORDERS (ORD_ID, CUST_ID, PAY_METHOD, SHIP_METHOD, CARD_TYPE, CARD_NUMBER, TOTAL_PRICE, DATE_ORDERED, STATUS) VALUES (1001, 1, 'credit', 'two_day', 'ACARD', '5678-5678-5678-5678', 6500, CURRENT_DATE, 'waiting');
INSERT INTO BCA_ITEMS VALUES (1, 1001, 'SKU106', 'Signature Guitar', 3000, 2);
INSERT INTO BCA_ITEMS VALUES (2, 1001, 'SKU305', 'Music Player 120Gb', 250, 2);

--order for customer 2
INSERT INTO BCA_ORDERS (ORD_ID, CUST_ID, PAY_METHOD, SHIP_METHOD, CARD_TYPE, CARD_NUMBER, TOTAL_PRICE, DATE_ORDERED, STATUS) VALUES (1002, 2, 'credit', 'next_day', 'VCARD', '1234-1234-1234-1234', 4190, CURRENT_DATE, 'waiting');
INSERT INTO BCA_ITEMS VALUES (3, 1002, 'SKU106', 'Signature Guitar', 3000, 1);
INSERT INTO BCA_ITEMS VALUES (4, 1002, 'SKU200', 'Model 2000 Amp', 1100, 1);
INSERT INTO BCA_ITEMS VALUES (5, 1002, 'SKU301', 'Music Player 1Gb', 45, 2);

--order for customer 3
INSERT INTO BCA_ORDERS (ORD_ID, CUST_ID, PAY_METHOD, SHIP_METHOD, CARD_TYPE, CARD_NUMBER, TOTAL_PRICE, DATE_ORDERED, STATUS) VALUES (1003, 1, 'credit', 'five_day', 'ACARD', '5678-5678-5678-5678', 12000, CURRENT_DATE, 'waiting');
INSERT INTO BCA_ITEMS VALUES (6, 1003, 'SKU106', 'Signature Guitar', 3000, 4);

UPDATE BCA_INVENTORY SET QUANTITY=0 WHERE PROD_ID='SKU106';

COMMIT;
SPOOL OFF;
EXIT