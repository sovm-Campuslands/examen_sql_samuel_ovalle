
# Acme Pizza's DataBase

En esta documentación encontrará información que le permita ejecutar en un entorno de MySQL Workbench la base de datos relacionada a la empresa Acme Pizza's



## Authors

- [@sovm](https://www.github.com/ovasam)


## Installation

Install mysql-workbench and create a new mysql connection
then copy and paste following the correct way.
First: Copy and paste create_table.sql and hit ctrl + enter
Second: Copy and paste insert_data.sql and hit ctrl + enter

These options let you use an environment in mysql workbench


## 
## Queries Reference
## 
#### Productos más vendidos #1

```sql
SELECT p.nombre AS producto, SUM(dp.cantidad) AS total_vendido
FROM detalle_pedido dp
JOIN productos p ON dp.codigo_producto = p.codigo_producto
GROUP BY p.nombre
ORDER BY total_vendido DESC;
```


#### Total de ingresos generados por cada combo #2

```sql
-- Si existiesen combos:
SELECT c.nombre AS combo, SUM(dp.cantidad * dp.precio_unitario) AS total_ingresos
FROM detalle_pedido dp
JOIN productos c ON dp.codigo_producto = c.codigo_producto
WHERE c.categoria = 'combo'
GROUP BY c.nombre
ORDER BY total_ingresos DESC;
```

#### Pedidos realizados para recoger vs. comer en la pizzería #3

```sql
SELECT tipo, COUNT(*) AS total_pedidos
FROM pedidos
GROUP BY tipo;
``` 

### Adiciones más solicitadas en pedidos personalizados #4

```sql
SELECT a.nombre AS adicion, COUNT(dp.adiciones) AS veces_solicitada
FROM detalle_pedido dp
JOIN pedido_con_adicion pa ON dp.adiciones = pa.id
JOIN ingredientes a ON pa.codigo_ingrediente = a.codigo_ingrediente
GROUP BY a.nombre
ORDER BY veces_solicitada DESC;
```


### Cantidad total de productos vendidos por categoría
```sql
SELECT p.categoria, SUM(dp.cantidad) AS total_vendido
FROM detalle_pedido dp
JOIN productos p ON dp.codigo_producto = p.codigo_producto
GROUP BY p.categoria
ORDER BY total_vendido DESC;
```


### Promedio de pizzas pedidas por cliente
```sql
SELECT AVG(cantidad) AS promedio_pizzas_por_cliente
FROM detalle_pedido dp
JOIN productos p ON dp.codigo_producto = p.codigo_producto
WHERE p.categoria = 'producto_elaborado';
```

### Total de ventas por día de la semana
```sql
SELECT DAYNAME(fecha) AS dia_semana, SUM(total) AS total_ventas
FROM pedidos
GROUP BY dia_semana
ORDER BY total_ventas DESC;
```
### Cantidad de panzarottis vendidos con extra queso
```sql
SELECT SUM(dp.cantidad) AS total_panzarottis_con_extra_queso
FROM detalle_pedido dp
JOIN productos p ON dp.codigo_producto = p.codigo_producto
JOIN pedido_con_adicion pa ON dp.adiciones = pa.id
WHERE p.nombre LIKE '%panzarotti%' AND pa.codigo_ingrediente = 1; -- mozarrella
```

### Pedidos que incluyen bebidas como parte de un combo
```sql
SELECT p.codigo_pedido, COUNT(dp.codigo_producto) AS bebidas_en_pedido
FROM detalle_pedido dp
JOIN productos p ON dp.codigo_producto = p.codigo_producto
WHERE p.categoria = 'producto_no_elaborado' -- Asumiendo que bebidas están en esta categoría
GROUP BY p.codigo_pedido
HAVING bebidas_en_pedido > 0;
```
### Clientes que han realizado más de 5 pedidos en el último mes
### Ingresos totales generados por productos no elaborados (bebidas, postres, etc.)
### Promedio de adiciones por pedido
### Total de combos vendidos en el último mes
### Clientes con pedidos tanto para recoger como para consumir en el lugar
### Total de productos personalizados con adiciones
### Pedidos con más de 3 productos diferentes
### Promedio de ingresos generados por día
### Clientes que han pedido pizzas con adiciones en más del 50% de sus pedidos
### Porcentaje de ventas provenientes de productos no elaborados
### Día de la semana con mayor número de pedidos para recoger


