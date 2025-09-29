/* ============================================================
   LIMPEZA DO ESQUEMA
   ============================================================ */
DROP TABLE IF EXISTS Pagamento;
DROP TABLE IF EXISTS Participacao;
DROP TABLE IF EXISTS Segue;
DROP TABLE IF EXISTS Viagem;
DROP TABLE IF EXISTS Veiculo;
DROP TABLE IF EXISTS Passageiro;
DROP TABLE IF EXISTS Motorista;
DROP TABLE IF EXISTS Rota;

/* ============================================================
   CRIAÇÃO DAS TABELAS
   ============================================================ */
-- Motoristas
CREATE TABLE Motorista (
    ID_Motorista INT PRIMARY KEY AUTO_INCREMENT,
    Nome VARCHAR(100) NOT NULL,
    CPF VARCHAR(11) NOT NULL UNIQUE,
    Telefone VARCHAR(15)
) ENGINE=InnoDB;

-- Veículos (PK = Placa; FK para Motorista)
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

-- Passageiros
CREATE TABLE Passageiro (
    ID_Passageiro INT PRIMARY KEY AUTO_INCREMENT,
    Nome VARCHAR(100) NOT NULL,
    CPF VARCHAR(11) NOT NULL UNIQUE,
    Telefone VARCHAR(15),
    Email VARCHAR(100) UNIQUE
) ENGINE=InnoDB;

-- Rotas
CREATE TABLE Rota (
    ID_Rota INT PRIMARY KEY AUTO_INCREMENT,
    Origem VARCHAR(100) NOT NULL,
    Destino VARCHAR(100) NOT NULL,
    Distancia DECIMAL(10,2) NOT NULL
) ENGINE=InnoDB;

-- Viagens
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

-- Relação Viagem → Rota
CREATE TABLE Segue (
    ID_Viagem INT NOT NULL,
    ID_Rota INT NOT NULL,
    PRIMARY KEY (ID_Viagem, ID_Rota),
    FOREIGN KEY (ID_Viagem) REFERENCES Viagem(ID_Viagem)
        ON DELETE CASCADE,
    FOREIGN KEY (ID_Rota) REFERENCES Rota(ID_Rota)
        ON DELETE CASCADE
) ENGINE=InnoDB;

-- Participações (Passageiros nas Viagens)
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

-- Pagamentos
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

/* ============================================================
   INSERÇÃO DE DADOS
   ============================================================ */
-- Motoristas
INSERT INTO Motorista (nome, CPF, telefone) VALUES
('Eduarda Alves', '02784591032', '6199201-0001'),
('David Cordeiro', '14927583041', '6199201-0002'),
('Guilherme Andrade', '21356974058', '6199201-0003'),
('Ana Beatriz Alves', '34098152746', '6199201-0004'),
('Icaro de Oliveira', '45207981630', '6199201-0005'),
('Camila Barros', '59861274013', '6199201-0006'),
('Igor Mendonça', '60721438950', '6199201-0007'),
('Valéria Coutinho', '71894026531', '6199201-0008'),
('Thiago Rezende', '80912647530', '6199201-0009'),
('Priscila Andrade', '93570281461', '6199201-0010');

-- Veículos
INSERT INTO Veiculo (Placa, Modelo, Ano, Tipo, ID_Motorista) VALUES
('RQA2D34', 'Corolla GLi', 2020, 'Sedan', 1),
('PKL8F12', 'Onix LT', 2021, 'Hatch', 2),
('JXY9B77', 'HB20S', 2019, 'Sedan', 3),
('BCA1H55', 'Civic EX', 2018, 'Sedan', 4),
('TUE5M90', 'Toro', 2022, 'SUV', 5),
('GDF3P21', 'Duster', 2017, 'SUV', 6),
('HZA7Q02', 'Argo Trek', 2023, 'Hatch', 7),
('KVM4L61', 'Renegade', 2020, 'SUV', 8),
('NYB6C10', 'Virtus', 2021, 'Sedan', 9),
('QZR0E88', 'Spin', 2019, 'Minivan',10);

