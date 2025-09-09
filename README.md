# 🗃️ Projeto MY.SQL – Banco de Dados

Este repositório reúne os principais tópicos da disciplina de Banco de Dados, organizados em arquivos separados para facilitar o estudo e a prática. Cada parte representa 10% da avaliação da disciplina, conforme plano de ensino.

---

## 📑 Índice

1. [Modelo de Entidade e Relacionamento](#1-modelo-de-entidade-e-relacionamento)
2. [Conversão para Modelo Relacional](#2-conversão-para-modelo-relacional)
3. [Comandos da Linguagem SQL](#3-comandos-da-linguagem-sql)
4. [Programação em Banco de Dados](#4-programação-em-banco-de-dados)
5. [Como usar este repositório](#5-como-usar-este-repositório)

---

## 1. 📌 Modelo de Entidade e Relacionamento

Arquivo: `modelo_entidade_relacionamento.png`  
Descrição: Diagrama visual criado com BrModelo ou Draw.io, representando entidades, atributos e relacionamentos do sistema proposto.

---

## 2. 🔄 Conversão para Modelo Relacional

Arquivo: `modelo_relacional.sql`  
Descrição: Script SQL com comandos `CREATE TABLE`, convertendo o MER em estrutura relacional com chaves primárias e estrangeiras.

---

## 3. 🧾 Comandos da Linguagem SQL

Arquivo: `comandos_sql.sql`  
Descrição: Conjunto de comandos SQL básicos para manipulação de dados:
- `INSERT INTO`
- `SELECT`
- `UPDATE`
- `DELETE`

---

## 4. ⚙️ Programação em Banco de Dados

Arquivo: `programacao_bd.sql`  
Descrição: Contém uma `procedure` e uma `trigger` para automatizar ações no banco de dados:

```sql
CREATE PROCEDURE listar_clientes()
BEGIN
  SELECT * FROM Cliente;
END;

CREATE TRIGGER atualiza_estoque
AFTER INSERT ON Pedido
FOR EACH ROW
BEGIN
  UPDATE Produto SET estoque = estoque - 1 WHERE id = NEW.produto_id;
END;


