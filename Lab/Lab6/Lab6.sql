rem 1
SELECT distinct maker
FROM product pr 
WHERE type='PC' AND NOT EXISTS (SELECT *  
                                FROM pc, product pr1
                                WHERE speed < 1200 AND 
                                pr1.model = pc.model 
                                AND pr.maker=pr1.maker);
 
rem 2
SELECT model,price
FROM printer
WHERE price >= ALL(SELECT price
                FROM printer);
rem 3
SELECT model,price 
FROM pc
WHERE price < ALL (SELECT price FROM laptop);
rem 3
SELECT maker 
FROM product p1
WHERE NOT EXISTS (SELECT p2.model 
                  FROM product p2, pc 
                  WHERE p2.model = pc.model 
                  AND p2.maker = p1.maker 
                  AND price > 2500 
                  UNION 
                  SELECT p2.model 
                  FROM product p2, laptop l 
                  WHERE p2.model = l.model 
                  AND p2.maker = p1.maker 
                  AND price > 2500  
                  UNION 
                  SELECT p2.model 
                  FROM product p2, printer pr
                  WHERE p2.model = pr.model 
                  AND p2.maker = p1.maker 
                  AND price > 2500 ) 
                  AND type = 'LAPTOP';

rem 5
SELECT *
FROM laptop
WHERE speed < ANY(SELECT speed
                FROM PC)
ORDER BY model;
rem 6
SELECT model
FROM laptop
WHERE price >= ALL (SELECT price
                    FROM pc 
                    UNION 
                    SELECT price
                    FROM laptop) 
UNION 
SELECT model
FROM pc 
WHERE price >= ALL (SELECT price
                    FROM pc
                    UNION
                    SELECT price 
                    FROM laptop); 
rem 7
SELECT maker
FROM printer pri, product pro2 
WHERE pro2.model = pri.model  
      AND  price <= ALL (SELECT price 
                        FROM printer);
rem 8
SELECT maker
FROM Product pr
WHERE NOT EXISTS (SELECT *  
                FROM Printer p,  product pro2
                WHERE p.model=pro2.model 
                AND color ='True'
                And pro2.maker=pr.maker) 
                AND type='PRINTER';


