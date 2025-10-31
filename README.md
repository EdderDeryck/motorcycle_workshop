#  Motorcycle Workshop Database

Este projeto foi desenvolvido como uma **atividade acadêmica** da faculdade, com o objetivo de criar o modelo lógico e físico de um banco de dados relacional para uma **oficina de motocicletas**.  

O banco foi implementado em **MySQL**, utilizando o site [DB Fiddle](https://www.db-fiddle.com/f/ejPtkA85edVn8gdDdewoRU/51) para construção, testes e execução dos comandos SQL.  
O trabalho foi realizado **com a colaboração de colegas de turma**, sob orientação da disciplina de Banco de Dados.

---

##  Estrutura do Banco de Dados

O banco de dados foi projetado para simular as operações de uma oficina de motos, contendo tabelas que representam clientes, funcionários, fornecedores, peças, modelos de motos, vendas e ordens de serviço.

### Principais tabelas:

| Tabela | Descrição |
|--------|------------|
| **states**            | Armazena os estados brasileiros.           |
| **addresses**         | Endereços com cidade, estado e CEP.        |
| **customers**         | Clientes da oficina, com CPF e telefone.   |
| **employees**         | Funcionários e seus cargos.                |
| **motorcycle_models** | Modelos de motocicletas e preços.          |
| **motorcycles**       | Motos específicas (modelo + ano).          |
| **suppliers**         | Fornecedores de peças.                     |
| **parts**             | Peças fornecidas, com preço e fornecedor.  |
| **sales**             | Registros de vendas de motocicletas.       |
| **service_orders**    | Ordens de serviço abertas para clientes.   |
| **services**          | Serviços realizados nas ordens.            |
| **service_parts**     | Relação entre serviços e peças utilizadas. |

---

##  Como executar o projeto

### Opção 1 — No **DB Fiddle**
1. Acesse o link do projeto:  
    [https://www.db-fiddle.com/f/ejPtkA85edVn8gdDdewoRU/51](https://www.db-fiddle.com/f/ejPtkA85edVn8gdDdewoRU/51)
2. Clique em **Run** para criar as tabelas e visualizar os resultados.

### Opção 2 — Localmente (MySQL Workbench, DBeaver, IntelliJ etc.)
1. Crie um novo banco de dados:
   ```sql
   CREATE DATABASE motorcycle_workshop;
   USE motorcycle_workshop;
