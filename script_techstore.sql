-- Criar Base de Dados
CREATE DATABASE techstore;

USE techstore;

-- Criar tabela clientes
CREATE TABLE clientes(
	id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(50) NOT NULL,
    localidade VARCHAR(20),
    telefone VARCHAR(20)
);

-- Criar tabela produtos
CREATE TABLE produtos(
	id_produto INT AUTO_INCREMENT PRIMARY KEY,
    designacao VARCHAR(50) NOT NULL,
    preco FLOAT(5) NOT NULL
);

-- Criar tabela vendas
CREATE TABLE vendas(
	id_venda INT AUTO_INCREMENT PRIMARY KEY,
    data_venda DATE NOT NULL,
    id_cliente INT NOT NULL, -- tem de ser do mesmo tipo do da tabela clientes, senão ao fazer ligação ia dar erro
	FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente)
);

-- Criar tabela vendas linha
CREATE TABLE vendas_linha(
	id_linha_venda INT AUTO_INCREMENT PRIMARY KEY,
    id_venda INT NOT NULL,
    id_produto INT NOT NULL,
    quantidade INT,
    FOREIGN KEY (id_venda) REFERENCES vendas(id_venda),
    FOREIGN KEY (id_produto) REFERENCES produtos(id_produto)
);
