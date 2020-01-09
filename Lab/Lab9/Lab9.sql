rem ==============================================
rem example 1
CREATE TABLE T1( 
    e INTEGER,   
    f INTEGER ); 
 
INSERT INTO T1 VALUES(1, 3);
INSERT INTO T1 VALUES(2, 4); 

/* Above is plain SQL; below is the PL/SQL program. */ 

DECLARE   
    a NUMBER;  
    b NUMBER; 
BEGIN    
SELECT e,f INTO a,b FROM T1 WHERE e>1;  
INSERT INTO T1 VALUES(b,a); 
END; 
/ 
rem ==============================================
rem example 2

DROP TABLE my_debug;
CREATE TABLE my_debug (
date_created DATE, 
text VARCHAR2(500)
);

DECLARE 
    l_x NUMBER := 0; 
BEGIN 
    INSERT INTO my_debug VALUES (SYSDATE,'Before='||TO_CHAR(l_x));
    l_x := l_x + 10; 
    INSERT INTO my_debug VALUES (SYSDATE,'After='||TO_CHAR(l_x)); 
END; 
/
SELECT text
FROM my_debug 
ORDER BY date_created;
rem ==============================================
rem example 3 

VARIABLE result NUMBER 
DECLARE 
    l_x NUMBER := 0;
BEGIN 
    l_x := l_x + 10;
    :result := l_x;
END;
/
print result 
rem ==============================================
rem example 4
rem DBMS_OUTPUT
SET serverout ON;
DECLARE  
    X NUMBER; 
BEGIN
    X:=10;         
    DBMS_OUTPUT.put_line('Hello World');      
    DBMS_OUTPUT.NEW_LINE;     
    DBMS_OUTPUT.PUT_LINE('ERROR ' || x); 
END;
/
rem example 5

BEGIN  
    DELETE  FROM t1          
    WHERE e>50;         
    DBMS_OUTPUT.put_line(TO_CHAR(SQL%ROWCOUNT)|| ' rows deleted'); 
END;
/

rem example 6
DECLARE 
    i integer; 
    j integer; 
    BEGIN 
    i:=2; 
    DBMS_OUTPUT.PUT_LINE('This is a message and the value of i is ' || i); 
    DBMS_OUTPUT.PUT_LINE('If we want to input, we put ampersand before the variable');
    j:=&Z; 
    DBMS_OUTPUT.PUT_LINE('The value of j is '|| j); 
END;
/
rem ==============================================
rem example 7
rem condition statement
DECLARE 
    a NUMBER;     
    b NUMBER; 
BEGIN     
    SELECT e,f INTO a,b FROM T1 WHERE e>1;
    IF b=1 THEN 
    INSERT INTO T1 VALUES(b,a);     
    ELSE         
    INSERT INTO T1 VALUES(b+10,a+10);     
    END IF;
END;
/

rem example 8
rem SQL%ROWCOUNT
BEGIN   
    DELETE  FROM  t1       
    WHERE  e>50;         
    IF(SQL%ROWCOUNT>0) then            
    DBMS_OUTPUT.put_line(TO_CHAR(SQL%ROWCOUNT)|| ' rows deleted');         
    ELSE 
    DBMS_OUTPUT.put_line('no data to change');         
    END IF; 
END; 
/
rem example 9
rem SQL%FOUND ---> true is at least one row was processed by the sql statement, otherwise false
BEGIN
    DELETE  FROM  t1           
    WHERE  e>50;         
    IF (SQL%FOUND)  THEN               
    DBMS_OUTPUT.put_line(TO_CHAR(SQL%ROWCOUNT)|| ' rows deleted');          
    ELSE  
    DBMS_OUTPUT.put_line('no data to change');          
    END IF;
END;
/
rem ==============================================
rem example 10
rem loop
DECLARE    
    i NUMBER := 1;
BEGIN    
    LOOP         
    INSERT INTO T1 VALUES(i,i);         
    i := i+1;         
    EXIT WHEN i>100;     
    END LOOP; 
END;
/
rem example 11
rem while 
DECLARE
    l_x NUMBER := 10; 
    BEGIN
    While (l_x <100) 
    LOOP  
    DBMS_OUTPUT.put_line(l_x ); 
    l_x := l_x + 10; 
    END LOOP; 
END; 
/
rem example 12
rem for
BEGIN  
    FOR counter IN 1 .. 10 
    LOOP 
    DBMS_OUTPUT.put_line(counter);      
    END LOOP; 
END;
/
rem ==============================================
rem example 13
rem cursor
DECLARE  
    CURSOR c1 IS SELECT * FROM emp;  
    e_rec emp%rowtype;  
BEGIN       
    OPEN c1;
    LOOP            
    FETCH c1 INTO e_rec;  
    EXIT WHEN c1%NOTFOUND;           
    DBMS_OUTPUT.PUT_LINE('Number: ' || ' ' || e_rec.empno);            
    DBMS_OUTPUT.PUT_LINE('Name : ' || ' ' || e_rec.ename);            
    DBMS_OUTPUT.PUT_LINE('Salary: ' || ' ' || e_rec.sal);                  
    END LOOP;  
    CLOSE c1;  
END;
/
rem ==============================================
rem task1 blocks
BEGIN
    UPDATE emp
    SET SAL = SAL*1.15
    WHERE deptno =10;
    DBMS_OUTPUT.put_line(TO_CHAR(SQL%ROWCOUNT)||' employee(s) updated');
END;
/
rem task2 blocks

DECLARE
	l_old_job emp.job%TYPE := '&1';
	l_new_job emp.job%TYPE := '&2';
BEGIN
	UPDATE emp
	SET job = l_new_job
	WHERE job = l_old_job;
	IF SQL%FOUND THEN
		DBMS_OUTPUT.put_line(TO_CHAR(SQL%ROWCOUNT)||
	' employee(s) changed job');
	ELSE
		DBMS_OUTPUT.put_line('No employee found with job'||
		' of '||l_old_job);
	END IF;
END;
/
rem task1 cursor
DECLARE
	CURSOR dept_cur
	IS
	SELECT deptno
	, dname
	, loc
	FROM dept;
BEGIN
    
	FOR r_dept in dept_cur
	LOOP
		DBMS_OUTPUT.put_line(r_dept.deptno);
		DBMS_OUTPUT.put_line(r_dept.dname);
		DBMS_OUTPUT.put_line(r_dept.loc);
	END LOOP;
  
END;
/
rem task2 cursor
DROP TABLE old_dept;
CREATE TABLE old_dept (
 DEPTNO              NUMBER(2) PRIMARY KEY,
 DNAME               VARCHAR2(14),
 LOC                 VARCHAR2(13)
 
 );
DECLARE
	CURSOR dept_cur
	IS
	SELECT deptno
	, dname
	, loc
	FROM dept;
	r_dept dept_cur%ROWTYPE;
BEGIN
	OPEN dept_cur;
    LOOP
        FETCH dept_cur INTO r_dept;
        EXIT WHEN dept_cur%NOTFOUND;
        INSERT INTO old_dept
        (deptno,dname,loc) VALUES
        (r_dept.deptno,r_dept.dname,r_dept.loc);
    END LOOP;
	DBMS_OUTPUT.put_line(TO_CHAR(dept_cur%ROWCOUNT)||
	' department(s) copied');
	CLOSE dept_cur;
END;
/
