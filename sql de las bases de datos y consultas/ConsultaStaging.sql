

use ETLjardineria


--Hacer la dimension tiempo---
SELECT distinct (fecha_pedido)--OrderDate
from pedido
order by fecha_pedido DESC;--OrderDate

--Consulta para crear la dimension producto de mayor a menor cantidad de productos vendidos

SELECT
    p.nombre AS Nombre_Producto,
    SUM(dp.cantidad) AS Total_Vendido
FROM
    producto p
JOIN
    detalle_pedido dp ON p.ID_producto = dp.ID_producto
GROUP BY
    p.nombre
ORDER BY
    Total_Vendido DESC;


--consulta para crear la dimension categoria con mas productos

SELECT 
    cp.Desc_Categoria AS Categoria,
    COUNT(p.ID_producto) AS Cantidad_Productos
FROM 
    Categoria_producto cp
LEFT JOIN 
    producto p ON cp.Id_Categoria = p.Categoria
GROUP BY 
    cp.Desc_Categoria
ORDER BY 
    Cantidad_Productos DESC;

--consulta para crear todas las venta tabla de hechos--


----------------------HECHOS VENTAS---------------------
	SELECT
    pr.nombre AS Nombre_Producto,
    cp.Desc_Categoria AS Categoria,
    p.fecha_pedido AS Año_de_Venta,
    p.ID_pedido,
    d.cantidad,
    d.precio_unidad,
    (d.cantidad * d.precio_unidad) AS total_venta
FROM 
    detalle_pedido d
INNER JOIN 
    pedido p ON d.ID_pedido = p.ID_pedido
INNER JOIN 
    producto pr ON d.ID_producto = pr.ID_producto
LEFT JOIN 
    Categoria_producto cp ON pr.Categoria = cp.Id_Categoria
ORDER BY 
    total_venta DESC;
