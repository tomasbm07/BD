--1
select min(sal) "Salario minimo"
from emp;

--2
select nome, funcao, sal
from emp
where sal = (select min(sal) from emp);

--3
select nome, funcao, sal
from emp
where funcao = (select funcao 
				from emp
				where nome = 'Olga Costa');
				
--4
select nome, sal, ndep
from emp
where sal in (select max(sal) from emp group by ndep);

--5
select nome, sal, funcao, ndep
from emp
where sal > any (select min(sal) from emp)
order by sal desc;

--6
select nome, sal, funcao, ndep
from emp
where sal > all (select emp.sal
				from emp, dep
				where emp.ndep = dep.ndep and dep.nome = 'Vendas');
				
--7
select dep.nome, round(avg(sal)) "Salario medio"
from emp, dep
where emp.ndep = dep.ndep
group by dep.nome
having avg(sal) > (select avg(sal)
					from emp
				  	where ndep = 30);
--8

--9
CREATE TABLE emp2
(nemp NUMERIC(4) CONSTRAINT pk_emp PRIMARY KEY,
nome VARCHAR(20) CONSTRAINT nn_nome NOT NULL
 CONSTRAINT upper_nome CHECK (nome = UPPER(nome)),
funcao VARCHAR(12),
encar NUMERIC CONSTRAINT fk_encar REFERENCES emp2(nemp),
data_entrada DATE DEFAULT CURRENT_DATE,
sal NUMERIC(7) CONSTRAINT ck_sal CHECK (sal>70000),
premios NUMERIC(7) DEFAULT NULL,
ndep NUMERIC(2) CONSTRAINT nn_dep NOT NULL
CONSTRAINT fk_ndep REFERENCES dep(ndep));

--10
insert into emp2(nemp, nome, funcao, encar, data_entrada, sal, premios, ndep)
values(5555, 'CHICO FININHO', 'Cantor', null, current_date , 100000, null, 40);

--11
insert into emp2
select nemp, Upper(nome), funcao, encar, current_date, case when sal < 70000 then 70001 else sal end, premios, ndep
from emp
where nemp <> 1902 and nemp <> 1369;

SELECT nemp, nome, encar, sal, premios, ndep 
FROM emp2
ORDER BY ndep;

--12
delete from emp2
where ndep = 10

--13
delete from emp2
where ndep = 20

--14
delete from emp2
where nemp = 1654;

--15
select 


