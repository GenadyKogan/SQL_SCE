ALTER SESSION SET nls_date_format='dd/mm/yyyy';
rem 1
SELECT ordid, orderdate
FROM ord
WHERE custid = (SElECT custid
                    FROM customer
                    WHERE name = 'vollyrite');
rem 2
SELECT name FROM customer WHERE customer.custid in
	(SELECT custid FROM ord WHERE ord.ordid in
		(SELECT ordid FROM item WHERE item.prodid =
			(SELECT prodid FROM product WHERE product.descrip = 'ACE TENNIS NET')));
rem 3
UPDATE item SET actualprice=actualprice+100 WHERE prodid = 100890 AND
ordid IN (SELECT ordID FROM ord WHERE orderdate = '07/01/1987' AND custid =101);
rem 4
SELECT c.name, c.address
FROM customer c,(SELECT custid
                    FROM ord
                    WHERE shipdate='11/FEB/1987')cus
WHERE cus.custid = c.custid 
ORDER by c.name;
rem extra (using script from lab 2 for product)
/*SELECT DISTINCT MAKER
FROM PRODUCT, (SELECT speed,model
                                        FROM pc
                                        WHERE pc.speed>=1200) C
WHERE product.model=c.model;*/
