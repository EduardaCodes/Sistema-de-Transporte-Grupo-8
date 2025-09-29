# 📊 Evidências de Funcionamento – Consultas SQL  

As consultas foram executadas no **MySQL Workbench** sobre o banco `transporte_privado`.  
A seguir estão os resultados principais obtidos (saídas completas).  

---

## 🔹 Q1 – Viagens com motorista e veículo  

```sql
SELECT v.ID_Viagem, v.Data_viagem, v.Hora_saida, v.Hora_chegada, 
       v.Status_viagem, ve.Placa, ve.Modelo, m.Nome AS motorista
FROM Viagem v
JOIN Veiculo ve  ON v.ID_Veiculo = ve.ID_Veiculo
JOIN Motorista m ON ve.ID_Motorista = m.ID_Motorista
ORDER BY v.Data_viagem, v.ID_Viagem;
```

**Resultado:**  

| ID_Viagem | Data_viagem | Hora_saida | Hora_chegada | Status_viagem | Placa   | Modelo      | Motorista        |
|-----------|-------------|------------|--------------|---------------|---------|-------------|------------------|
| 1         | 2025-09-01  | 07:55:00   | 08:35:00     | Concluída     | RQA2D34 | Corolla GLi | Eduarda Alves    |
| 2         | 2025-09-01  | 09:10:00   | 09:35:00     | Concluída     | PKL8F12 | Onix LT     | David Cordeiro   |
| 3         | 2025-09-02  | 18:05:00   | 18:50:00     | Concluída     | JXY9877 | HB20S       | Guilherme Andrade|
| 4         | 2025-09-03  | 06:40:00   | 07:20:00     | Concluída     | BCA1H55 | Civic EX    | Ana Beatriz Alves|
| 5         | 2025-09-03  | 12:15:00   | 12:55:00     | Em andamento | TUESM90 | Toro        | Icaro de Oliveira|
| 6         | 2025-09-04  | 16:00:00   | 16:50:00     | Concluída     | GDF3P21 | Duster      | Camila Barros    |
| 7         | 2025-09-05  | 10:20:00   | 11:05:00     | Cancelada     | HZA7Q02 | Argo Trek   | Igor Mendonça    |
| 8         | 2025-09-06  | 19:10:00   | 19:45:00     | Concluída     | KVM4L61 | Renegade    | Valéria Coutinho |
| 9         | 2025-09-07  | 08:00:00   | 08:40:00     | Concluída     | NYB6C10 | Virtus      | Thiago Rezende   |
| 10        | 2025-09-08  | 14:30:00   | 15:10:00     | Concluída     | QZR0E88 | Spin        | Priscila Andrade |

---

## 🔹 Q4 – Total pago por passageiro  

```sql
SELECT p.ID_Passageiro, p.Nome,
       COALESCE(SUM(pg.Valor), 0) AS total_pago
FROM Passageiro p
LEFT JOIN Pagamento pg ON pg.ID_Passageiro = p.ID_Passageiro
GROUP BY p.ID_Passageiro, p.Nome
ORDER BY total_pago DESC, p.Nome;
```

**Resultado:**  

| ID_Passageiro | Nome             | total_pago |
|---------------|------------------|------------|
| 8             | Patrícia Ramos   | 60.00      |
| 4             | Juliana Rocha    | 52.00      |
| 2             | Fernanda Costa   | 44.90      |
| 3             | Rafael Lima      | 41.00      |
| 6             | Aline de Souza   | 38.70      |
| 9             | Carolina Pacheco | 33.40      |
| 1             | Lucas Martins    | 32.50      |
| 10            | Fábio Teixeira   | 28.60      |
| 7             | Henrique Prado   | 27.80      |
| 5             | Gabriel Alves    | 21.50      |

---

## 🔹 Q5 – Viagens por status  

```sql
SELECT v.Status_viagem, COUNT(*) AS qtd
FROM Viagem v
GROUP BY v.Status_viagem;
```

**Resultado:**  

| Status_viagem | qtd |
|---------------|-----|
| Concluída     | 8   |
| Em andamento  | 1   |
| Cancelada     | 1   |