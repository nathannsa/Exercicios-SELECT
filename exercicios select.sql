# 1
SELECT * FROM departamento
WHERE (qtdfuncionariosdepto) > 15;

# 2
SELECT nome_funcionario
FROM atividade.funcionario
WHERE salario >= 4000;

#3
SELECT AVG(salario) AS media_salarial
FROM atividade.funcionario;

#4
SELECT ROUND(AVG(salario), 2) AS media_salarial
FROM atividade.funcionario;

#5
SELECT nome_funcionario
FROM atividade.funcionario
WHERE nome_funcionario LIKE '%Gomes%';

#6
SELECT nome_funcionario, salario * 12 AS salario_anual
FROM atividade.funcionario;

#7
SELECT *
FROM atividade.funcionario
WHERE salario = (SELECT MAX(salario) FROM atividade.funcionario);

#8
SELECT DISTINCT salario
FROM atividade.funcionario
ORDER BY salario DESC
LIMIT 2;

#9
SELECT f1.*
FROM atividade.funcionario f1
WHERE idade = (SELECT MAX(idade)
               FROM atividade.funcionario f2
               WHERE f1.cargo = f2.cargo);
               
#10
SELECT DISTINCT atividade.departamento.*
FROM atividade.departamento
JOIN atividade.funcionario ON atividade.departamento.sigla_depto = atividade.funcionario.sigla_depto
WHERE atividade.funcionario.salario > 5000;
	
#11
SELECT DISTINCT atividade.departamento.*
FROM atividade.departamento
JOIN atividade.funcionario ON atividade.departamento.sigla_depto = atividade.funcionario.sigla_depto
WHERE atividade.funcionario.salario > (SELECT AVG(salario) FROM atividade.funcionario);


#12
SELECT DISTINCT atividade.departamento.*
FROM atividade.departamento
JOIN atividade.funcionario ON atividade.departamento.sigla_depto = atividade.funcionario.sigla_depto
WHERE atividade.funcionario.nome_funcionario LIKE '%Costa%';

#13
SELECT DISTINCT atividade.departamento.*
FROM atividade.departamento
JOIN atividade.funcionario ON atividade.departamento.sigla_depto = atividade.funcionario.sigla_depto
WHERE atividade.funcionario.salario > (
    SELECT AVG(salario)
    FROM atividade.funcionario
    WHERE sigla_depto = atividade.funcionario.sigla_depto
);