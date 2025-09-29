/* MOTORISTAS*/
INSERT INTO Motorista (nome, CPF, telefone) VALUES
('Eduarda Alves',        '02784591032', '6199201-0001'),
('David Cordeiro',     '14927583041', '6199201-0002'),
('Guilherme Andrade',      '21356974058', '6199201-0003'),
('Ana Beatriz Alves',       '34098152746', '6199201-0004'),
('Icaro de Oliveira',         '45207981630', '6199201-0005'),
('Camila Barros',          '59861274013', '6199201-0006'),
('Igor Mendonça',          '60721438950', '6199201-0007'),
('Valéria Coutinho',       '71894026531', '6199201-0008'),
('Thiago Rezende',         '80912647530', '6199201-0009'),
('Priscila Andrade',       '93570281461', '6199201-0010');

/* VEÍCULOS(PK = Placa; FK para Motorista)*/
INSERT INTO Veiculo (Placa, Modelo, Ano, Tipo, ID_Motorista) VALUES
('RQA2D34', 'Corolla GLi', 2020, 'Sedan', 1),
('PKL8F12', 'Onix LT',     2021, 'Hatch', 2),
('JXY9B77', 'HB20S',       2019, 'Sedan', 3),
('BCA1H55', 'Civic EX',    2018, 'Sedan', 4),
('TUE5M90', 'Toro',        2022, 'SUV',   5),
('GDF3P21', 'Duster',      2017, 'SUV',   6),
('HZA7Q02', 'Argo Trek',   2023, 'Hatch', 7),
('KVM4L61', 'Renegade',    2020, 'SUV',   8),
('NYB6C10', 'Virtus',      2021, 'Sedan', 9),
('QZR0E88', 'Spin',        2019, 'Minivan',10);

/* PASSAGEIROS*/
INSERT INTO Passageiro (nome, CPF, telefone, Email) VALUES
('Lucas Martins',     '11122233344', '61998888-0001', 'lucas.martins@exemplo.com'),
('Fernanda Costa',    '22233344455', '61998888-0002', 'fernanda.costa@exemplo.com'),
('Rafael Lima',       '33344455566', '61998888-0003', 'rafa.lima@exemplo.com'),
('Juliana Rocha',     '44455566677', '61998888-0004', 'ju.rocha@exemplo.com'),
('Gabriel Alves',     '55566677788', '61998888-0005', 'gabriel.alves@exemplo.com'),
('Aline de Souza',    '66677788899', '61998888-0006', 'aline.souza@exemplo.com'),
('Henrique Prado',    '77788899900', '61998888-0007', 'henrique.prado@exemplo.com'),
('Patrícia Ramos',    '88899900011', '61998888-0008', 'patricia.ramos@exemplo.com'),
('Carolina Pacheco',  '99900011122', '61998888-0009', 'carol.pacheco@exemplo.com'),
('Fábio Teixeira',    '00011122233', '61998888-0010', 'fabio.tx@exemplo.com');

/* =====================
   4) ROTAS
   ===================== */
INSERT INTO Rota (Origem, Destino, Distancia) VALUES
('Taguatinga', 'Plano Piloto',   23.4),
('Águas Claras','Guará',         11.9),
('Ceilândia',  'Samambaia',      14.7),
('Sobradinho', 'Plano Piloto',   35.2),
('Gama',       'Asa Sul',        31.6),
('Lago Sul',   'Asa Norte',      17.1),
('Vicente Pires','Taguatinga',    8.5),
('Cruzeiro',   'Sudoeste',        6.2);

INSERT INTO Viagem (data_viagem, Hora_saida, Hora_chegada, Status_viagem, ID_Veiculo) VALUES
('2025-09-01', '07:55:00', '08:35:00', 'Concluída',   1),
('2025-09-01', '09:10:00', '09:35:00', 'Concluída',   2),
('2025-09-02', '18:05:00', '18:50:00', 'Concluída',   3),
('2025-09-03', '06:40:00', '07:20:00', 'Concluída',   4),
('2025-09-03', '12:15:00', '12:55:00', 'Em andamento',5),
('2025-09-04', '16:00:00', '16:50:00', 'Concluída',   6),
('2025-09-05', '10:20:00', '11:05:00', 'Cancelada',   7),
('2025-09-06', '19:10:00', '19:45:00', 'Concluída',   8),
('2025-09-07', '08:00:00', '08:40:00', 'Concluída',   9),
('2025-09-08', '14:30:00', '15:10:00', 'Concluída',   10);

/* LIGAÇÃO VIAGEM → ROTA (SEGUE)*/
INSERT INTO Segue (ID_Viagem, ID_Rota) VALUES
(1,1),(2,2),(3,3),(4,4),(5,5),(6,6),(7,7),(8,8),(9,2),(10,1);

/*PARTICIPAÇÕES (PASSAGEIROS NAS VIAGENS)*/
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

/*PAGAMENTOS*/
INSERT INTO Pagamento (Forma, Data_pagamento, Valor, ID_Passageiro, ID_Viagem) VALUES
('Pix',     '2025-09-01',  32.50, 1, 1),
('Cartão',  '2025-09-01',  29.90, 2, 1),
('Dinheiro','2025-09-02',  41.00, 3, 2),
('Pix',     '2025-09-03',  52.00, 4, 3),
('Cartão',  '2025-09-03',  21.50, 5, 3),
('Cartão',  '2025-09-04',  38.70, 6, 4),
('Pix',     '2025-09-05',  27.80, 7, 5),
('Dinheiro','2025-09-06',  60.00, 8, 6),
('Pix',     '2025-09-07',  33.40, 9, 7),
('Cartão',  '2025-09-08',  28.60,10, 8),
('Pix',     '2025-09-08',  15.00, 2, 8);