-- Passageiros
INSERT INTO Passageiro (nome, CPF, telefone, Email) VALUES
('Lucas Martins', '11122233344', '61998888-0001', 'lucas.martins@exemplo.com'),
('Fernanda Costa', '22233344455', '61998888-0002', 'fernanda.costa@exemplo.com'),
('Rafael Lima', '33344455566', '61998888-0003', 'rafa.lima@exemplo.com'),
('Juliana Rocha', '44455566677', '61998888-0004', 'ju.rocha@exemplo.com'),
('Gabriel Alves', '55566677788', '61998888-0005', 'gabriel.alves@exemplo.com'),
('Aline de Souza', '66677788899', '61998888-0006', 'aline.souza@exemplo.com'),
('Henrique Prado', '77788899900', '61998888-0007', 'henrique.prado@exemplo.com'),
('Patrícia Ramos', '88899900011', '61998888-0008', 'patricia.ramos@exemplo.com'),
('Carolina Pacheco', '99900011122', '61998888-0009', 'carol.pacheco@exemplo.com'),
('Fábio Teixeira', '00011122233', '61998888-0010', 'fabio.tx@exemplo.com');

-- Rotas
INSERT INTO Rota (Origem, Destino, Distancia) VALUES
('Taguatinga', 'Plano Piloto', 23.4),
('Águas Claras','Guará', 11.9),
('Ceilândia', 'Samambaia', 14.7),
('Sobradinho', 'Plano Piloto', 35.2),
('Gama', 'Asa Sul', 31.6),
('Lago Sul', 'Asa Norte', 17.1),
('Vicente Pires','Taguatinga', 8.5),
('Cruzeiro','Sudoeste', 6.2);

-- Viagens
INSERT INTO Viagem (data_viagem, Hora_saida, Hora_chegada, Status_viagem, ID_Veiculo) VALUES
('2025-09-01', '07:55:00', '08:35:00', 'Concluída', 1),
('2025-09-01', '09:10:00', '09:35:00', 'Concluída', 2),
('2025-09-02', '18:05:00', '18:50:00', 'Concluída', 3),
('2025-09-03', '06:40:00', '07:20:00', 'Concluída', 4),
('2025-09-03', '12:15:00', '12:55:00', 'Em andamento', 5),
('2025-09-04', '16:00:00', '16:50:00', 'Concluída', 6),
('2025-09-05', '10:20:00', '11:05:00', 'Cancelada', 7),
('2025-09-06', '19:10:00', '19:45:00', 'Concluída', 8),
('2025-09-07', '08:00:00', '08:40:00', 'Concluída', 9),
('2025-09-08', '14:30:00', '15:10:00', 'Concluída', 10);

-- Segue (Viagem → Rota)
INSERT INTO Segue (ID_Viagem, ID_Rota) VALUES
(1,1),(2,2),(3,3),(4,4),(5,5),(6,6),(7,7),(8,8),(9,2),(10,1);

-- Participações
INSERT INTO Participacao (ID_Passageiro, ID_Viagem) VALUES
(1,1),(2,1),
(3,2),
(4,3),
(5,4),(6,4),
(7,5),
(8,6),
(9,8),
(10,9),
(2,10);

-- Pagamentos
INSERT INTO Pagamento (Forma, Data_pagamento, Valor, ID_Passageiro, ID_Viagem) VALUES
('Pix', '2025-09-01', 32.50, 1, 1),
('Cartão', '2025-09-01', 29.90, 2, 1),
('Dinheiro', '2025-09-02', 41.00, 3, 2),
('Pix', '2025-09-03', 52.00, 4, 3),
('Cartão', '2025-09-03', 21.50, 5, 3),
('Cartão', '2025-09-04', 38.70, 6, 4),
('Pix', '2025-09-05', 27.80, 7, 5),
('Dinheiro','2025-09-06', 60.00, 8, 6),
('Pix', '2025-09-07', 33.40, 9, 7),
('Cartão', '2025-09-08', 28.60, 10, 8),
('Pix', '2025-09-08', 15.00, 2, 8);

/* ============================================================
   CONSULTAS (PERGUNTAS DE NEGÓCIO)
   ============================================================ */
-- Q1) Lista de viagens com motorista e veículo
SELECT v.ID_Viagem,
       DATE_FORMAT(v.Data_viagem, '%d/%m/%Y') AS data,
       v.Status_viagem,
       m.Nome AS motorista,
       ve.Modelo AS modelo,
       ve.Placa AS placa
