CREATE TABLE Cliente (
  id INT PRIMARY KEY,
  nome VARCHAR(100),
  email VARCHAR(100)
);

CREATE TABLE Pedido (
  id INT PRIMARY KEY,
  cliente_id INT,
  FOREIGN KEY (cliente_id) REFERENCES Cliente(id)
);

