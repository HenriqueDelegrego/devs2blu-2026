CREATE DATABASE cliente_pedido;

USE cliente_pedido;

CREATE TABLE cliente (
	id INT,
    nome VARCHAR(100),
    cpf CHAR(11),
    email VARCHAR(50),
    telefone VARCHAR(20),
	data_nascimento DATE,
	PRIMARY KEY(id)    
);

CREATE TABLE pedido (
    id INT,
    data_pedido DATE,
    valor_total DECIMAL(10,2),
	id_cliente INT,
	PRIMARY KEY(id),
    FOREIGN KEY (id_cliente)
    REFERENCES cliente(id)
);

-- =====================================================
-- INSERINDO UM CLIENTE
-- =====================================================

-- Cadastra um cliente na tabela cliente
INSERT INTO cliente (id, nome, cpf, email, telefone, data_nascimento)
VALUES
(1, 'João', '111', 'joao@email.com', '123', '2000-08-20');


-- =====================================================
-- INSERINDO UM PEDIDO VÁLIDO
-- =====================================================

-- Cadastra um pedido para o cliente de código 1.
-- Como esse cliente existe na tabela cliente,
-- o cadastro será realizado com sucesso.
INSERT INTO pedido (id, data_pedido, valor_total, id_cliente)
VALUES
(1, '2026-07-31', 50, 1);


-- =====================================================
-- TENTANDO INSERIR UM PEDIDO INVÁLIDO
-- =====================================================

-- Este comando gera um erro.
-- O motivo é que o cliente de código 5
-- não existe na tabela cliente.
--
-- Como id_cliente é uma chave estrangeira,
-- o banco de dados impede que um pedido
-- seja cadastrado para um cliente inexistente.
--
-- Esse mecanismo garante a integridade
-- dos dados do banco.
INSERT INTO pedido (id, data_pedido, valor_total, id_cliente)
VALUES
(2, '2026-07-31', 55, 5);


