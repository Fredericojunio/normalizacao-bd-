-- 1. Reconstitui a informação principal da tabela original (funcionário + cargo + função + morada)
SELECT f.nome, f.email, c.designacao AS cargo, fu.designacao AS funcao,
       ci.cidade, p.provincia, p.pais, f.data_admissao
FROM funcionario f
JOIN cargo c      ON f.cod_cargo = c.cod_cargo
JOIN funcao fu    ON f.cod_funcao = fu.cod_funcao
JOIN cidade ci    ON f.cidade = ci.cidade
JOIN provincia p  ON ci.provincia = p.provincia;

-- 2. Reconstitui as colunas Filho1/Filho2/Filho3 da tabela original
SELECT f.nome AS funcionario, fi.nome_filho
FROM funcionario f
JOIN filho fi ON f.nuit = fi.nuit
ORDER BY f.nome;

-- 3. Reconstitui as colunas Celular1/Celular2/Celular3 da tabela original
SELECT f.nome AS funcionario, t.numero
FROM funcionario f
JOIN telefone t ON f.nuit = t.nuit
ORDER BY f.nome;

-- 4. Demonstra a eliminação de redundância: contagem de funcionários por cargo
SELECT c.designacao AS cargo, COUNT(*) AS total_funcionarios
FROM funcionario f
JOIN cargo c ON f.cod_cargo = c.cod_cargo
GROUP BY c.designacao
ORDER BY total_funcionarios DESC;
