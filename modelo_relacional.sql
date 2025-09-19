-- CLIENTE
DROP TABLE IF EXISTS Cliente;
CREATE TABLE Cliente (
  id INT PRIMARY KEY AUTO_INCREMENT,
  nome VARCHAR(100),
  email VARCHAR(100) UNIQUE
);

-- PRODUTO
DROP TABLE IF EXISTS Produto;
CREATE TABLE Produto (
  id INT PRIMARY KEY AUTO_INCREMENT,
  nome VARCHAR(100),
  preco DECIMAL(10,2),
  estoque INT
);

-- PEDIDO
DROP TABLE IF EXISTS Pedido;
CREATE TABLE Pedido (
  id INT PRIMARY KEY AUTO_INCREMENT,
  cliente_id INT,
  data_pedido DATE,
  FOREIGN KEY (cliente_id) REFERENCES Cliente(id)
);

-- ITEM DO PEDIDO
DROP TABLE IF EXISTS ItemPedido;
CREATE TABLE ItemPedido (
  pedido_id INT,
  produto_id INT,
  quantidade INT,
  preco_unitario DECIMAL(10,2),
  PRIMARY KEY (pedido_id, produto_id),
  FOREIGN KEY (pedido_id) REFERENCES Pedido(id),
  FOREIGN KEY (produto_id) REFERENCES Produto(id)
);

-- TRIGGER PARA ATUALIZAR ESTOQUE
DELIMITER //
CREATE TRIGGER atualiza_estoque
AFTER INSERT ON ItemPedido
FOR EACH ROW
BEGIN
  UPDATE Produto
  SET estoque = estoque - NEW.quantidade
  WHERE id = NEW.produto_id;
END;
//
DELIMITER ;

-- PROCEDURE PARA INSERIR PEDIDO
DELIMITER //
CREATE PROCEDURE inserir_pedido(
  IN cliente INT,
  IN produto INT,
  IN qtd INT
)
BEGIN
  DECLARE novo_pedido INT;

  INSERT INTO Pedido (cliente_id, data_pedido)
  VALUES (cliente, CURDATE());

  SET novo_pedido = LAST_INSERT_ID();

  INSERT INTO ItemPedido (pedido_id, produto_id, quantidade, preco_unitario)
  SELECT novo_pedido, id, qtd, preco FROM Produto WHERE id = produto;
END;
//
DELIMITER ;


