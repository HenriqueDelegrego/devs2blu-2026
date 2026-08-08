


CREATE DATABASE escola;

USE escola;

CREATE TABLE area (
	id INT,
	nome VARCHAR(50) NOT NULL UNIQUE,
	PRIMARY KEY (id)
);

CREATE TABLE professor (
	id INT,
	nome VARCHAR(50) NOT NULL,
	id_area INT,
	PRIMARY KEY (id),
	FOREIGN KEY (id_area)
	REFERENCES area(id)
);

CREATE TABLE aluno (
	id INT,
	nome VARCHAR(50) NOT NULL,
	data_nascimento DATE NOT NULL,
	media DECIMAL(10,2),
	id_professor INT,
	PRIMARY KEY (id),
	FOREIGN KEY (id_professor)
	REFERENCES professor(id)
);


-- Áreas
INSERT INTO area (id, nome) VALUES
(1, 'Matemática'),
(2, 'Português'),
(3, 'História'),
(4, 'Geografia'),
(5, 'Ciências');

-- Professores
INSERT INTO professor (id, nome, id_area) VALUES
(1, 'Carlos Silva', 1),
(2, 'Ana Souza', 2),
(3, 'Marcos Oliveira', 3),
(4, 'Juliana Costa', 4),
(5, 'Roberto Santos', 5);

-- Alunos
INSERT INTO aluno (id, nome, data_nascimento, media, id_professor) VALUES
(1, 'Lucas Almeida', '2010-03-15', 8.50, 1),
(2, 'Mariana Lima', '2011-07-22', 9.20, 2),
(3, 'Pedro Ferreira', '2010-11-08', 7.80, 1),
(4, 'Beatriz Martins', '2011-01-30', 8.90, 3),
(5, 'Gabriel Rocha', '2010-05-17', 6.75, 4),
(6, 'Laura Mendes', '2011-09-12', 9.50, 5),
(7, 'Rafael Gomes', '2010-12-03', 7.25, 3),
(8, 'Sofia Ribeiro', '2011-04-25', 8.15, 2),
(9, 'João Carvalho', '2010-08-19', 6.90, 4),
(10, 'Camila Barbosa', '2011-10-06', 9.00, 5);

-- Mostra todas as colunas (*) e todos os registros
-- da tabela aluno.
SELECT *
FROM aluno;


-- Mostra apenas o nome e a média dos alunos
-- que possuem média maior que 7.
-- ORDER BY media DESC organiza os resultados
-- da maior média para a menor.
SELECT nome, media
FROM aluno
WHERE media > 7
ORDER BY media DESC;


-- Mostra o nome dos professores que pertencem
-- à área cujo id é 2 (Português).
SELECT nome
FROM professor
WHERE id_area = 2;


-- Mostra o nome e a data de nascimento dos alunos
-- que nasceram depois de 01/01/2002.
SELECT nome, data_nascimento
FROM aluno
WHERE data_nascimento > '2002-01-01';


-- Mostra todos os dados (*) dos alunos
-- que possuem o professor com id igual a 1.
SELECT *
FROM aluno
WHERE id_professor = 1;