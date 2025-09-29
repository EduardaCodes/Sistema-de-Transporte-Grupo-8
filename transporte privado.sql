-- Limpeza do esquema (ordem correta para não quebrar FKs)
DROP TABLE IF EXISTS Pagamento;
DROP TABLE IF EXISTS Participacao;
DROP TABLE IF EXISTS Segue;
DROP TABLE IF EXISTS Viagem;
DROP TABLE IF EXISTS Veiculo;
DROP TABLE IF EXISTS Passageiro;
DROP TABLE IF EXISTS Motorista;
DROP TABLE IF EXISTS Rota;

-- Tabela Motorista
CREATE TABLE Motorista (
    ID_Motorista INT PRIMARY KEY AUTO_INCREMENT,
    Nome VARCHAR(100) NOT NULL,
    CPF VARCHAR(11) NOT NULL UNIQUE,
    Telefone VARCHAR(15) -- poderia ser tabela auxiliar
) ENGINE=InnoDB;

-- Tabela Veiculo
CREATE TABLE Veiculo (
    ID_Veiculo INT PRIMARY KEY AUTO_INCREMENT,
    Placa VARCHAR(10) NOT NULL UNIQUE,
    Modelo VARCHAR(50) NOT NULL,
    Ano YEAR NOT NULL,
    Tipo VARCHAR(50),
    ID_Motorista INT NOT NULL,
    FOREIGN KEY (ID_Motorista) REFERENCES Motorista(ID_Motorista)
        ON DELETE CASCADE
) ENGINE=InnoDB;

-- Tabela Passageiro
CREATE TABLE Passageiro (
    ID_Passageiro INT PRIMARY KEY AUTO_INCREMENT,
    Nome VARCHAR(100) NOT NULL,
    CPF VARCHAR(11) NOT NULL UNIQUE,
    Telefone VARCHAR(15), -- poderia ser tabela auxiliar
    Email VARCHAR(100) UNIQUE
) ENGINE=InnoDB;

-- Tabela Rota
CREATE TABLE Rota (
    ID_Rota INT PRIMARY KEY AUTO_INCREMENT,
    Origem VARCHAR(100) NOT NULL,
    Destino VARCHAR(100) NOT NULL,
    Distancia DECIMAL(10,2) NOT NULL
) ENGINE=InnoDB;

-- Tabela Viagem
CREATE TABLE Viagem (
    ID_Viagem INT PRIMARY KEY AUTO_INCREMENT,
    Data_viagem DATE NOT NULL,
    Hora_saida TIME NOT NULL,
    Hora_chegada TIME,
    Status_viagem VARCHAR(50),
    ID_Veiculo INT NOT NULL,
    FOREIGN KEY (ID_Veiculo) REFERENCES Veiculo(ID_Veiculo)
        ON DELETE CASCADE
) ENGINE=InnoDB;

-- Tabela Segue (Viagem -> Rota) [1:N]
CREATE TABLE Segue (
    ID_Viagem INT NOT NULL,
    ID_Rota INT NOT NULL,
    PRIMARY KEY (ID_Viagem, ID_Rota),
    FOREIGN KEY (ID_Viagem) REFERENCES Viagem(ID_Viagem)
        ON DELETE CASCADE,
    FOREIGN KEY (ID_Rota) REFERENCES Rota(ID_Rota)
        ON DELETE CASCADE
) ENGINE=InnoDB;

-- Tabela Participacao (Passageiro <-> Viagem) [N:N]
CREATE TABLE Participacao (
    ID_Participacao INT PRIMARY KEY AUTO_INCREMENT,
    ID_Passageiro INT NOT NULL,
    ID_Viagem INT NOT NULL,
    Assento VARCHAR(10),
    UNIQUE(ID_Passageiro, ID_Viagem),
    FOREIGN KEY (ID_Passageiro) REFERENCES Passageiro(ID_Passageiro)
        ON DELETE CASCADE,
    FOREIGN KEY (ID_Viagem) REFERENCES Viagem(ID_Viagem)
        ON DELETE CASCADE
) ENGINE=InnoDB;

-- Tabela Pagamento (relaciona Passageiro e Viagem)
CREATE TABLE Pagamento (
    ID_Pagamento INT PRIMARY KEY AUTO_INCREMENT,
    Forma VARCHAR(50) NOT NULL,
    Data_pagamento DATE NOT NULL,
    Valor DECIMAL(10,2) NOT NULL,
    ID_Passageiro INT NOT NULL,
    ID_Viagem INT NOT NULL,
    FOREIGN KEY (ID_Passageiro) REFERENCES Passageiro(ID_Passageiro)
        ON DELETE CASCADE,
    FOREIGN KEY (ID_Viagem) REFERENCES Viagem(ID_Viagem)
        ON DELETE CASCADE
) ENGINE=InnoDB;
