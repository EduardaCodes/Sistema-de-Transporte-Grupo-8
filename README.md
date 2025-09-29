# 🚖 Projeto Banco de Dados – Transporte Privado  

## 📌 Descrição  
Este projeto foi desenvolvido na disciplina de **Banco de Dados** e tem como objetivo a criação de um sistema de **Transporte Privado**, contemplando todas as etapas de modelagem:  
- **Modelagem Conceitual (DER)**  
- **Modelagem Lógica**  
- **Modelagem Física**  
- **Implementação em MySQL**  

O trabalho cobre desde o desenho inicial das entidades e relacionamentos até a implementação do banco de dados com scripts de criação, inserção de dados, consultas e evidências de funcionamento.  

---

## 📂 Estrutura do Repositório  

```

.
├── DiagramaLogico.png                  # Diagrama lógico (tabelas e relacionamentos)
├── modelagem_logica.md                 # Documento explicativo da modelagem lógica
├── modelo lógico-forma textual.pdf     # Modelo lógico em formato textual
├── DiagramaFisico.png                  # Diagrama físico exportado do Workbench
├── ModeloFisico.md                     # Documento explicativo da modelagem física
├── transporte_privado.sql              # Script principal de criação das tabelas
├── insert_data.sql                     # Script de inserção de dados (população)
├── queries.sql                         # Consultas SQL (SELECTs de teste)
├── update_examples.sql                 # Exemplos de atualização (UPDATEs)
├── query_outputs.md                    # Evidências dos resultados das consultas
└── Grupo 8 - Modelagem e Implementação de Banco de Dados.pdf  # Documento final consolidado

````

---

## 🛠️ Tecnologias Utilizadas  
- **MySQL** – Sistema Gerenciador de Banco de Dados  
- **MySQL Workbench** – Criação dos diagramas lógico e físico  
- **Markdown / PDF** – Documentação  
- **GitHub** – Controle de versão e integração  

---

## ▶️ Instruções de Execução  

1. Criar o banco de dados:  
   ```sql
   CREATE DATABASE transporte_privado;
   USE transporte_privado;
    ```

2. Executar o script de criação das tabelas:

   ```sql
   SOURCE transporte_privado.sql;
   ```

3. Inserir os dados de exemplo:

   ```sql
   SOURCE insert_data.sql;
   ```

4. Executar consultas de teste:

   ```sql
   SOURCE queries.sql;
   ```

5. Rodar exemplos de atualização:

   ```sql
   SOURCE update_examples.sql;
   ```

6. Conferir os resultados:

   * Arquivo `query_outputs.md` contém as principais evidências.

---

## 🧾 Evidências de Funcionamento  

As evidências das consultas e atualizações realizadas estão disponíveis no arquivo:  

- [`query_outputs.md`](query_outputs.md) – contém os resultados (logs) das consultas e atualizações executadas no MySQL.  

---

## 👥 Equipe – Grupo 8

* Ana Beatriz Alves
* David Cordeiro
* Eduarda Alves
* Guilherme Andrade
* Icaro de Oliveira

---

## 📑 Entregáveis

* Documento final em PDF contendo os três diagramas, explicações e link para este repositório.
* Scripts SQL organizados em um único repositório.
* Evidências de execução das consultas.
