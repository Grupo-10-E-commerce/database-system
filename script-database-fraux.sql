CREATE DATABASE Fraux;
use Fraux;

CREATE TABLE cargo (
    id_cargo INT NOT NULL AUTO_INCREMENT,
    nome VARCHAR(45) NOT NULL,
    descricao VARCHAR(255),
    PRIMARY KEY (id_cargo)
);

CREATE TABLE empresa (
    id_empresa INT NOT NULL AUTO_INCREMENT,
    razao_social VARCHAR(100) NOT NULL,
    cnpj CHAR(14) NOT NULL,
    codigo VARCHAR(45) NOT NULL,
    PRIMARY KEY (id_empresa)
);

CREATE TABLE usuario (
    id_usuario INT NOT NULL AUTO_INCREMENT,
    nome VARCHAR(30) NOT NULL,
    sobrenome VARCHAR(45) NOT NULL,
    email VARCHAR(45) NOT NULL,
    senha VARCHAR(45) NOT NULL,
    id_empresa INT NOT NULL,
    id_cargo INT NOT NULL,
    PRIMARY KEY (id_usuario),
    FOREIGN KEY (id_empresa) REFERENCES empresa(id_empresa),
    FOREIGN KEY (id_cargo) REFERENCES cargo(id_cargo)
);

CREATE TABLE avaliacao (
    id_avaliacao INT NOT NULL AUTO_INCREMENT,
    id_usuario INT NOT NULL,
    nota INT NOT NULL,
    descricao VARCHAR(500),
    PRIMARY KEY (id_avaliacao),
    FOREIGN KEY (id_usuario) REFERENCES usuario(id_usuario)
);

CREATE TABLE log (
    id_log INT NOT NULL AUTO_INCREMENT,
    data_hora DATETIME NOT NULL,
    texto TEXT,
    nivel_severidade VARCHAR(45),
    id_empresa INT NOT NULL,
    PRIMARY KEY (id_log),
    FOREIGN KEY (id_empresa) REFERENCES empresa(id_empresa)
);

CREATE TABLE compra (
    id_compra INT NOT NULL AUTO_INCREMENT,
    id_empresa INT NOT NULL,
    id_comprador INT NOT NULL,
    data_hora_transacao DATETIME NOT NULL,
    valor_transacao DECIMAL(7,2) NOT NULL,
    metodo_pagamento VARCHAR(45) NOT NULL,
    cidade VARCHAR(45),
    tipo_transacao VARCHAR(45) NOT NULL,
    transacao_id VARCHAR(45),
    fraude TINYINT NOT NULL,
    PRIMARY KEY (id_compra),
    FOREIGN KEY (id_empresa) REFERENCES empresa(id_empresa)
);

CREATE TABLE alerta_fraude (
    id_alerta_fraude INT NOT NULL AUTO_INCREMENT,
    data_hora_alerta DATETIME NOT NULL,
    id_compra INT NOT NULL,
    PRIMARY KEY (id_alerta_fraude),
    FOREIGN KEY (id_compra) REFERENCES compra(id_compra)
);

CREATE TABLE alerta_personalizado (
    id_alerta_personalizado INT NOT NULL AUTO_INCREMENT,
    id_usuario INT NOT NULL,
    data_hora_transacao DATETIME NOT NULL,
    valor_transacao DECIMAL(10,2) NOT NULL,
    metodo_pagamento VARCHAR(45) NOT NULL,
    cidade VARCHAR(100),
    PRIMARY KEY (id_alerta_personalizado),
    FOREIGN KEY (id_usuario) REFERENCES usuario(id_usuario)
);