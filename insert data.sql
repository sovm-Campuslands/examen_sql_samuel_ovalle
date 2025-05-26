INSERT INTO clientes (nombre, apellido, telefono, direccion) VALUES
("Carlos", "Gomez", "301987654", "Av. Siempre Viva #100 Medellín, Colombia"),
("Laura", "Ramirez", "305675432", "Calle 45 #12-90 Cali, Colombia"),
("Andrés", "Martínez", "310456789", "Carrera 8 #75-30 Barranquilla, Colombia"),
("Fernanda", "López", "320999888", "Diagonal 55 #23A-60 Cartagena, Colombia"),
("Sebastián", "Rodríguez", "311123321", "Transversal 22 #85-50 Bogotá, Colombia"),
("Gabriela", "Torres", "315678910", "Calle 20 #18-40 Pereira, Colombia"),
("Daniel", "Vargas", "317890123", "Av. Libertad #45-21 Bucaramanga, Colombia"),
("Valentina", "Morales", "314567891", "Carrera 11 #60-19 Manizales, Colombia"),
("Alejandro", "Castro", "316789012", "Calle 77 #24A-45 Cúcuta, Colombia"),
("Sofía", "Ríos", "312345678", "Autopista Sur #150-32 Villavicencio, Colombia");

INSERT INTO ingredientes (nombre, descripcion, precio) VALUES
("Mozzarella", "Queso italiano con textura suave y derretible", 2.50),
("Pepperoni", "Rodajas de embutido curado con sabor intenso", 3.00),
("Tomate", "Tomate fresco, base clásica para salsas", 1.20),
("Albahaca", "Hierba aromática utilizada en pizzas clásicas", 0.80),
("Champiñones", "Hongos frescos con textura y sabor único", 2.00),
("Aceitunas negras", "Aceitunas con sabor ligeramente amargo", 1.50),
("Jamón", "Corte de cerdo ahumado con textura tierna", 2.80),
("Piña", "Trozos dulces y jugosos para combinaciones tropicales", 1.90),
("Orégano", "Especia que potencia los sabores de la pizza", 0.70),
("Salsa BBQ", "Salsa especial con toque dulce y ahumado", 2.20);

INSERT INTO productos (nombre, descripcion, categoria, precio, disponible) VALUES
("Pizza Margarita", "Pizza con mozzarella, tomate y albahaca", "producto_elaborado", 8.50, true),
("Pizza Pepperoni", "Pizza con mozzarella y pepperoni", "producto_elaborado", 9.00, true),
("Pizza Hawaiana", "Pizza con mozzarella, jamón y piña", "producto_elaborado", 9.50, true),
("Pizza Champiñones", "Pizza con mozzarella y champiñones frescos", "producto_elaborado", 9.20, true),
("Bebida Cola", "Refresco de cola 500ml", "producto_no_elaborado", 2.00, true),
("Bebida Naranja", "Jugo de naranja natural 500ml", "producto_no_elaborado", 2.50, true),
("Postre Tiramisú", "Delicioso postre italiano con café y cacao", "producto_no_elaborado", 5.00, true),
("Postre Cheesecake", "Pastel de queso con frutos rojos", "producto_no_elaborado", 5.50, true),
("Salsa BBQ", "Salsa especial para pizzas y carnes", "producto_no_elaborado", 2.20, true),
("Salsa de Ajo", "Salsa cremosa con ajo y especias", "producto_no_elaborado", 1.80, true);

INSERT INTO preparaciones (codigo_producto, codigo_ingrediente) VALUES
-- Pizza Margarita
(1, 1), -- Mozzarella
(1, 3), -- Tomate
(1, 4), -- Albahaca

-- Pizza Pepperoni
(2, 1), -- Mozzarella
(2, 2), -- Pepperoni
(2, 9), -- Orégano

-- Pizza Champiñones
(3, 1), -- Mozzarella
(3, 5), -- Champiñones
(3, 9), -- Orégano

-- Pizza Hawaiana
(4, 1), -- Mozzarella
(4, 7), -- Jamón
(4, 8), -- Piña

-- Bebida Cola (sin ingredientes adicionales)
(5, NULL);

INSERT INTO pedidos (codigo_cliente, fecha, tipo, total) VALUES
(1, NOW(), 'consumir_en_sitio', 15.50),
(2, NOW(), 'para_llevar', 22.00),
(3, NOW(), 'consumir_en_sitio', 18.75),
(4, NOW(), 'para_llevar', 11.80),
(5, NOW(), 'consumir_en_sitio', 25.90),
(6, NOW(), 'para_llevar', 30.40),
(7, NOW(), 'consumir_en_sitio', 20.60),
(8, NOW(), 'para_llevar', 27.10),
(9, NOW(), 'consumir_en_sitio', 19.90),
(10, NOW(), 'para_llevar', 14.30);

INSERT INTO pedido_con_adicion (codigo_ingrediente, total_adiciones) VALUES
( 1, 1.50),  -- Mozzarella extra
( 2, 2.00),  -- Pepperoni adicional
( 4, 0.80),  -- Albahaca
(5, 1.20),  -- Champiñones extra
(6, 1.50),  -- Aceitunas negras
(7, 2.80),  -- Jamón adicional
(8, 1.90),  -- Piña
(9, 0.70),  -- Orégano
(10, 2.20), -- Salsa BBQ
(3, 1.00); -- Tomate extra

INSERT INTO detalle_pedido (codigo_pedido, codigo_producto, cantidad, precio_unitario, adiciones) VALUES
(1, 1, 2, 8.50, 1), -- Pedido 1: 2 Pizzas Margarita con adición de Mozzarella
(2, 2, 1, 9.00, 2), -- Pedido 2: 1 Pizza Pepperoni con extra de Pepperoni
(3, 3, 1, 9.20, 4), -- Pedido 3: 1 Pizza Champiñones con adición de Albahaca
(4, 4, 1, 9.50, 5), -- Pedido 4: 1 Pizza Hawaiana con Aceitunas negras
(5, 5, 2, 2.00, NULL), -- Pedido 5: 2 Bebidas Cola (sin adiciones)
(6, 6, 1, 2.50, NULL), -- Pedido 6: 1 Bebida Naranja (sin adiciones)
(7, 7, 1, 5.00, NULL), -- Pedido 7: 1 Postre Tiramisú
(8, 8, 1, 5.50, NULL), -- Pedido 8: 1 Postre Cheesecake
(9, 9, 1, 2.20, NULL), -- Pedido 9: 1 Salsa BBQ
(10, 10, 1, 1.80, NULL); -- Pedido 10: 1 Salsa de Ajo


