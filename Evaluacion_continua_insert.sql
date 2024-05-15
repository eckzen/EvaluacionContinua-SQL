/*Ejercicio Evaluación continua - UF1845
  Erick Montoya*/
  
  use evaluacion_continua; 

-- Insertar productos
INSERT INTO Productos (id_producto, nombre, precio, categoría)
VALUES (1, 'Laptop', 1200.00, 'Electrónica'),
(2, 'Smartphone', 800.00, 'Electrónica'),
(3, 'Teclado', 100.00, 'Accesorios'),
(4, 'Mouse', 50.00, 'Accesorios'),
(5, 'Monitor', 300.00, 'Electrónica'),
(6, 'Impresora', 150.00, 'Oficina'),
(7, 'Tablet', 250.00, 'Electrónica'),
(8, 'Cámara', 500.00, 'Electrónica'),
(9, 'Silla de oficina', 120.00, 'Muebles'),
(10, 'Escritorio', 220.00, 'Muebles'),
(11, 'Router', 95.00, 'Electrónica'),
(12, 'Disco Duro Externo', 120.00, 'Accesorios'),
(13, 'Altavoces', 70.00, 'Electrónica'),
(14, 'Micrófono', 85.00, 'Accesorios'),
(15, 'Teclado Mecánico', 130.00, 'Accesorios'),
(16, 'Monitor Curvo', 320.00, 'Electrónica'),
(17, 'Mochila', 90.00, 'Accesorios'),
(18, 'Power Bank', 50.00, 'Electrónica'),
(19, 'Lámpara de escritorio', 45.00, 'Muebles'),
(20, 'Silla ergonómica', 180.00, 'Muebles');

-- Insertar clientes
INSERT INTO Clientes (id_cliente, nombre, email, ciudad)
VALUES
(1, 'Juan Pérez', 'juanperez@mail.com', 'Madrid'),
(2, 'Ana Gómez', 'anagomez@mail.com', 'Barcelona'),
(3, 'Luisa Fernández', 'luisafern@mail.com', 'Valencia'),
(4, 'Carlos Ruiz', 'carlosruiz@mail.com', 'Sevilla'),
(5, 'Marta López', 'martalopez@mail.com', 'Madrid'),
(6, 'Andrea Jiménez', 'andreajimenez@mail.com', 'Málaga'),
(7, 'Pablo Martínez', 'pablomartinez@mail.com', 'Bilbao'),
(8, 'Sofía Castro', 'sofiacastro@mail.com', 'Zaragoza'),
(9, 'Raúl Navarro', 'raulnavarro@mail.com', 'Alicante'),
(10, 'Irene Molina', 'irenemolina@mail.com', 'Coruña'),
(11, 'Jorge Esteban', 'jorgeesteban@mail.com', 'Granada'),
(12, 'Clara Sanz', 'clarasanz@mail.com', 'Santander'),
(13, 'Mario Redondo', 'marroredondo@mail.com', 'Toledo'),
(14, 'Lucía Marín', 'luciamarin@mail.com', 'Cádiz');

-- Insertar pedidos

INSERT INTO Pedidos (id_pedido, id_cliente, fecha_pedido, estado)
VALUES
(1, 1, '2021-03-15', 'Entregado'),
(2, 2, '2021-03-17', 'Pendiente'),
(3, 3, '2021-03-20', 'Cancelado'),
(4, 4, '2021-03-22', 'Entregado'),
(5, 5, '2021-03-24', 'Pendiente'),
(6, 6, '2021-03-25', 'Entregado'),
(7, 7, '2021-03-28', 'Cancelado'),
(8, 8, '2021-03-30', 'Entregado'),
(9, 9, '2021-04-01', 'Entregado'),
(10, 10, '2021-04-02', 'Entregado'),
(11, 11, '2021-04-03', 'Entregado'),
(12, 12, '2021-04-05', 'Pendiente'),
(13, 13, '2021-04-05', 'Cancelado'),
(14, 14, '2021-04-06', 'Entregado'),
(15, 10, '2021-04-07', 'Entregado'),
(16, 10, '2021-04-08', 'Entregado'),
(17, 11, '2021-04-09', 'Entregado'),
(18, 12, '2021-04-10', 'Pendiente');
 

-- Insertar detalles de pedidos
INSERT INTO Detalles_Pedidos (id_detalle, id_pedido, id_producto, cantidad)
VALUES 
(1, 1, 1, 1),
(2, 1, 2, 2),
(3, 2, 1, 1),
(4, 3, 4, 1),
(5, 4, 5, 2),
(6, 5, 6, 1),
(7, 5, 7, 1),
(8, 6, 8, 1),
(9, 7, 9, 1),
(10, 8, 10, 1),
(11, 9, 5, 2),
(12, 9, 6, 3),
(13, 10, 11, 1),
(14, 11, 12, 1),
(15, 11, 13, 2),
(16, 12, 14, 1),
(17, 13, 15, 1),
(18, 14, 16, 1),
(19, 15, 17, 1),
(20, 15, 18, 2),
(21, 16, 19, 1),
(22, 17, 20, 1),
(23, 17, 11, 1),
(24, 18, 12, 2),
(25, 18, 10, 3),
(26, 18, 6, 4);

commit;




