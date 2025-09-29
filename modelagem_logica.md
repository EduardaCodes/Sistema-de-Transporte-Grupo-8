# Modelagem Lógica

| Entidade      | Atributo        | Tipo Abstrato   | PK/FK | Restrição / Observação |
|---------------|-----------------|-----------------|-------|------------------------|
| Motorista     | id_motorista    | INT             | PK    | NOT NULL, AUTO_INCREMENT |
| Motorista     | nome            | VARCHAR(100)    |       | NOT NULL |
| Motorista     | cpf             | CHAR(11)        |       | NOT NULL, UNIQUE |
| Motorista     | telefone        | VARCHAR(15)     |       | Multivalorado → tabela auxiliar opcional |

| Veiculo       | id_veiculo      | INT             | PK    | NOT NULL, AUTO_INCREMENT |
| Veiculo       | placa           | CHAR(7)         |       | NOT NULL, UNIQUE |
| Veiculo       | modelo          | VARCHAR(50)     |       | NOT NULL |
| Veiculo       | ano             | YEAR            |       | NOT NULL |
| Veiculo       | tipo            | VARCHAR(30)     |       | NOT NULL |
| Veiculo       | id_motorista    | INT             | FK    | NOT NULL, FK → Motorista(id_motorista) |

| Passageiro    | id_passageiro   | INT             | PK    | NOT NULL, AUTO_INCREMENT |
| Passageiro    | nome            | VARCHAR(100)    |       | NOT NULL |
| Passageiro    | cpf             | CHAR(11)        |       | NOT NULL, UNIQUE |
| Passageiro    | telefone        | VARCHAR(15)     |       | Multivalorado → tabela auxiliar opcional |
| Passageiro    | email           | VARCHAR(100)    |       | NOT NULL, UNIQUE |

| Viagem        | id_viagem       | INT             | PK    | NOT NULL, AUTO_INCREMENT |
| Viagem        | data            | DATE            |       | NOT NULL |
| Viagem        | hora_saida      | TIME            |       | NOT NULL |
| Viagem        | hora_chegada    | TIME            |       | NULL |
| Viagem        | status          | VARCHAR(20)     |       | NOT NULL |
| Viagem        | id_veiculo      | INT             | FK    | NOT NULL, FK → Veiculo(id_veiculo) |
| Viagem        | id_rota         | INT             | FK    | NOT NULL, FK → Rota(id_rota) |

| Rota          | id_rota         | INT             | PK    | NOT NULL, AUTO_INCREMENT |
| Rota          | origem          | VARCHAR(100)    |       | NOT NULL |
| Rota          | destino         | VARCHAR(100)    |       | NOT NULL |
| Rota          | distancia       | DECIMAL(5,2)    |       | NOT NULL |

| Pagamento     | id_pagamento    | INT             | PK    | NOT NULL, AUTO_INCREMENT |
| Pagamento     | forma           | VARCHAR(20)     |       | NOT NULL |
| Pagamento     | data            | DATE            |       | NOT NULL |
| Pagamento     | valor           | DECIMAL(10,2)   |       | NOT NULL |
| Pagamento     | id_passageiro   | INT             | FK    | NOT NULL, FK → Passageiro(id_passageiro) |
| Pagamento     | id_viagem       | INT             | FK    | NOT NULL, FK → Viagem(id_viagem) |

| Participacao  | id_participacao | INT             | PK    | NOT NULL, AUTO_INCREMENT |
| Participacao  | id_passageiro   | INT             | FK    | NOT NULL, FK → Passageiro(id_passageiro) |
| Participacao  | id_viagem       | INT             | FK    | NOT NULL, FK → Viagem(id_viagem) |
| Participacao  | assento         | VARCHAR(5)      |       | NOT NULL |
|               | (restrição)     |                 |       | UNIQUE(id_passageiro, id_viagem) |
