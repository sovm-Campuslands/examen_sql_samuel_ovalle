CREATE DATABASE IF NOT EXISTS acmeDB;
USE acmeDB;

-- Tabla de productos
CREATE TABLE productos(
    codigo_producto INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    descripcion VARCHAR(150) NOT NULL,
    categoria ENUM('producto_elaborado', 'producto_no_elaborado') NOT NULL,
    precio DECIMAL(10,2) NOT NULL,
    disponible BOOLEAN DEFAULT TRUE NOT NULL
);

-- Tabla de ingredientes
CREATE TABLE ingredientes(
    codigo_ingrediente INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    descripcion VARCHAR(100) NOT NULL
);

-- Tabla de relación entre productos e ingredientes (muchos a muchos)
CREATE TABLE preparaciones(
    id INT AUTO_INCREMENT PRIMARY KEY,
    codigo_producto INT NOT NULL,
    codigo_ingrediente INT NOT NULL,
    FOREIGN KEY (codigo_producto) REFERENCES productos(codigo_producto)
        ON DELETE CASCADE,
    FOREIGN KEY (codigo_ingrediente) REFERENCES ingredientes(codigo_ingrediente)
        ON DELETE CASCADE
);

-- Tabla de adiciones
CREATE TABLE adiciones(
    codigo_adicion INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    descripcion VARCHAR(100) NOT NULL,
    precio_adicion DECIMAL(10,2) NOT NULL
);

-- Tabla de clientes
CREATE TABLE clientes(
    codigo_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    apellido VARCHAR(50) NOT NULL,
    telefono VARCHAR(20) NOT NULL,
    direccion VARCHAR(255) NOT NULL
);

-- Tabla de pedidos
CREATE TABLE pedidos(
    codigo_pedido INT AUTO_INCREMENT PRIMARY KEY,
    codigo_cliente INT NOT NULL,
    fecha DATETIME DEFAULT CURRENT_TIMESTAMP,
    tipo ENUM('consumir_en_sitio', 'para_llevar') NOT NULL,
    total DECIMAL(10,2) DEFAULT 0.0,
    FOREIGN KEY (codigo_cliente) REFERENCES clientes(codigo_cliente)
        ON DELETE CASCADE
);

-- Tabla de relación entre pedidos y adiciones
CREATE TABLE pedido_con_adicion(
    id INT AUTO_INCREMENT PRIMARY KEY, 
    codigo_pedido INT NOT NULL,
    codigo_adicion INT NOT NULL,
    total_adiciones DECIMAL(10,2) DEFAULT 0.0,
    FOREIGN KEY (codigo_pedido) REFERENCES pedidos(codigo_pedido),
    FOREIGN KEY (codigo_adicion) REFERENCES adiciones(codigo_adicion)
);

-- Tabla de detalle de pedido
CREATE TABLE detalle_pedido(
    codigo_detalle INT AUTO_INCREMENT PRIMARY KEY,
    codigo_pedido INT NOT NULL,
    
    codigo_producto INT NOT NULL,
    cantidad INT NOT NULL DEFAULT 1,
    precio_unitario DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (codigo_pedido) REFERENCES pedidos(codigo_pedido),
    FOREIGN KEY (codigo_producto) REFERENCES productos(codigo_producto)
);

alter table ingredientes add column precio decimal(10,2) not null;