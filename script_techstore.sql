-- Criar Base de Dados
CREATE DATABASE IF NOT EXISTS techstore;

USE techstore;

-- Criar tabela clientes
CREATE TABLE IF NOT EXISTS clientes (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(50) NOT NULL,
    localidade VARCHAR(20),
    telefone VARCHAR(20)
);

-- Criar tabela produtos
CREATE TABLE IF NOT EXISTS produtos (
    id_produto INT AUTO_INCREMENT PRIMARY KEY,
    designacao VARCHAR(50) NOT NULL,
    preco FLOAT(5) NOT NULL
);

-- Criar tabela vendas
CREATE TABLE IF NOT EXISTS vendas (
    id_venda INT AUTO_INCREMENT PRIMARY KEY,
    data_venda DATE NOT NULL,
    id_cliente INT NOT NULL,
    CONSTRAINT fk_vendas_clientes
        FOREIGN KEY (id_cliente)
        REFERENCES clientes(id_cliente)
);

-- Criar tabela vendas_linha
CREATE TABLE IF NOT EXISTS vendas_linha (
    id_linha_venda INT AUTO_INCREMENT PRIMARY KEY,
    id_venda INT NOT NULL,
    id_produto INT NOT NULL,
    quantidade INT,
    CONSTRAINT fk_linha_venda
        FOREIGN KEY (id_venda)
        REFERENCES vendas(id_venda),
    CONSTRAINT fk_linha_produto
        FOREIGN KEY (id_produto)
        REFERENCES produtos(id_produto)
);
