--Criando banco de dados
CREATE DATABASE consertodolele;

--Criando tabela
CREATE TABLE pecascomputador (
    id_produto INT AUTO_INCREMENT PRIMARY KEY
    nomepeca VARCHAR (255) NOT NULL,
    quant INT NOT NULL,
    valor DECIMAL (10.2) NOT NULL,
    fornecedor VARCHAR (255) NOT NULL,
    telefone VARCHAR (14) NOT NULL,
    ruafornecedor VARCHAR (255) NOT NULL,
    CEP VARCHAR (8) NOT NULL
     )

--Inserção de dados
INSERT INTO pecascomputador (nomepeca, quant, valor, fornecedor, telefone, ruafornecedor, CEP) 
    VALUES

('Memória RAM 8GB', 15, 220.00, 'TechMemory', '11988776655', 'Rua da Tecnologia, 100', '01010000'),

('HD 1TB', 25, 310.00, 'Armazém Digital', '11997654321', 'Av. Central, 450', '02020000'),

('SSD 480GB', 40, 380.00, 'FastStorage', '11999887766', 'Rua Velocidade, 88', '03030000'),

('Placa Mãe ASUS', 10, 750.00, 'InfoPlacas', '11991234567', 'Av. das Peças, 900', '04040000'),

('Fonte 500W', 30, 260.00, 'PowerTech', '11993456789', 'Rua Energia, 77', '05050000'),

('Processador i5', 8, 1250.00, 'CPU Brasil', '11994561234', 'Av. Intel, 123', '06060000'),

('Placa de Vídeo GTX1660', 5, 1800.00, 'GamerStore', '11995678901', 'Rua Gamer, 321', '07070000'),

('Teclado Mecânico', 50, 350.00, 'Periféricos SP', '11996789012', 'Av. dos Acessórios, 55', '08080000'),

('Mouse Óptico', 60, 120.00, 'Periféricos SP', '11996789012', 'Av. dos Acessórios, 55', '08080000'),

('Cooler para CPU', 22, 190.00, 'RefrigTech', '11997890123', 'Rua do Resfriamento, 9', '09090000');

--Fazendo consultas com o comando SELECT 
 SELECT * FROM pecascomputador;

SELECT fornecedor, telefone
FROM pecascomputador;

SELECT * FROM pecascomputador 
WHERE quant > 20;

SELECT * FROM pecascomputador 
WHERE quant > 20 
AND valor < 300.00;

SELECT * FROM pecascomputador 
WHERE nomepeca = 'Mouse Óptico' 
OR fornecedor = 'TechMemory';

SELECT * FROM pecascomputador 
WHERE fornecedor 
LIKE '%Tech%';

SELECT * FROM pecascomputador 
ORDER BY valor ASC;

SELECT * FROM pecascomputador 
RDER BY valor DESC;

SELECT * FROM pecascomputador 
LIMIT 4;

--Criando a segunda tabela
CREATE TABLE pedidocliente (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(50) NOT NULL,
    sobrenome VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL,
    telefone VARCHAR(20) NOT NULL,
    id_produto INT NOT NULL,
    FOREIGN KEY (id_produto) 
    REFERENCES pecascomputador (id_produto)
);

--Inserindo dados na segunda tabela
INSERT INTO pedidocliente (nome, sobrenome, email, telefone, id_produto) VALUES

('Ana', 'Silva', 'ana.silva@email.com', '11988887777', 1),

('Carlos', 'Souza', 'carlos.souza@email.com', '11999998888', 2),

('Mariana', 'Oliveira', 'mariana.oliveira@email.com', '11977776666', 3),

('João', 'Pereira', 'joao.pereira@email.com', '11966665555', 4),

('Fernanda', 'Costa', 'fernanda.costa@email.com', '11955554444', 5);


--Consultas com JOIN
SELECT*FROM pecascomputador p
INNER JOIN pedidocliente c 
ON p.id_produto = c.id_produto
WHERE c.nome ='Carlos';

SELECT p.nomepeca, p.valor, c.nome
FROM pecascomputador p
INNER JOIN pedidocliente c 
ON p.id_produto = c.id_produto
ORDER BY p.valor DESC;

--Criando usuários e atribuindo permissões para eles
CREATE USER 'usuario_conserto'@'localhost'
IDENTIFIED BY 'senha123'

GRANT SELECT ON consertodolele.*
TO'usuario_conserto'@'localhost';

REVOKE SELECT ON consertodolele.*
FROM'usuario_conserto'@'localhost';

DROP USER 'usuario_conserto'@'localhost';