-- conectblood_create.sql
-- Criação das tabelas e inserção inicial de dados para o sistema ConectBlood

CREATE TABLE usuarios (
    id INT PRIMARY KEY,
    nome VARCHAR(100),
    email VARCHAR(100),
    telefone VARCHAR(20),
    bairro VARCHAR(50),
    data_cadastro DATE
);

CREATE TABLE grupos (
    id INT PRIMARY KEY,
    nome_grupo VARCHAR(50),
    data_criacao DATE
);

CREATE TABLE usuarios_grupos (
    id INT PRIMARY KEY,
    usuario_id INT,
    grupo_id INT,
    FOREIGN KEY (usuario_id) REFERENCES usuarios(id),
    FOREIGN KEY (grupo_id) REFERENCES grupos(id)
);

INSERT INTO usuarios (id, nome, email, telefone, bairro, data_cadastro) VALUES
(1, 'João Silva', 'joao@email.com', '61999990001', 'Asa Norte', '2025-06-01'),
(2, 'Maria Souza', 'maria@email.com', '61999990002', 'Asa Sul', '2025-06-02'),
(3, 'Carlos Lima', 'carlos@email.com', '61999990003', 'Lago Norte', '2025-06-03'),
(4, 'Ana Costa', 'ana@email.com', '61999990004', 'Taguatinga', '2025-06-04');

INSERT INTO grupos (id, nome_grupo, data_criacao) VALUES
(1, 'Grupo 1', '2025-06-05');

INSERT INTO usuarios_grupos (id, usuario_id, grupo_id) VALUES
(1, 1, 1),
(2, 2, 1),
(3, 3, 1),
(4, 4, 1);
