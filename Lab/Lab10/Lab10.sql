SET serverout ON;
rem exampe 1
DROP TABLE t2;
CREATE TABLE T2
(     
    a INTEGER,     
    b CHAR(10) 
); 
 
CREATE PROCEDURE addtuple2(  
    x T2.a%TYPE,
    y T2.b%TYPE)
    AS
BEGIN     
    INSERT INTO T2(a, b)VALUES(x, y); 
END;
/

BEGIN 
addtuple2(10, 'abc'); 
END;
/
rem exampe 2
rem out
DROP TABLE T3;
CREATE TABLE T3 ( 
    a INTEGER,     
    b INTEGER 
); 
 
CREATE PROCEDURE addtuple3(
    a NUMBER, 
    b OUT NUMBER)
    AS 
BEGIN     
    b := 4;
    INSERT INTO T3 VALUES(a, b); 
END;
/
DECLARE 
    v NUMBER;
BEGIN     
    addtuple3(10, v);     
    dbms_output.put_line('val of v is : '||v); 
END;
/
rem exampe 3
rem function
CREATE or replace FUNCTION SalAction(Salary NUMBER,title VARCHAR) 
RETURN BOOLEAN IS 
Min_sal NUMBER; 
Max_sal NUMBER; 
BEGIN
    SELECT min(sal) losal, max(sal) hisal INTO Min_sal, Max_sal    
    FROM emp WHERE job=title;    
    RETURN (salary>= Min_sal) AND(salary<= Max_sal );  
END ;
/
DECLARE 
    X BOOLEAN;
   
BEGIN 
   
    X:=SalAction(1000,'CLERK');  
IF (x) THEN       
    dbms_output.put_line('salary of 1000 is normal'); 
ELSE      
    dbms_output.put_line('salary of 1000 is not normal'); 
END IF; 
 
END;
/
SELECT object_type,object_name 
FROM user_objects
WHERE object_type='PROCEDURE' 
Or object_type='FUNCTION';
DROP FUNCTION SALACTION;

rem=====================================================
rem example 3
rem triggers

DROP TABLE T4;
DROP TABLE T5;
CREATE TABLE T4 (a INTEGER, b CHAR(10));
CREATE TABLE T5 (c CHAR(10), d INTEGER); 
INSERT INTO T4 VALUES(1,'G');
CREATE TRIGGER trig1  
    AFTER INSERT ON T4 
    FOR EACH ROW     
    WHEN (NEW.a <= 10)     
    BEGIN         
        INSERT INTO T5 VALUES(:NEW.b, :NEW.a);     
    END trig1;
/
DROP TRIGGER trig1;
alter trigger trig1 enable;
rem=====================================================
rem task1
CREATE OR REPLACE FUNCTION DelEmployee(par_job IN emp.job%TYPE)
RETURN NUMBER
IS 
BEGIN
	DELETE old_emp
	WHERE job=par_job;
	return SQL%ROWCOUNT;
END;
/

--- execute:
DECLARE 
	counter NUMBER;
BEGIN 
	counter:=DelEmployee('ANALYST');
	DBMS_OUTPUT.put_line(counter);
END;
/
rem task2
DROP TABLE old_emp;
create table old_emp as select * from EMP;
CREATE OR REPLACE PROCEDURE delemployee2(par_job IN emp.job%TYPE, par_count OUT NUMBER)
IS
BEGIN
    DELETE FROM old_emp
    WHERE job=par_job;
    par_count:=SQL%ROWCOUNT;
END;
/
--- execute:
DECLARE 
	counter NUMBER;
BEGIN 
	DelEmployee2('ANALYST',counter);
	DBMS_OUTPUT.put_line(counter);
END;
/
rem triggers
rem task3
drop table ce;
create table ce(un varchar2(10),tn varchar2(10),a varchar2(10),ac date);

CREATE OR REPLACE TRIGGER triger1
AFTER INSERT OR DELETE OR UPDATE ON emp
DECLARE 
    name varchar2(20);
BEGIN
SELECT SYS_CONTEXT ('USERENV', 'CURRENT_USER') INTO name from dual;
   IF DELETING THEN
      INSERT INTO ce VALUES (name, 'emp','DELETING', SYSDATE); 
   ELSIF INSERTING THEN
      INSERT INTO ce VALUES (name, 'emp','INSERTING', SYSDATE); 
   ELSIF UPDATING THEN
      INSERT INTO ce  VALUES (name, 'emp','UPDATING', SYSDATE); 
     END IF;
end;
/
insert into emp(empno,deptno) values(4000,10);
select * from ce;
rem task4
create table emp_new(empno number(4) primary key,old_sal number(7,2),new_sal number(7,2));

CREATE OR REPLACE TRIGGER trig4
AFTER UPDATE OF sal ON emp
FOR EACH ROW WHEN (((NEW.sal*100)/OLD.sal) -100 >50)
BEGIN
	INSERT INTO emp_new VALUES(:OLD.empno,:OLD.sal,:NEW.sal);
END;
/
show errors trigger trig4;

UPDATE emp
SET sal=7600
WHERE empno=7839;

select * from emp_new;

UPDATE emp
SET sal=3000
WHERE empno=7698;

select * from emp_new;
