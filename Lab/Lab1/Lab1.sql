rem 1
SELECT ename  
FROM emp
WHERE ename LIKE 'S%' AND sal > 2000;
rem ==========================================
rem 2
SELECT AVG(sal)
FROM emp
WHERE deptno = 10;
rem ==========================================
rem 3
SELECT COUNT(ename)
FROM emp
WHERE deptno = 10;
rem ==========================================
rem 4
SELECT job ,sal 
FROM emp
WHERE sal>1000 and sal<2000;
rem ==========================================
rem 5
SELECT job ,sal 
FROM emp
WHERE job = 'CLERK';
rem ==========================================
rem 6
SELECT AVG(sal) 
FROM emp
WHERE job = 'CLERK';
rem ==========================================
rem 7
SELECT ename
FROM emp
WHERE NOT job  = 'CLERK';
rem ==========================================
rem 8
SELECT ename
FROM emp
WHERE NOT deptno = 20;
rem ==========================================
rem 9
SELECT ename
FROM emp
WHERE ename LIKE '%RK';
rem ==========================================
rem 10
SELECT *
FROM emp
WHERE ENAME LIKE 'TURNER';
rem ==========================================
rem 11
SELECT ename
FROM emp
WHERE HIREDATE > '2/12/1981' AND MGR=7566;
rem ==========================================
rem 12
SELECT ename 
FROM emp
WHERE HIREDATE BETWEEN  '3/12/1981' AND  '21/1/1982';