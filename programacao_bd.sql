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

