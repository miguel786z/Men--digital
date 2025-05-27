-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 28-05-2025 a las 00:57:18
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `restaurante1`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `id` int(11) NOT NULL,
  `nombre_cliente` varchar(100) NOT NULL,
  `telefono` varchar(20) NOT NULL,
  `direccion` text DEFAULT NULL,
  `fecha_registro` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `configuracion_restaurante`
--

CREATE TABLE `configuracion_restaurante` (
  `id` int(11) NOT NULL,
  `nombre_restaurante` varchar(200) DEFAULT 'RESTAURANTE',
  `direccion` text DEFAULT NULL,
  `telefono` varchar(50) DEFAULT NULL,
  `email` varchar(150) DEFAULT NULL,
  `horario` text DEFAULT NULL,
  `logo` varchar(255) DEFAULT NULL,
  `fecha_actualizacion` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `configuracion_restaurante`
--

INSERT INTO `configuracion_restaurante` (`id`, `nombre_restaurante`, `direccion`, `telefono`, `email`, `horario`, `logo`, `fecha_actualizacion`) VALUES
(1, 'RESTAURANTE', 'Dirección del restaurante', '+57 123 456 7890', 'info@restaurante.com', 'Lunes a Domingo: 10:00 AM - 10:00 PM', NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_pedido`
--

CREATE TABLE `detalle_pedido` (
  `id` int(11) NOT NULL,
  `id_pedido` int(11) NOT NULL,
  `nombre_producto` varchar(100) NOT NULL,
  `categoria` varchar(50) DEFAULT NULL,
  `precio` decimal(10,2) NOT NULL,
  `cantidad` int(11) NOT NULL DEFAULT 1,
  `descripcion` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `log_acciones`
--

CREATE TABLE `log_acciones` (
  `id` int(11) NOT NULL,
  `usuario_id` int(11) DEFAULT NULL,
  `accion` varchar(200) NOT NULL,
  `detalles` text DEFAULT NULL,
  `fecha` datetime NOT NULL DEFAULT current_timestamp(),
  `ip_address` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `menu_items`
--

CREATE TABLE `menu_items` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `descripcion` text DEFAULT NULL,
  `precio` decimal(10,2) NOT NULL,
  `imagen` varchar(255) DEFAULT NULL,
  `categoria` enum('plato','bebida','postre') NOT NULL,
  `disponible` tinyint(1) NOT NULL DEFAULT 1,
  `fecha_creacion` datetime NOT NULL DEFAULT current_timestamp(),
  `fecha_actualizacion` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `menu_items`
--

INSERT INTO `menu_items` (`id`, `nombre`, `descripcion`, `precio`, `imagen`, `categoria`, `disponible`, `fecha_creacion`, `fecha_actualizacion`) VALUES
(1, 'Empanadas con ají', 'Tradicionales empanadas acompañadas de ají.', 15000.00, 'entrada1.png', 'plato', 1, '2025-05-27 13:24:11', NULL),
(2, 'Tostada española', 'Tostada al estilo español con ingredientes frescos.', 12000.00, 'entrada3.png', 'plato', 1, '2025-05-27 13:24:11', NULL),
(3, 'Sushi', 'Variedad de sushi fresco.', 25000.00, 'entrada4.png', 'plato', 1, '2025-05-27 13:24:11', NULL),
(4, 'Churrasco', 'Este corte se obtiene de la parte trasera de la res, acompañado con papas a la francesa y vegetales.', 45000.00, 'PLATO1.png', 'plato', 1, '2025-05-27 13:24:11', NULL),
(5, 'Ensalada marina', 'Contiene mariscos, lechuga, pequeños cortes de naranja y tomate, es acompañada de una vinagreta agridulce.', 30000.00, 'PLATO2.png', 'plato', 1, '2025-05-27 13:24:11', NULL),
(6, 'Filet Mignon', 'Un corte de res que se caracteriza por ser un corte muy tierno, este corte proviene de la parte de la cola de la res. Tiene como base una salsa de champiñón y zanahoria.', 40000.00, 'PLATO3.png', 'plato', 1, '2025-05-27 13:24:11', NULL),
(7, 'Pulpo', 'Este plato tiene como corte principal el pulpo y es acompañado de caviar y una salsa marinera.', 80000.00, 'PLATO4.png', 'plato', 1, '2025-05-27 13:24:11', NULL),
(8, 'Té helado', 'Bebida suave y refrescante.', 8000.00, 'te.jpg', 'bebida', 1, '2025-05-27 13:24:11', NULL),
(9, 'Limonada', 'Bebida de limón natural.', 5000.00, 'limonada1.jpg', 'bebida', 1, '2025-05-27 13:24:11', NULL),
(10, 'Agua mineral', 'Bebida refrescante y natural.', 2500.00, 'agua_mineral.jpg', 'bebida', 1, '2025-05-27 13:24:11', NULL),
(11, 'Coca Cola', 'Bebida gaseosa refrescante.', 4500.00, 'coca-cola.png', 'bebida', 1, '2025-05-27 13:24:11', NULL),
(12, 'Sprite', 'Gaseosa con sabor a limón y lima.', 3500.00, 'Sprite.webp', 'bebida', 1, '2025-05-27 13:24:11', NULL),
(13, 'Pepsi', 'Gaseosa refrescante de sabor cola.', 3500.00, 'pepsi.png', 'bebida', 1, '2025-05-27 13:24:11', NULL),
(14, 'Piña colada', 'Bebida tropical de piña y coco.', 8000.00, '125707_large.jpg', 'bebida', 1, '2025-05-27 13:24:11', NULL),
(15, 'Cerezada', 'Limón con cereza dulce.', 8000.00, 'limonada_cerezada.png', 'bebida', 1, '2025-05-27 13:24:11', NULL),
(16, 'Coctel', 'Mezcla refrescante con licor.', 20000.00, 'coctel.png', 'bebida', 1, '2025-05-27 13:24:11', NULL),
(17, 'Tiramisú', 'Clásico postre italiano con café y mascarpone.', 12000.00, 'tiramisu.jpg', 'postre', 1, '2025-05-27 13:24:11', NULL),
(18, 'Cheesecake', 'Tarta de queso con frutos rojos.', 10000.00, 'cheesecake.jpg', 'postre', 1, '2025-05-27 13:24:11', NULL),
(19, 'Helado artesanal', 'Helado cremoso de vainilla, chocolate o fresa.', 8000.00, 'helado.jpg', 'postre', 1, '2025-05-27 13:24:11', NULL),
(20, 'Flan', 'Flan casero con caramelo.', 7000.00, 'flan.jpg', 'postre', 1, '2025-05-27 13:24:11', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mesas`
--

CREATE TABLE `mesas` (
  `id` int(11) NOT NULL,
  `numero_mesa` int(11) NOT NULL,
  `capacidad` int(11) NOT NULL DEFAULT 4,
  `estado` enum('libre','ocupada','reservada','limpieza') NOT NULL DEFAULT 'libre',
  `ubicacion` varchar(100) DEFAULT NULL,
  `fecha_creacion` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `mesas`
--

INSERT INTO `mesas` (`id`, `numero_mesa`, `capacidad`, `estado`, `ubicacion`, `fecha_creacion`) VALUES
(1, 1, 2, 'libre', 'Zona principal', '2025-05-27 13:24:11'),
(2, 2, 4, 'libre', 'Zona principal', '2025-05-27 13:24:11'),
(3, 3, 4, 'libre', 'Zona principal', '2025-05-27 13:24:11'),
(4, 4, 6, 'libre', 'Zona principal', '2025-05-27 13:24:11'),
(5, 5, 2, 'libre', 'Terraza', '2025-05-27 13:24:11'),
(6, 6, 4, 'libre', 'Terraza', '2025-05-27 13:24:11'),
(7, 7, 8, 'libre', 'Salón privado', '2025-05-27 13:24:11'),
(8, 8, 4, 'libre', 'Zona principal', '2025-05-27 13:24:11'),
(9, 9, 2, 'libre', 'Barra', '2025-05-27 13:24:11'),
(10, 10, 4, 'libre', 'Zona principal', '2025-05-27 13:24:11');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedidos`
--

CREATE TABLE `pedidos` (
  `id` int(11) NOT NULL,
  `id_cliente` int(11) NOT NULL,
  `fecha` datetime NOT NULL DEFAULT current_timestamp(),
  `estado` enum('pendiente','en_preparacion','listo','en_entrega','entregado','cancelado') NOT NULL DEFAULT 'pendiente',
  `total` decimal(10,2) DEFAULT 0.00,
  `notas` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedido_mesa`
--

CREATE TABLE `pedido_mesa` (
  `id` int(11) NOT NULL,
  `id_pedido` int(11) NOT NULL,
  `id_mesa` int(11) NOT NULL,
  `fecha_asignacion` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `correo` varchar(150) NOT NULL,
  `password` varchar(255) NOT NULL,
  `rol` enum('admin','cocinero','mesero','empleado') NOT NULL DEFAULT 'mesero',
  `activo` tinyint(1) NOT NULL DEFAULT 1,
  `fecha_registro` datetime NOT NULL DEFAULT current_timestamp(),
  `ultimo_acceso` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `nombre`, `correo`, `password`, `rol`, `activo`, `fecha_registro`, `ultimo_acceso`) VALUES
(1, 'Administrador', 'admin@restaurante.com', '7488e331b8b64e5794da3fa4eb10ad5d', 'admin', 1, '2025-05-27 13:24:11', '2025-05-27 13:27:09');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_telefono` (`telefono`);

--
-- Indices de la tabla `configuracion_restaurante`
--
ALTER TABLE `configuracion_restaurante`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `detalle_pedido`
--
ALTER TABLE `detalle_pedido`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_pedido` (`id_pedido`);

--
-- Indices de la tabla `log_acciones`
--
ALTER TABLE `log_acciones`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_usuario` (`usuario_id`),
  ADD KEY `idx_fecha` (`fecha`),
  ADD KEY `idx_accion` (`accion`);

--
-- Indices de la tabla `menu_items`
--
ALTER TABLE `menu_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_categoria` (`categoria`),
  ADD KEY `idx_disponible` (`disponible`);

--
-- Indices de la tabla `mesas`
--
ALTER TABLE `mesas`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `numero_mesa` (`numero_mesa`),
  ADD KEY `idx_numero` (`numero_mesa`),
  ADD KEY `idx_estado` (`estado`);

--
-- Indices de la tabla `pedidos`
--
ALTER TABLE `pedidos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_estado` (`estado`),
  ADD KEY `idx_fecha` (`fecha`),
  ADD KEY `idx_cliente` (`id_cliente`);

--
-- Indices de la tabla `pedido_mesa`
--
ALTER TABLE `pedido_mesa`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_pedido` (`id_pedido`),
  ADD KEY `idx_mesa` (`id_mesa`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `correo` (`correo`),
  ADD KEY `idx_correo` (`correo`),
  ADD KEY `idx_rol` (`rol`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `clientes`
--
ALTER TABLE `clientes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `configuracion_restaurante`
--
ALTER TABLE `configuracion_restaurante`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `detalle_pedido`
--
ALTER TABLE `detalle_pedido`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `log_acciones`
--
ALTER TABLE `log_acciones`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `menu_items`
--
ALTER TABLE `menu_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT de la tabla `mesas`
--
ALTER TABLE `mesas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `pedidos`
--
ALTER TABLE `pedidos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `pedido_mesa`
--
ALTER TABLE `pedido_mesa`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `detalle_pedido`
--
ALTER TABLE `detalle_pedido`
  ADD CONSTRAINT `detalle_pedido_ibfk_1` FOREIGN KEY (`id_pedido`) REFERENCES `pedidos` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `log_acciones`
--
ALTER TABLE `log_acciones`
  ADD CONSTRAINT `log_acciones_ibfk_1` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`) ON DELETE SET NULL;

--
-- Filtros para la tabla `pedidos`
--
ALTER TABLE `pedidos`
  ADD CONSTRAINT `pedidos_ibfk_1` FOREIGN KEY (`id_cliente`) REFERENCES `clientes` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `pedido_mesa`
--
ALTER TABLE `pedido_mesa`
  ADD CONSTRAINT `pedido_mesa_ibfk_1` FOREIGN KEY (`id_pedido`) REFERENCES `pedidos` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `pedido_mesa_ibfk_2` FOREIGN KEY (`id_mesa`) REFERENCES `mesas` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
