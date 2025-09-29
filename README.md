# 🚖 Projeto Banco de Dados – Transporte Privado  

## 📌 Descrição  
Este projeto foi desenvolvido na disciplina de **Laboratório de Banco de Dados** e tem como objetivo a criação de um sistema de **Transporte Privado**, contemplando todas as etapas de modelagem:  
- **Modelagem Conceitual (DER)**  
- **Modelagem Lógica**  
- **Modelagem Física**  
- **Implementação em MySQL**  

O trabalho cobre desde o desenho inicial das entidades e relacionamentos até a implementação completa do banco de dados, com scripts de criação, inserção de dados, consultas e evidências de funcionamento.  

---

## 📂 Estrutura do Repositório  

````
.
├── DiagramaLogico.png                  # Diagrama lógico (tabelas e relacionamentos)
├── DiagramaFisico.png                  # Diagrama físico exportado do Workbench
├── modelagem_logica.md                 # Documento explicativo da modelagem lógica
├── modelo lógico-forma textual.pdf     # Modelo lógico em formato textual
├── ModeloFisico.md                     # Documento explicativo da modelagem física
├── TransportePrivado.sql               # Script principal (criação das tabelas, inserts, consultas e updates)
├── query_outputs.md                    # Evidências dos resultados das consultas
├── README.md                           # Arquivo de descrição do projeto
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


2. Executar o script principal (tabelas, inserts, consultas e updates):

   ```sql
   SOURCE TransportePrivado.sql;
   ```

   > Obs.: Também é possível executar os scripts em separado (`insert_data.sql`, `queries.sql`, `update_examples.sql`) se preferir.

3. Conferir os resultados:

   * O arquivo `query_outputs.md` contém amostras dos resultados das principais consultas.

---

## 🧾 Evidências de Funcionamento

As evidências das consultas e atualizações realizadas estão disponíveis no arquivo:

* [`query_outputs.md`](query_outputs.md) – contém os resultados obtidos no MySQL a partir dos dados de exemplo.

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
* Scripts SQL organizados e documentados.
* Evidências de execução das consultas.
