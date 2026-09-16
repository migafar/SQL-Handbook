--1.DATA MANIPULATION LANGUAGE--
--SELECT--
SELECT *FROM HR.EMPLOYEES;
SELECT FIRST_NAME|| ' '|| LAST_NAME AS "Ad ve soyad " FROM HR.EMPLOYEES;

SELECT FIRST_NAME,LAST_NAME,SALARY,SALARY * 0.3 "salary+bonus" FROM HR.EMPLOYEES;

SELECT FIRST_NAME,LAST_NAME,SALARY FROM HR.EMPLOYEES WHERE SALARY >= 6000;
SELECT FIRST_NAME,LAST_NAME,SALARY,DEPARTMENT_ID FROM HR.EMPLOYEES WHERE SALARY >= 6000 AND DEPARTMENT_ID = 60;
SELECT FIRST_NAME,LAST_NAME,SALARY,DEPARTMENT_ID FROM HR.EMPLOYEES WHERE SALARY >= 6000 OR DEPARTMENT_ID = 60;

SELECT FIRST_NAME,LAST_NAME,SALARY,DEPARTMENT_ID FROM HR.EMPLOYEES WHERE DEPARTMENT_ID IN ( 20, 30, 50 );
SELECT FIRST_NAME,LAST_NAME,SALARY,DEPARTMENT_ID FROM HR.EMPLOYEES WHERE DEPARTMENT_ID NOT IN ( 20, 30, 50 );

--Regex--
SELECT FIRST_NAME FROM HR.EMPLOYEES WHERE FIRST_NAME LIKE 'Su%';
SELECT FIRST_NAME FROM HR.EMPLOYEES WHERE FIRST_NAME LIKE '%nn%';
SELECT FIRST_NAME FROM HR.EMPLOYEES WHERE FIRST_NAME LIKE 'T__nn%';

SELECT FIRST_NAME,LAST_NAME,DEPARTMENT_ID FROM HR.EMPLOYEES WHERE DEPARTMENT_ID BETWEEN 20 AND 50;

SELECT*FROM HR.EMPLOYEES;
SELECT FIRST_NAME,LAST_NAME,COMMISSION_PCT FROM HR.EMPLOYEES WHERE COMMISSION_PCT IS NOT NULL;

SELECT FIRST_NAME,LAST_NAME FROM HR.EMPLOYEES ORDER BY FIRST_NAME , LAST_NAME;
SELECT FIRST_NAME,LAST_NAME,SALARY,DEPARTMENT_ID FROM HR.EMPLOYEES order by SALARY, DEPARTMENT_ID;
SELECT FIRST_NAME,LAST_NAME,SALARY,DEPARTMENT_ID FROM HR.EMPLOYEES order by SALARY desc;

SELECT count(FIRST_NAME) from hr.EMPLOYEES;
SELECT count(distinct(FIRST_NAME)) from hr.EMPLOYEES;

--STRING--
SELECT * from hr.JOB_HISTORY;
SELECT start_date,to_char(start_date,'DD-Mon-YYYY') FROM HR.JOB_HISTORY;
SELECT sysdate as "bu gunun tarixi" from dual;
SELECT to_char(sysdate,'DD-Mon-YYYY') as "bu gunun tarixi" FROM dual;

SELECT 'Mir Qafar' as Ad from dual;
SELECT initcap('mir qafar') as Ad from dual;
SELECT upper('mir qafar') as Ad from dual;
SELECT lower('mir qafar') as Ad from dual;
SELECT length('mir qafar') as Ad from dual;

SELECT length('   mirqafar    ') as Ad from dual;
SELECT length (trim('   mirqafar    ')) as Ad from dual;
SELECT length (ltrim('   mirqafar    ')) as Ad from dual;
SELECT length (rtrim('   mirqafar    ')) as Ad from dual;

SELECT replace('Mirqatar','t','f') as Ad from dual; 
SELECT rpad('Mirqafar','10','!') as Ad from dual; 
SELECT substr('Mirqafar','5','4') as Ad from dual; 
SELECT instr('Mirqafar','a',6,1) as Ad from dual; 

--CONDITIONAL--
SELECT * from hr.EMPLOYEES;
SELECT employee_id, coalesce(first_name,last_name,email) from hr.EMPLOYEES;
SELECT  NVL(commission_pct,0) as nvl from hr.EMPLOYEES;
SELECT  NVL(to_char(commission_pct),'yoxdur') as nvl from hr.EMPLOYEES;

SELECT decode(1,2,'beraber','beraber deyil') from dual; --4 dene olmasa olmaz ilk ikisini muqayise edir--

SELECT hire_date, round(months_between(sysdate,hire_date)) from hr.EMPLOYEES;
SELECT hire_date ,extract(day from hire_date) from hr.EMPLOYEES;
SELECT hire_date ,extract(month from hire_date) from hr.EMPLOYEES;
SELECT hire_date ,extract(year from hire_date) from hr.EMPLOYEES;

WHERE manager_id is null;
SELECT count(first_name) from hr.EMPLOYEES; --COUNT null deyerleri saymir--

