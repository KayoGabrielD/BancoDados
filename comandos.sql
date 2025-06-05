--  1. DDL (Data Definition Language)
-- Comandos para definir estruturas no banco de dados (CREATE, ALTER, DROP)
create database cliente;
use cliente;
-- Criando uma tabela chamada "clientes"
CREATE TABLE clientes (
    id INT PRIMARY KEY,
    nome VARCHAR(100),
    email VARCHAR(100),
    idade INT
);

-- Adicionando uma nova coluna na tabela "clientes"
ALTER TABLE clientes ADD telefone VARCHAR(20);

-- Excluindo a tabela "clientes"
DROP TABLE clientes;

-- 2. DML (Data Manipulation Language)
-- Comandos para manipular dados nas tabelas (INSERT, UPDATE, DELETE)

-- Inserindo dados na tabela "clientes"
INSERT INTO clientes (id, nome, email, idade, telefone)
VALUES (1, 'João Silva', 'joao@email.com', 30, '11999999999');

-- Atualizando o telefone do cliente com id = 1
UPDATE clientes
SET telefone = '11888888888'
WHERE id = 1;

-- Excluindo o cliente com id = 1
DELETE FROM clientes
WHERE id = 1;

-- 3. DQL (Data Query Language)
-- Comando principal para consultar dados (SELECT)

-- Selecionando todos os dados da tabela "clientes"
SELECT * FROM clientes;

-- Selecionando apenas nome e email dos clientes com idade maior que 25
SELECT nome, email FROM clientes
WHERE idade > 25;

-- 4. DCL (Data Control Language)
-- Comandos para controlar permissões (GRANT, REVOKE)

-- Concedendo permissão de SELECT na tabela "clientes" ao usuário "usuario_teste"
GRANT SELECT ON clientes TO usuario_teste;

-- Revogando a permissão de SELECT do usuário "usuario_teste"
REVOKE SELECT ON clientes FROM usuario_teste;

--  5. TCL (Transaction Control Language)
-- Comandos para gerenciar transações (COMMIT, ROLLBACK, SAVEPOINT)

-- Iniciando uma transação para inserir dois registros
BEGIN;

INSERT INTO clientes (id, nome, email, idade, telefone)
VALUES (2, 'Maria Oliveira', 'maria@email.com', 28, '11911111111');

-- Criando um ponto de salvamento
SAVEPOINT ponto1;

INSERT INTO clientes (id, nome, email, idade, telefone)
VALUES (3, 'Carlos Souza', 'carlos@email.com', 35, '11922222222');

-- Cancelando até o ponto de salvamento
ROLLBACK TO ponto1;

-- Confirmando a transação
COMMIT;