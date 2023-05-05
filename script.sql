-- Tabla Cliente:
CREATE TABLE Cliente (
  id INT PRIMARY KEY AUTO_INCREMENT,
  nombre VARCHAR(255) NOT NULL,
  edad INT,
  correo_electronico VARCHAR(255)
);

-- Tabla Tipo_viaje
CREATE TABLE Tipo_viaje (
  id INT PRIMARY KEY AUTO_INCREMENT,
  nombre VARCHAR(255) NOT NULL
)

--Tabla Viaje:
CREATE TABLE Viaje (
  id INT PRIMARY KEY AUTO_INCREMENT,
  origen VARCHAR(255) NOT NULL,
  destino VARCHAR(255) NOT NULL,
  tipo_id INT
  fecha_salida DATE,
  fecha_llegada DATE,
  precio DOUBLE,
  disponible BOOLEAN,
  FOREIGN KEY (tipo_id) REFERENCES Tipo(id)
);

-- Tabla HistorialViajes:
CREATE TABLE HistorialViajes (
  id INT PRIMARY KEY AUTO_INCREMENT,
  viaje_id INT,
  cliente_id INT,
  fecha DATE,
  FOREIGN KEY (viaje_id) REFERENCES Viaje(id),
  FOREIGN KEY (cliente_id) REFERENCES Cliente(id)
);

-- Tabla estado_reserva
CREATE TABLE Estado_reserva (
  id INT PRIMARY KEY AUTO_INCREMENT,
  nombre VARCHAR(255) NOT NULL
)

-- Tabla Reserva:
CREATE TABLE Reserva (
  id INT PRIMARY KEY AUTO_INCREMENT,
  cliente_id INT,
  viaje_id INT,
  fecha_reserva DATE,
  estado_reserva_id INT,
  compra_id INT,
  FOREIGN KEY (cliente_id) REFERENCES Cliente(id),
  FOREIGN KEY (viaje_id) REFERENCES Viaje(id)
  FOREIGN KEY (estado_reserva_id) REFERENCES Estado_reserva(id)
  FOREIGN KEY (compra_id) REFERENCES Compra(id)
);

--Tabla Medio_de_pago:
CREATE TABLE Medio_de_pago (
  id INT PRIMARY KEY AUTO_INCREMENT,
  tipo_pago VARCHAR(255),
);

--Tabla Compra:
CREATE TABLE Compra (
  id INT PRIMARY KEY AUTO_INCREMENT,
  fecha_compra DATE,
  estado BOOLEAN,
  medio_de_pago_id INT,
  total_pago DOUBLE,
  FOREIGN KEY (medio_pago_id) REFERENCES Medio_de_pago(id)
);

