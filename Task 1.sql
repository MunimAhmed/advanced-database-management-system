Select job, min(hiredate) from emp group by deptno, job order by min(hiredate) desc;


SELECT TO_CHAR(SYSDATE, 'Day') as "Day",
       TO_CHAR(SYSDATE, 'HH24:MI:SS') as "Time"
  FROM DUAL;
  
  
SELECT ename, sal, 
    CASE
        WHEN deptno = 10 THEN sal + 1000
        WHEN deptno = 20 THEN sal + 2000
        ELSE sal + 3000
    END as dreamsalary
FROM emp
ORDER BY dreamsalary;


SELECT 
    CASE 
        WHEN MOD(2016, 4) = 0 AND (MOD(2016, 100) != 0 OR MOD(2016, 400) = 0) THEN 'Leap Year'
        ELSE 'Not a Leap Year'
    END as leap_year_status
FROM dual;

SELECT ename, deptno FROM emp e 
WHERE e.sal IN (SELECT max(sal) FROM emp GROUP BY deptno);

SELECT ename, job
FROM emp
WHERE job IN ('MANAGER', 'CLERK', 'ANALYST');


SELECT ename
FROM emp
WHERE ename LIKE '%M%';


SELECT ename
FROM emp
WHERE ename LIKE '%LL%' OR ename LIKE '%TT%';

SELECT TRIM(TRAILING '0' FROM column) as column FROM table;

CREATE TABLE Teacher (
    t_id NUMBER(10) PRIMARY KEY,
    t_name VARCHAR2(20) NOT NULL,
    phone NUMBER(10) NOT NULL,
    salary NUMBER(7) NOT NULL,
    email VARCHAR2(30) NOT NULL
);

SELECT ename FROM emp
WHERE hiredate > (SELECT hiredate FROM emp WHERE ename='KING');

SELECT ename FROM emp
WHERE sal > (SELECT MAX(sal) FROM emp WHERE job = 'CLERK');

SELECT ename FROM emp
WHERE sal > (SELECT MIN(sal) FROM emp WHERE job = 'CLERK');

SELECT ename, deptno FROM emp e 
WHERE e.sal IN (SELECT max(sal) FROM emp GROUP BY deptno);

Select ename from emp where sal>(Select sal from emp where ename='SMITH');

SELECT ename FROM emp
JOIN dept
ON emp.deptno = dept.deptno
WHERE loc = 'DALLAS';

SELECT e.ename  
FROM emp e
INNER JOIN emp m ON e.mgr = m.empno AND e.HIREDATE < m.HIREDATE;

SELECT e.ename AS "Employee Name", 
   COALESCE(m.ename, 'NO MANAGER') AS "Manager"
     FROM emp e 
       LEFT JOIN emp m
         ON e.mgr = m.empno or e.mgr=NULL;
		 
SELECT e.ename, s.grade
FROM emp e
JOIN salgrade s
ON e.sal BETWEEN s.losal and s.hisal;		 

Select e.ename, e.deptno, d.dname from emp e join dept d on e.deptno = d.deptno;

CREATE TABLE Publishers (
    pubid INT PRIMARY KEY,
    pname VARCHAR(255),
    email VARCHAR(255),
    phone VARCHAR(255)
);

CREATE TABLE Subjects (
    subid INT PRIMARY KEY,
    sname VARCHAR(255)
);

CREATE TABLE Titles (
    titleid INT PRIMARY KEY,
    title VARCHAR(255),
    pubid INT,
    subid INT,
    pubdate DATE,
    cover VARCHAR(255),
    price DECIMAL(10,2),
    FOREIGN KEY (pubid) REFERENCES Publishers(pubid),
    FOREIGN KEY (subid) REFERENCES Subjects(subid)
);

CREATE TABLE authors (
    auid INT PRIMARY KEY,
    aname VARCHAR(255),
    email VARCHAR(255),
    phone VARCHAR(255)
);

CREATE TABLE titleauthors (
    titleid INT,
    authid INT,
    importance INT,
    FOREIGN KEY (titleid) REFERENCES Titles(titleid),
    FOREIGN KEY (authid) REFERENCES authors(auid)
);