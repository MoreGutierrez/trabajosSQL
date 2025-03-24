-- CREATE DATABASE IF NOT EXISTS productos;
-- USE productos;

CREATE TABLE IF NOT EXISTS productos_belleza (
	id_producto INT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    marca VARCHAR(50) NOT NULL,
    precio DOUBLE(10,2)
);

INSERT INTO productos_belleza (id_producto, nombre, marca, precio) VALUES 
	-- 5 productos de Rare Beauty:
	(1,'Soft Pinch Blush', 'Rare Beauty', 26.00),
	(2,'Positive Light Highlighter', 'Rare Beauty', 25.00),
	(3,'Lip Soufflé Matte Cream', 'Rare Beauty', 20.00),
	(4,'Liquid Touch Foundation', 'Rare Beauty', 30.00),
	(5,'Perfect Strokes Eyeliner', 'Rare Beauty', 22.00),

	-- 5 productos de Fenty Beauty:
	(6,'Pro Filt\'r Soft Matte Foundation', 'Fenty Beauty', 35.00),
	(7,'Gloss Bomb Universal Lip Luminizer', 'Fenty Beauty', 20.00),
	(8,'Killawatt Freestyle Highlighter', 'Fenty Beauty', 38.00),
	(9,'Cheeks Out Freestyle Cream Blush', 'Fenty Beauty', 22.00),
	(10,'Stunna Lip Paint', 'Fenty Beauty', 26.00),

	-- 5 productos de Charlotte Tilbury:
	(11,'Hollywood Flawless Filter', 'Charlotte Tilbury', 44.00),
	(12,'Matte Revolution Lipstick', 'Charlotte Tilbury', 35.00),
	(13,'Airbrush Flawless Foundation', 'Charlotte Tilbury', 49.00),
	(14,'Pillow Talk Lip Cheat Liner', 'Charlotte Tilbury', 24.00),
	(15,'Beauty Light Wand Highlighter', 'Charlotte Tilbury', 40.00);

-- EJERCICIO 1: Selecciona todos los registros de una tabla.
SELECT * FROM productos_belleza;

-- EJERCICIO 2: Selecciona todos los productos de una determinada marca (definida por el usuario)
SELECT * FROM productos_belleza WHERE marca = 'Rare Beauty';

-- EJERCICIO 3: Selecciona todos los productos en orden alfabético ascendente por nombre.
SELECT * FROM productos_belleza ORDER BY nombre;

-- EJERCICIO 4: Agrega un nuevo producto a la tabla.
INSERT INTO productos_belleza(id_producto, nombre, marca, precio) VALUES 
	-- 1 producto de Urban Decay:
	(16,'Urban Decay Naked Palette','Urban Decay',45.00);

-- EJERCICIO 5: Actualiza el precio del producto con ID 5 a 49.99.
UPDATE productos_belleza SET precio = 49.99 WHERE id_producto = 5;
SELECT * FROM productos_belleza WHERE id_producto = 5;

-- EJERCICIO 6: Elimina el producto con ID 3.
DELETE FROM productos_belleza WHERE id_producto = 3;
SELECT * FROM productos_belleza WHERE id_producto = 3;

-- EJERCICIO 7 (SELECT con BETWEEN): Selecciona todos los productos cuyo precio esté entre $10 y $50.
SELECT * FROM productos_belleza WHERE precio BETWEEN 10 AND 50;

-- EJERCICIO 8: Selecciona todos los productos cuyo precio sea mayor que el precio promedio de todos los productos.
SELECT * FROM productos_belleza WHERE precio > (SELECT AVG(precio) FROM productos_belleza);

-- EJERCICIO 9(UPDATE Simple): Actualiza el precio de todos los productos en la marca "Nulla Dignissim Institute" para que sea $5 más caro.
INSERT INTO productos_belleza (id_producto, nombre, marca, precio) VALUES
	-- 5 producto de Nulla Dignissim Institute: 
	(17, 'Advanced Skin Serum', 'Nulla Dignissim Institute', 50.00),
	(18, 'Radiance Boost Cream', 'Nulla Dignissim Institute', 40.00),
	(19, 'Flawless Finish Powder', 'Nulla Dignissim Institute', 30.00),
	(20, 'Velvet Matte Lipstick', 'Nulla Dignissim Institute', 25.00),
	(21, 'Glow Perfecting Primer', 'Nulla Dignissim Institute', 45.00);
SELECT * FROM productos_belleza WHERE marca = 'Nulla Dignissim Institute';
UPDATE productos_belleza SET precio = precio + 5 WHERE marca = 'Nulla Dignissim Institute';
SELECT * FROM productos_belleza WHERE marca = 'Nulla Dignissim Institute';

-- EJERCICIO 10 (SELECT con NOT, AND, OR): Selecciona todos los telefonos cuyo codigo de area no sea 844  y su numero sea mayor que 4369984 o su tipo sea F.
CREATE TABLE IF NOT EXISTS telefonos (
	id_telefono INT PRIMARY KEY,
    codigo_area VARCHAR(10) NOT NULL,
    numero INT NOT NULL,
    tipo CHAR(1)
);
INSERT INTO telefonos (id_telefono, codigo_area, numero, tipo) VALUES
	(1, '844', 4369985, 'F'),
	(2, '845', 4401234, 'M'),
	(3, '846', 4500000, 'F'),
	(4, '844', 4551234, 'M'),
	(5, '843', 4600000, 'F');
SELECT * FROM telefonos WHERE NOT codigo_area = '844' AND (numero > 4369984 OR tipo = 'F');

-- EJERCICIO 11: Selecciona los 10 productos más caros.
SELECT * FROM productos_belleza ORDER BY precio DESC LIMIT 10;

-- EJERCICIO 12 (SELECT con LIKE): Selecciona las facturas cuya fecha contiene el año "2016".
CREATE TABLE IF NOT EXISTS factura (
	id_factura INT PRIMARY KEY,
    fecha DATE,
    nombre VARCHAR(50)
);
INSERT INTO factura (id_factura, fecha, nombre) VALUES
	(1, '2016-03-15', 'Elena Gilbert'),  
	(2, '2014-06-24', 'Bonnie Bennet'),  
	(3, '2016-04-27', 'Allison Argent'),  
	(4, '2017-02-15', 'Caroline Forbes'),  
	(5, '2016-01-20', 'Lydia Martin'); 
SELECT * FROM factura WHERE fecha LIKE '%2016%';

-- EJERCICIO 13 (INSERT Simple): Agrega un nuevo producto a la tabla con el nombre "Nuevo Producto" y un precio de $29.99.
INSERT INTO productos_belleza(id_producto, nombre, marca, precio) VALUES 
	-- 1 producto nuevo:
	(22,'Nuevo Producto','Rare Beauty',29.99);
SELECT * FROM productos_belleza WHERE marca = 'Rare Beauty';

-- EJERCICIO 14 (UPDATE con NOT, AND, OR): Incrementa el precio de todos los productos en un 5%, pero solo si su precio actual es inferior a $50 o su nombre no contiene "descuento".
UPDATE productos_belleza SET precio = precio * 1.05 WHERE NOT (precio > 50 OR nombre NOT LIKE '%descuento%');
SELECT * FROM productos_belleza WHERE precio <50;
SELECT * FROM productos_belleza WHERE precio >=50;

-- EJERCICIO 15(SELECT con <> y AND): Selecciona los teléfono que no sean del tipo F y cuyo número no sea mayor  a 4892549
SELECT * FROM telefonos WHERE tipo <> 'F' AND numero <= 4892549;
