--2.DATA DEFINITION LANGUAGE--
CREATE table qafar_employees(
    emp_id     NUMBER,
    first_name VARCHAR2(50),
    salary     NUMBER
)
--cedveli dolduraq--
INSERT INTO qafar_employees (emp_id,first_name,salary)
VALUES (1,'Mirqafar',1000);

INSERT INTO qafar_employees (emp_id,first_name,salary)
VALUES (2,'Asif',900);

SELECT * from qafar_employees;
COMMIT;--bu emeliyatin geri donusu yoxdur--

UPDATE qafar_employees
SET salary=1800
WHERE emp_id=1;

DELETE from qafar_employees
WHERE emp_id=2;

ROLLBACK; --geri qaytarmaq ucundur--Lakin COMMIT etdiyimize gore bu mumkun olmur--

TRUNCATE TABLE qafar_employees;--strukturu saxlayaraq cedvelinizi bosaldir--
SELECT * from qafar_employees;

ALTER TABLE qafar_employees
ADD hire_date DATE;
ALTER TABLE qafar_employees
DROP COLUMN hire_date;

ALTER TABLE qafar_employees
RENAME COLUMN first_name to name;

DROP TABLE qafar_employees;
/*DELETE de bu mueyyen sert qarsiliginda olur
TRUNCATE de ise strukturu saxlayaraq setirleri silir 
DROP da ise butun data silinir*/

