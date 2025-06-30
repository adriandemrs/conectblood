-- conectblood_manipulate.sql
-- Comandos de manipulação de dados no banco ConectBlood

-- Atualização de telefone de um usuário
UPDATE usuarios
SET telefone = '61988880001'
WHERE id = 1;

-- Remoção de um usuário do grupo (sem apagar o usuário do sistema)
DELETE FROM usuarios_grupos
WHERE usuario_id = 3 AND grupo_id = 1;

-- Consulta simples: todos os usuários
SELECT * FROM usuarios;

-- Consulta dos usuários com seus respectivos grupos
SELECT 
    u.nome AS nome_usuario,
    u.bairro,
    g.nome_grupo,
    g.data_criacao
FROM usuarios u
JOIN usuarios_grupos ug ON u.id = ug.usuario_id
JOIN grupos g ON g.id = ug.grupo_id;

-- Consulta de grupos com quantidade de membros
SELECT 
    g.nome_grupo,
    COUNT(ug.usuario_id) AS total_membros
FROM grupos g
LEFT JOIN usuarios_grupos ug ON g.id = ug.grupo_id
GROUP BY g.nome_grupo;
