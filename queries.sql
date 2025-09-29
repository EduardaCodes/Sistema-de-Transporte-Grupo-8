
-- Consultas organizadas por "pergunta de negócio".

/* Q1) Como recuperar a lista de viagens com motorista e veículo? */
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

/* Q2) Quem estava na viagem X? (Ex.: 1) */
SELECT v.ID_Viagem,
       p.ID_Passageiro,
       p.nome AS passageiro
FROM Participacao pa
JOIN Passageiro p ON p.ID_Passageiro = pa.ID_Passageiro
JOIN Viagem v     ON v.ID_Viagem = pa.ID_Viagem
WHERE v.ID_Viagem = 1
ORDER BY p.nome;

/* Q3) Quais rotas são mais usadas? (Top 5) */
SELECT r.origem, r.destino, COUNT(*) AS vezes
FROM Segue s
JOIN Rota r ON r.ID_Rota = s.ID_Rota
GROUP BY r.origem, r.destino
ORDER BY vezes DESC, r.origem, r.destino
LIMIT 5;

/* Q4) Quanto cada passageiro já pagou? (com zero para quem não pagou) */
SELECT p.ID_Passageiro, p.nome,
       COALESCE(SUM(pg.Valor), 0) AS total_pago
FROM Passageiro p
LEFT JOIN Pagamento pg ON pg.ID_Passageiro = p.ID_Passageiro
GROUP BY p.ID_Passageiro, p.nome
ORDER BY total_pago DESC, p.nome;

/* Q5) Distribuição de viagens por status */
SELECT Status_viagem, COUNT(*) AS qtd
FROM Viagem
GROUP BY Status_viagem
ORDER BY qtd DESC;

/* Q6) Passageiros que gastaram acima da média */
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

/* Q7) View prática para relatórios rápidos */
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

-- Teste rápido da view:
SELECT * FROM vw_viagens_completas ORDER BY data_viagem, ID_Viagem;

/* Q8) Motorista com mais viagens no período */
SELECT motorista, COUNT(*) AS viagens
FROM vw_viagens_completas
GROUP BY motorista
ORDER BY viagens DESC, motorista;
