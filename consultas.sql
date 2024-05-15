/*Ejercicio Evaluación continua - UF1845
  Erick Montoya*/

use evaluacion_continua;

-- Tarea 1 Total de Ventas por Producto
/* Muestra el nombre del producto, su precio unitario y el total vendido por producto
   Se unen las tablas de productos y detalles de pedidos usando el id del producto para unir
   Luego se agrupan los resultados por el id del producto y su precio para calcular el total vendido por cada union
   Se ordenan los resultados en orden descendente*/

SELECT 
    P.nombre AS Producto,
    PR.precio AS Precio_Unidad,
    SUM(DP.cantidad * PR.precio) AS Total_Vendido
FROM 
    Productos P
JOIN 
    Detalles_Pedidos DP ON P.id_producto = DP.id_producto
JOIN 
    Productos PR ON DP.id_producto = PR.id_producto
GROUP BY 
    P.id_producto, PR.precio
ORDER BY 
    Total_Vendido DESC;
    
    
-- Tarea 2 Último Pedido de Cada Cliente
/*  Se recupera los detalles de los pedidos más recientes para cada cliente
	 utilizando la subconsulta para encontrar la última fecha de pedido para cada cliente
     y luego se une con la tabla de pedidos principal utilizando el id_cliente y la fecha del pedido 
     para obtener los detalles completos de los pedidos más recientes de cada cliente*/

SELECT p.id_pedido, p.id_cliente, p.fecha_pedido, p.estado
FROM Pedidos p
INNER JOIN (
    SELECT id_cliente, MAX(fecha_pedido) AS ultima_fecha
    FROM Pedidos
    GROUP BY id_cliente
) AS ultimos_pedidos
ON p.id_cliente = ultimos_pedidos.id_cliente AND p.fecha_pedido = ultimos_pedidos.ultima_fecha;


-- Tarea 3 Número de Pedidos por Ciudad
/* Esta consulta cuenta el número total de pedidos realizados por clientes en cada ciudad
   Se une la tabla de clientes con la tabla de pedidos usando el id cliente,
   luego se agrupan los resultados por ciudad y se cuenta el número de pedidos para cada ciudad*/

SELECT c.ciudad, COUNT(p.id_pedido) AS total_pedidos
FROM Clientes c
JOIN Pedidos p ON c.id_cliente = p.id_cliente
GROUP BY c.ciudad;


-- Tarea 4 Productos que Nunca se Han Vendido
/* En esta consulta se selecciona los productos que nunca se han vendido.
   Primero, se eligen los productos de la tabla Productos, luego se filtran los que sus IDs de productos no están presentes 
   en la subconsulta, que extrae los IDs de productos únicos de la tabla Detalles_Pedidos */

SELECT id_producto, nombre, precio, categoría
FROM Productos
WHERE id_producto NOT IN (
    SELECT DISTINCT id_producto
    FROM Detalles_Pedidos
);


-- Tarea 5 Productos Más Vendidos por Cantidad
/* Consulta que suma la cantidad vendida de cada producto en la tabla Detalles_Pedidos
 y luego ordena los resultados en orden descendente*/
 
SELECT p.id_producto, p.nombre, SUM(dp.cantidad) AS total_vendido
FROM Productos p
JOIN Detalles_Pedidos dp ON p.id_producto = dp.id_producto
GROUP BY p.id_producto, p.nombre
ORDER BY total_vendido DESC;


-- Tarea 6 Clientes con Compras en más de una categoría
/* Consulta que cuenta el nº de categorías dintintas donde se han hecho compras
    y luego se filtra los clientes que tengan conteo mayor a 1 con HAVING*/
    
SELECT c.id_cliente, c.nombre, COUNT(DISTINCT p.categoría) AS num_categorias
FROM Clientes c
JOIN Pedidos pe ON c.id_cliente = pe.id_cliente
JOIN Detalles_Pedidos dp ON pe.id_pedido = dp.id_pedido
JOIN Productos p ON dp.id_producto = p.id_producto
GROUP BY c.id_cliente, c.nombre
HAVING num_categorias > 1;


-- Tarea 7 Ventas Totales por Mes y Año
/* En esta consulta se calcula las ventas totales agrupadas por año y mes.
   Se selecciona el año y el mes de la fecha de pedido usando las funciones YEAR y MONTH 
   Luego calcula las ventas totales multiplicando precio por la cantidad 
   y suma estos valores*/

SELECT YEAR(fecha_pedido) AS año, MONTH(fecha_pedido) AS mes, SUM(precio * cantidad) AS ventas_totales
FROM Pedidos P
INNER JOIN Detalles_Pedidos DP ON P.id_pedido = DP.id_pedido
INNER JOIN Productos Pr ON DP.id_producto = Pr.id_producto
GROUP BY YEAR(fecha_pedido), MONTH(fecha_pedido)
ORDER BY año, mes;


-- Tarea 8 Cantidad promedio de productos por pedido
/* Con la subconsulta se cuenta la cantidad de productos POR cada pedido
   y agrupa los resultados en id_pedido.
   La consulta externa calcula el promedio con AVG de cantidad_productos por pedido.
   Con la función ROUND 1 hacemos que muestre solo un decimal para un nº de promedio más claro*/
   
SELECT ROUND(AVG(cantidad_productos), 1) AS cantidad_promedio_productos_por_pedido
FROM (
    SELECT id_pedido, COUNT(*) AS cantidad_productos
    FROM Detalles_Pedidos
    GROUP BY id_pedido
) AS subconsulta;

-- Tarea 9 Clientes que han realizado pedidos en más de una ocasión
/* La subconsulta cuenta el nº de pedidos realizados por cada cliente
    y filtra los que tengan más de 1 pedido. Luego unimos la subconsulta con la tabla Clientes*/
    
SELECT c.id_cliente, c.nombre, pedidos_cliente.num_pedidos
FROM (
SELECT id_cliente, COUNT(*) AS num_pedidos
FROM Pedidos
GROUP BY id_cliente
) AS pedidos_cliente
JOIN Clientes c ON pedidos_cliente.id_cliente = c.id_cliente
WHERE num_pedidos > 1;


-- Tarea 10
/* Usamos en la subconsulta la función DATEDIFF para tener el resultado de la diferencia en días entre pedidos,
   la función LAG permite acceder a la fila anterior a la actual,
   OVER(PARTITUON BY) divide el conjunto de datos basados en valores de una columna para que permita aplicar la función de ventana dentro de cada grupo por separado,
   luego con HAVING filtramos con HAVING*/

SELECT id_cliente, ROUND(AVG(dias_entre_pedidos), 0) AS tiempo_promedio_entre_pedidos
FROM (
    SELECT id_cliente, 
           DATEDIFF(fecha_pedido, LAG(fecha_pedido) OVER (PARTITION BY id_cliente ORDER BY fecha_pedido)) AS dias_entre_pedidos
    FROM Pedidos
) AS diferencia_entre_pedidos
GROUP BY id_cliente
HAVING COUNT(*) > 1;

commit;