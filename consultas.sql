-- a. Número de personas que han consultado vuelos mayores a un valor de 5000.000 de pesos.
SELECT COUNT(DISTINCT cliente_id)
FROM HistorialViajes
INNER JOIN Viaje ON HistorialViajes.viaje_id = Viaje.id
WHERE precio > 5000000;

-- Personas que han tomado los vuelos y han hecho el pago en efectivo.
SELECT DISTINCT Cliente.*
FROM Cliente
INNER JOIN Reserva ON Cliente.id = Reserva.cliente_id
INNER JOIN Medio_de_pago ON Reserva.medio_de_pago_id = Medio_de_pago.id
WHERE Medio_de_pago.tipo_pago = 'efectivo';

-- c. Personas mayores a 40 años y que viven en la ciudad de Bogotá.
SELECT *
FROM Cliente
WHERE edad > 40 AND ciudad = 'Bogotá';

-- d. Listar los tipos de viajes turísticos y de negocios que se han hecho con pago con tarjeta de crédito.
SELECT DISTINCT Tipo_viaje.nombre
FROM Tipo_viaje
INNER JOIN Viaje ON Tipo_viaje.id = Viaje.tipo_id
INNER JOIN Reserva ON Viaje.id = Reserva.viaje_id
INNER JOIN Medio_de_pago ON Reserva.medio_de_pago_id = Medio_de_pago.id
WHERE Tipo_viaje.nombre IN ('turístico', 'negocios') AND Medio_de_pago.tipo_pago = 'tarjeta de crédito';

-- e. Listar los viajes activos y cancelados.
SELECT *
FROM Viaje
WHERE disponible = true OR disponible = false;