--1
SELECT UPPER(emp.nome) "Nome", LOWER(emp.funcao)"Funcao", INITCAP(dep.nome)"Departamento"
FROM emp, dep
WHERE emp.ndep = dep.ndep
ORDER BY emp.nome;

--2
select Count(nome) "Total de empregados"
FROM emp;

--3
SELECT COUNT(*) - COUNT(premios) "Empregados sem premio"
FROM emp;

--4
SELECT COUNT(nome) "Total de empregados", CAST(AVG(sal) AS NUMERIC(20,2))"Salario medio mensal", 12 * SUM(sal) + SUM(premios) "Renumeraçao total anual"
FROM emp;

--5
SELECT nome, funcao, sal, CAST(sal*1.1355 as NUMERIC(20,1)) "Salario com aumento"
FROM emp
WHERE funcao = 'Continuo';

--6
SELECT nome, funcao, sal, CAST(sal*1.1355 as NUMERIC(20)) "Salario com aumento"
FROM emp
WHERE funcao = 'Continuo';

--7
SELECT CONCAT( '>>>> ', nome, ' ', REPEAT('<', 25 - LENGTH(nome) - 2 - 4) ) "Mariquices com strings"
FROM emp
ORDER BY nome;

--8
SELECT MIN(sal) "Salario minimo", MAX(sal) "Salario maximo", ROUND(AVG(sal)) "Salario medio"
FROM emp;

--9
SELECT DISTINCT ndep, MAX(sal) - MIN(sal) "Diferença"
FROM emp
GROUP BY ndep;

--10
SELECT funcao, COUNT(funcao) "Quantidade"
FROM emp
GROUP BY funcao
ORDER BY funcao;

--11
SELECT funcao, COUNT(funcao) "Quantidade"
FROM emp
WHERE funcao = 'Analista' or funcao like '%o'
GROUP BY funcao
ORDER BY funcao;

--12
SELECT COALESCE(encar, 0) "Encarregado", MIN(sal) "Salario minimo"
FROM emp
GROUP BY encar
HAVING MIN(sal) >= 200000
ORDER BY "Salario minimo";

--13
SELECT DISTINCT funcao, ROUND(avg(sal)) "Salario medio"
FROM emp
GROUP BY funcao
ORDER BY "Salario medio";

--14
SELECT ndep, funcao, MAX(sal) "Salario maximo", MIN(sal) "Salario minimo", ROUND(AVG(sal)) "Salario medio", COUNT(funcao) "Numero empregados"
FROM emp
WHERE nome <> 'Jorge Sampaio'
GROUP BY ndep, funcao
HAVING MAX(sal) > 200000
ORDER BY ndep, MAX(sal);