--AGREGAT--
SELECT * from hr.EMPLOYEES;
SELECT min(salary),max(salary),sum(salary),avg(salary) from hr.EMPLOYEES;
SELECT sum(salary) ,department_id from hr.EMPLOYEES group by department_id;
SELECT sum(salary) ,department_id from hr.EMPLOYEES group by department_id having sum(salary)>58000;
SELECT min(salary) ,department_id from hr.EMPLOYEES group by department_id 
having min(salary)>4000 
order by min(salary);


SELECT first_name,last_name,salary ,
CASE
    WHEN salary >=10000 THEN 'YUKSEK'
    WHEN salary >=5000 THEN 'ORTA'
    ELSE 'ASAGI'
    END AS "SALARY_CAT"
from hr.EMPLOYEES;

SELECT first_name||' '|| last_name AS full_name from hr.EMPLOYEES;

--JOINS--
SELECT * from hr.EMPLOYEES;
SELECT * from hr.DEPARTMENTS;

SELECT first_name, last_name,hr.department_id, d.department_name 
from hr.EMPLOYEES hr 
inner join hr.DEPARTMENTS d on hr.department_id=d.department_id

SELECT first_name, last_name,hr.department_id, d.department_name 
from hr.EMPLOYEES hr 
left join hr.DEPARTMENTS d on hr.department_id=d.department_id
 --son setrde left tblda null oldugundan birlesmedi--

SELECT first_name, last_name,hr.department_id, d.department_name 
from hr.EMPLOYEES hr 
right join hr.DEPARTMENTS d on hr.department_id=d.department_id
--setirlerin sayi artdi sona fikir versez sag tblda daha cox oldugu ucun--

SELECT first_name, last_name,hr.department_id, d.department_name 
from hr.EMPLOYEES hr 
full join hr.DEPARTMENTS d on hr.department_id=d.department_id
--butun nullar verildi 123 setir--

/*CROSS JOIN operatoru da vardirki ayri tablelari birlesdirir ve ozellikleri paylayir meselen
masin tbl ile color tbl cross join olunarsa her masina her bir rengleri paylayib vahid table yaradacaqdir*/

--UNIONS--
SELECT first_name from hr.EMPLOYEES
UNION ALL
SELECT department_name from hr.DEPARTMENTS;--ALL yazanda duplicatelari da gosterir--

SELECT first_name,manager_id from hr.EMPLOYEES
WHERE manager_id is not null 
INTERSECT
SELECT first_name,manager_id,department_id from hr.EMPLOYEES
WHERE department_id>50
--kesisdirerek tablelari birlesdire bilirik--

SELECT first_name from hr.EMPLOYEES
MINUS
SELECT first_name from hr.EMPLOYEES
WHERE commission_pct is not null --coxluqlar ferqi anlayisi--


SELECT * from hr.EMPLOYEES;
SELECT first_name,last_name,salary from hr.EMPLOYEES
order by salary desc

fetch first n rows only --ORACLE SQL ucundur--

limit n; --PostgreSQL ucundur--
SELECT top n first_name,last_name,salary from hr.EMPLOYEES --MS SQL ucundur--

--SUBQUERIES--
SELECT avg(salary) from hr.EMPLOYEES;
SELECT first_name,last_name,salary from hr.EMPLOYEES
WHERE salary> avg(salary); --BU sehvdir cunki agregat funksiye WHERE ile islenmez--

SELECT first_name,last_name,salary from hr.EMPLOYEES
WHERE salary> (SELECT avg(salary) from hr.EMPLOYEES);--BU duzgun formadir--

SELECT * from hr.DEPARTMENTS;
SELECT first_name,last_name,department_id from hr.EMPLOYEES
WHERE department_id in (SELECT department_id from hr.DEPARTMENTS WHERE department_name='IT')

--RANK--
SELECT first_name,last_name,salary,
ROW_NUMBER() over (ORDER by salary desc) as row_num
from hr.EMPLOYEES;

SELECT first_name,last_name,salary,
RANK() over (ORDER by salary desc) as salary_rank
from hr.EMPLOYEES;

SELECT first_name,last_name,salary,department_id,
DENSE_RANK() over (ORDER by department_id  desc) as dep_num
from hr.EMPLOYEES;

SELECT first_name,last_name,salary,
LAG(salary,1) over (ORDER by salary ) as previus_salary
from hr.EMPLOYEES; --Bir onceki maasi gostererek muqayise edir--

SELECT first_name,last_name,salary,
LEAD(salary,1) over (ORDER by salary ) as next_salary
from hr.EMPLOYEES; --Bir sonraki maasi gostererek muqayise edir--

SELECT first_name,last_name,salary,department_id,
FIRST_VALUE(salary) over (PARTITION by department_id ORDER by salary desc ) as hihgest_dept_salary
from hr.EMPLOYEES;--Department uzre en yuksek maasi verecekdir--

SELECT first_name,last_name,salary,department_id,
LAST_VALUE(salary) over (PARTITION by department_id ORDER by salary ) as lowest_dept_salary
from hr.EMPLOYEES;--Department uzre en yuksek maasi verecekdir--

--Bu arada desc eksi asc dir--