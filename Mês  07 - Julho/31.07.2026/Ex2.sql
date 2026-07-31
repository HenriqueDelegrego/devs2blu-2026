-- Cria um banco de dados chamado "concessionaria"
CREATE DATABASE concessionaria;

-- Seleciona esse banco de dados para que os próximos comandos
-- sejam executados dentro dele
USE concessionaria;


-- =====================================================
-- TABELA: cor
-- Armazena as cores disponíveis para os veículos.
-- =====================================================
CREATE TABLE cor (

    -- Identificador único da cor
    id INT,

    -- Nome da cor (até 50 caracteres)
    nome_cor VARCHAR(50),

    -- Define o campo "id" como chave primária
    -- (não pode repetir e não pode ser nulo)
    PRIMARY KEY (id)
);


-- =====================================================
-- TABELA: marca
-- Armazena as marcas dos veículos.
-- =====================================================
CREATE TABLE marca (

    -- Identificador da marca
    id INT,

    -- Nome da marca
    nome_marca VARCHAR(50),

    -- Chave primária
    PRIMARY KEY (id)
);


-- =====================================================
-- TABELA: proprietario
-- Guarda os dados dos proprietários dos veículos.
-- =====================================================
CREATE TABLE proprietario (

    -- Identificador do proprietário
    id INT,

    -- Nome do proprietário
    nome VARCHAR(50),

    -- Telefone (armazenado como texto para preservar zeros à esquerda)
    telefone VARCHAR(11),

    -- Endereço de e-mail
    email VARCHAR(50),

    -- Chave primária
    PRIMARY KEY (id)
);


-- =====================================================
-- TABELA: combustivel
-- Lista os tipos de combustível.
-- Exemplos: Gasolina, Etanol, Diesel, Elétrico.
-- =====================================================
CREATE TABLE combustivel (

    -- Identificador do combustível
    id INT,

    -- Nome do combustível
    nome_combustivel VARCHAR(50),

    -- Chave primária
    PRIMARY KEY (id)
);


-- =====================================================
-- TABELA: modelo
-- Armazena os modelos dos veículos.
-- Cada modelo pertence a uma marca.
-- =====================================================
CREATE TABLE modelo (

    -- Identificador do modelo
    id INT,

    -- Nome do modelo
    nome_modelo VARCHAR(50),

    -- Guarda o código da marca correspondente
    id_marca INT,

    -- Chave primária
    PRIMARY KEY (id),

    -- Chave estrangeira:
    -- obriga que o valor de id_marca exista na tabela marca
    FOREIGN KEY (id_marca)
    REFERENCES marca(id)
);


-- =====================================================
-- TABELA: veiculo
-- Contém as informações de cada veículo.
-- =====================================================
CREATE TABLE veiculo (

    -- Identificador do veículo
    id INT,

    -- Ano em que o veículo foi fabricado
    ano_fabricacao INT,

    -- Ano do modelo do veículo
    ano_modelo INT,

    -- Quilometragem atual
    quilometragem INT,

    -- Quantidade de portas
    portas INT,

    -- Código do proprietário
    id_proprietario INT,

    -- Código da cor
    id_cor INT,

    -- Código do modelo
    id_modelo INT,

    -- Chave primária
    PRIMARY KEY(id),

    -- Chave estrangeira para proprietário
    FOREIGN KEY (id_proprietario)
    REFERENCES proprietario(id),

    -- Chave estrangeira para cor
    FOREIGN KEY (id_cor)
    REFERENCES cor(id),

    -- Chave estrangeira para modelo
    FOREIGN KEY (id_modelo)
    REFERENCES modelo(id)
);


-- =====================================================
-- TABELA: veiculo_combustivel
-- Faz a ligação entre veículos e combustíveis.
--
-- Essa tabela é necessária porque um veículo pode utilizar
-- mais de um combustível (ex.: Flex = Gasolina + Etanol).
-- Também representa um relacionamento muitos-para-muitos.
-- =====================================================
CREATE TABLE veiculo_combustivel (

    -- Código do veículo
    id_veiculo INT,

    -- Código do combustível
    id_combustivel INT,

    -- Chave primária composta.
    -- O mesmo veículo não pode ser associado
    -- duas vezes ao mesmo combustível.
    PRIMARY KEY (id_veiculo, id_combustivel),

    -- Chave estrangeira para veículo
    FOREIGN KEY (id_veiculo)
    REFERENCES veiculo(id),

    -- Chave estrangeira para combustível
    FOREIGN KEY (id_combustivel)
    REFERENCES combustivel(id)
);