-- 1) Atualizar o status de uma viagem que estava "Em andamento"
UPDATE Viagem
   SET Status_viagem = 'Concluída'
 WHERE ID_Viagem = 5;

-- 2) Ajustar um telefone preenchido errado (apenas exemplo)
UPDATE Passageiro
   SET telefone = '61998888-0999'
 WHERE ID_Passageiro = 2;

-- 3) Transação: aplicar um desconto retroativo em um pagamento
START TRANSACTION;
    -- histórico: nota fiscal cancelada, reemitida com desconto
    UPDATE Pagamento
       SET Valor = Valor - 5.00
     WHERE ID_Pagamento = 11;  -- o pagamento extra da Fernanda
    -- marcar a viagem 1 como "Revisada" (fluxo de auditoria interno)
    UPDATE Viagem
       SET Status_viagem = 'Revisada'
     WHERE ID_Viagem = 1;
COMMIT;

-- 4) Demonstração de integridade: este insert deve falhar (FK)
-- INSERT INTO Participacao (ID_Passageiro, ID_Viagem) VALUES (9999, 1);
-- Esperado: erro de chave estrangeira.