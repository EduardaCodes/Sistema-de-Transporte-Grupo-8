# Modelagem Física - Sistema de Transporte Privado

Este documento descreve a modelagem física do banco de dados, implementada em **MySQL (InnoDB)**, incluindo tabelas, colunas, tipos de dados e restrições de integridade.  

---

## 1. Motorista
| Coluna       | Tipo        | Restrições               |
|--------------|------------|--------------------------|
| ID_Motorista | INT        | PK, AUTO_INCREMENT       |
| Nome         | VARCHAR(100) | NOT NULL               |
| CPF          | CHAR(11)   | NOT NULL, UNIQUE         |
| Telefone     | VARCHAR(15) | NULL                    |

**Justificativas**:  
- `CPF` é único para cada motorista.  
- `Telefone` foi mantido como atributo simples (poderia ser uma tabela auxiliar em caso de múltiplos telefones).  

---

## 2. Veiculo
| Coluna      | Tipo         | Restrições                                |
|-------------|-------------|-------------------------------------------|
| ID_Veiculo  | INT         | PK, AUTO_INCREMENT                        |
| Placa       | CHAR(7)     | NOT NULL, UNIQUE                          |
| Modelo      | VARCHAR(50) | NOT NULL                                  |
| Ano         | YEAR        | NOT NULL                                  |
| Tipo        | VARCHAR(30) | NULL                                      |
| ID_Motorista| INT         | FK → Motorista(ID_Motorista), NOT NULL    |

**Justificativas**:  
- Cada veículo pertence a um único motorista.  
- `Placa` é única e funciona como identificador no mundo real, mas foi usada chave substituta `ID_Veiculo` para normalização.  

---

## 3. Passageiro
| Coluna       | Tipo         | Restrições                              |
|--------------|-------------|-----------------------------------------|
| ID_Passageiro| INT         | PK, AUTO_INCREMENT                      |
| Nome         | VARCHAR(100)| NOT NULL                                |
| CPF          | CHAR(11)    | NOT NULL, UNIQUE                        |
| Telefone     | VARCHAR(15) | NULL                                    |
| Email        | VARCHAR(100)| UNIQUE                                  |

**Justificativas**:  
- `CPF` garante unicidade.  
- `Email` é opcional, mas único.  

---

## 4. Rota
| Coluna   | Tipo          | Restrições |
|----------|--------------|-------------|
| ID_Rota  | INT          | PK, AUTO_INCREMENT |
| Origem   | VARCHAR(100) | NOT NULL    |
| Destino  | VARCHAR(100) | NOT NULL    |
| Distancia| DECIMAL(10,2)| NOT NULL    |

**Justificativas**:  
- Distância armazenada em quilômetros com 2 casas decimais.  

---

## 5. Viagem
| Coluna       | Tipo       | Restrições                              |
|--------------|-----------|-----------------------------------------|
| ID_Viagem    | INT       | PK, AUTO_INCREMENT                      |
| Data_viagem  | DATE      | NOT NULL                                |
| Hora_saida   | TIME      | NOT NULL                                |
| Hora_chegada | TIME      | NULL                                    |
| Status_viagem| VARCHAR(50)| NULL                                   |
| ID_Veiculo   | INT       | FK → Veiculo(ID_Veiculo), NOT NULL      |

**Justificativas**:  
- Viagem sempre associada a um veículo.  
- Status pode assumir valores como “Concluída”, “Em andamento” ou “Cancelada”.  

---

## 6. Segue (Viagem ↔ Rota)
| Coluna    | Tipo | Restrições                           |
|-----------|------|--------------------------------------|
| ID_Viagem | INT  | PK, FK → Viagem(ID_Viagem), NOT NULL |
| ID_Rota   | INT  | PK, FK → Rota(ID_Rota), NOT NULL     |

**Justificativas**:  
- Resolve o relacionamento 1:N entre Viagem e Rota.  
- PK composta (ID_Viagem, ID_Rota).  

---

## 7. Participacao (Passageiro ↔ Viagem)
| Coluna        | Tipo       | Restrições                                   |
|---------------|-----------|----------------------------------------------|
| ID_Participacao| INT      | PK, AUTO_INCREMENT                           |
| ID_Passageiro | INT       | FK → Passageiro(ID_Passageiro), NOT NULL     |
| ID_Viagem     | INT       | FK → Viagem(ID_Viagem), NOT NULL             |
| Assento       | VARCHAR(10)| NULL                                        |

**Justificativas**:  
- Resolve relacionamento N:N entre Passageiro e Viagem.  
- Restrição UNIQUE em (ID_Passageiro, ID_Viagem) evita duplicidade.  

---

## 8. Pagamento
| Coluna        | Tipo        | Restrições                                      |
|---------------|------------|-------------------------------------------------|
| ID_Pagamento  | INT        | PK, AUTO_INCREMENT                              |
| Forma         | VARCHAR(50)| NOT NULL                                        |
| Data_pagamento| DATE       | NOT NULL                                        |
| Valor         | DECIMAL(10,2)| NOT NULL                                      |
| ID_Passageiro | INT        | FK → Passageiro(ID_Passageiro), NOT NULL        |
| ID_Viagem     | INT        | FK → Viagem(ID_Viagem), NOT NULL                |

**Justificativas**:  
- Pagamento sempre vinculado a um Passageiro e a uma Viagem.  
- Valor armazenado com 2 casas decimais.  

---

# 📌 Normalização
- Todas as tabelas estão em **3FN**:  
  - Atributos multivalorados (telefone) foram simplificados.  
  - Chaves substitutas (`ID_*`) usadas para garantir unicidade.  
  - Nenhuma dependência transitiva.  

# 📌 Observações Técnicas
- **Engine**: InnoDB (suporte a integridade referencial).  
- **Collation**: `utf8mb4_general_ci` (para compatibilidade com caracteres acentuados).  
- **Índices**: gerados automaticamente em PKs e UNIQUE.  
