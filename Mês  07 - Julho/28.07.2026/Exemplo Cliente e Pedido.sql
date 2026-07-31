CREATE TABLE cliente (
	id INT,
    nome VARCHAR(100),
    cpf CHAR(11),
    email VARCHAR(50),
    telefone VARCHAR(20),
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