FROM Viagem v
JOIN Veiculo ve  ON v.ID_Veiculo = ve.ID_Veiculo
JOIN Motorista m ON ve.ID_Motorista = m.ID_Motorista
ORDER BY v.Data_viagem, v.ID_Viagem;

-- Q2) Quem estava na viagem X? (Ex.: 1)
SELECT v.ID_Viagem,
       p.ID_Passageiro,
       p.nome AS passageiro
FROM Participacao pa
JOIN Passageiro p ON p.ID_Passageiro = pa.ID_Passageiro
JOIN Viagem v     ON v.ID_Viagem = pa.ID_Viagem
WHERE v.ID_Viagem = 1
ORDER BY p.nome;

-- Q3) Quais rotas são mais usadas? (Top 5)
SELECT r.origem, r.destino, COUNT(*) AS vezes
FROM Segue s
JOIN Rota r ON r.ID_Rota = s.ID_Rota
GROUP BY r.origem, r.destino
ORDER BY vezes DESC, r.origem, r.destino
LIMIT 5;

-- Q4) Quanto cada passageiro já pagou? (com zero para quem não pagou)
SELECT p.ID_Passageiro, p.nome,
       COALESCE(SUM(pg.Valor), 0) AS total_pago
FROM Passageiro p
LEFT JOIN Pagamento pg ON pg.ID_Passageiro = p.ID_Passageiro
GROUP BY p.ID_Passageiro, p.nome
ORDER BY total_pago DESC, p.nome;

-- Q5) Distribuição de viagens por status
SELECT Status_viagem, COUNT(*) AS qtd
FROM Viagem
GROUP BY Status_viagem
ORDER BY qtd DESC;

-- Q6) Passageiros que gastaram acima da média
WITH gastos AS (
  SELECT ID_Passageiro, SUM(Valor) AS total FROM Pagamento GROUP BY ID_Passageiro
),
media AS (
  SELECT AVG(total) AS media_gastos FROM gastos
)
SELECT p.nome, g.total, ROUND(m.media_gastos,2) AS media_geral
FROM gastos g
CROSS JOIN media m
JOIN Passageiro p ON p.ID_Passageiro = g.ID_Passageiro
WHERE g.total > m.media_gastos
ORDER BY g.total DESC;

-- Q7) View prática para relatórios rápidos
CREATE OR REPLACE VIEW vw_viagens_completas AS
SELECT v.ID_Viagem, 
       v.Data_viagem, 
       v.Hora_saida, 
       v.Hora_chegada, 
       v.Status_viagem,
       ve.Placa, 
       ve.Modelo, 
       m.Nome AS motorista
FROM Viagem v
JOIN Veiculo ve  ON v.ID_Veiculo = ve.ID_Veiculo
JOIN Motorista m ON m.ID_Motorista = ve.ID_Motorista;

-- Teste rápido da view
SELECT * FROM vw_viagens_completas ORDER BY data_viagem, ID_Viagem;

-- Q8) Motorista com mais viagens no período
SELECT motorista, COUNT(*) AS viagens
FROM vw_viagens_completas
GROUP BY motorista
ORDER BY viagens DESC, motorista;

/* ============================================================
   EXEMPLOS DE UPDATES / TRANSAÇÕES
   ============================================================ */
-- 1) Atualizar status de viagem que estava "Em andamento"
UPDATE Viagem
   SET Status_viagem = 'Concluída'
 WHERE ID_Viagem = 5;

-- 2) Ajustar telefone preenchido errado
UPDATE Passageiro
   SET telefone = '61998888-0999'
 WHERE ID_Passageiro = 2;

-- 3) Transação: aplicar desconto retroativo em um pagamento
START TRANSACTION;
    -- Nota fiscal cancelada, reemitida com desconto
    UPDATE Pagamento
       SET Valor = Valor - 5.00
     WHERE ID_Pagamento = 11;
    -- Marcar viagem 1 como "Revisada"
    UPDATE Viagem
       SET Status_viagem = 'Revisada'
     WHERE ID_Viagem = 1;
COMMIT;

-- 4) Demonstração de integridade (deve falhar por FK)
-- INSERT INTO Participacao (ID_Passageiro, ID_Viagem) VALUES (9999, 1);
