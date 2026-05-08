-- phpMyAdmin SQL Dump
-- version 5.2.3
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:8889
-- Tiempo de generación: 05-05-2026 a las 23:57:16
-- Versión del servidor: 8.0.44
-- Versión de PHP: 8.3.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `biblioteca_ducky`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `alumnos`
--

CREATE TABLE `alumnos` (
  `id` int NOT NULL,
  `usuario_id` int NOT NULL,
  `carrera` varchar(255) DEFAULT NULL,
  `semestre` int DEFAULT NULL,
  `estado` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `alumnos`
--

INSERT INTO `alumnos` (`id`, `usuario_id`, `carrera`, `semestre`, `estado`) VALUES
(1, 3, 'Ingeniería en Sistemas', 5, 'activo'),
(2, 4, 'Administración de Empresas', 3, 'activo'),
(3, 8, 'Diseño Gráfico', 2, 'suspendido');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auditoria_accesos`
--

CREATE TABLE `auditoria_accesos` (
  `id` int NOT NULL,
  `usuario_id` int NOT NULL,
  `accion` varchar(255) NOT NULL,
  `fecha_hora` datetime NOT NULL,
  `ip` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `auditoria_accesos`
--

INSERT INTO `auditoria_accesos` (`id`, `usuario_id`, `accion`, `fecha_hora`, `ip`) VALUES
(1, 1, 'login', '2024-04-01 08:00:00', '192.168.1.10'),
(2, 2, 'login', '2024-04-01 09:00:00', '192.168.1.11'),
(3, 3, 'login', '2024-04-01 10:00:00', '192.168.1.50'),
(4, 1, 'logout', '2024-04-01 17:00:00', '192.168.1.10');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auditoria_sistema`
--

CREATE TABLE `auditoria_sistema` (
  `id` int NOT NULL,
  `usuario_id` int NOT NULL,
  `modulo` varchar(255) NOT NULL,
  `accion` varchar(255) NOT NULL,
  `descripcion` text,
  `fecha_hora` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `auditoria_sistema`
--

INSERT INTO `auditoria_sistema` (`id`, `usuario_id`, `modulo`, `accion`, `descripcion`, `fecha_hora`) VALUES
(1, 1, 'usuarios', 'crear', 'Se creó el usuario carlos.lopez@uni.edu', '2023-02-01 10:01:00'),
(2, 2, 'prestamos', 'crear', 'Se registró préstamo de copia CL-001', '2024-04-01 10:02:00'),
(3, 2, 'multas', 'crear', 'Se generó multa por retraso al usuario ALU003', '2024-02-16 08:01:00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `autores`
--

CREATE TABLE `autores` (
  `id` int NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `nacionalidad` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `autores`
--

INSERT INTO `autores` (`id`, `nombre`, `nacionalidad`) VALUES
(1, 'Gabriel García Márquez', 'Colombiana'),
(2, 'Donald Knuth', 'Estadounidense'),
(3, 'Robert C. Martin', 'Estadounidense'),
(4, 'Yuval Noah Harari', 'Israelí'),
(5, 'Mario Vargas Llosa', 'Peruana');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `bajas_libros`
--

CREATE TABLE `bajas_libros` (
  `id` int NOT NULL,
  `copia_id` int NOT NULL,
  `motivo` varchar(255) NOT NULL,
  `fecha_baja` datetime NOT NULL,
  `registrado_por` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `bajas_libros`
--

INSERT INTO `bajas_libros` (`id`, `copia_id`, `motivo`, `fecha_baja`, `registrado_por`) VALUES
(1, 7, 'Libro con daño irreparable en encuadernación', '2024-03-15 09:00:00', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias`
--

CREATE TABLE `categorias` (
  `id` int NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `descripcion` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `categorias`
--

INSERT INTO `categorias` (`id`, `nombre`, `descripcion`) VALUES
(1, 'Ciencias Exactas', 'Matemáticas, física, química'),
(2, 'Tecnología', 'Computación e ingeniería'),
(3, 'Literatura', 'Novela, cuento y poesía'),
(4, 'Historia', 'Historia universal y regional'),
(5, 'Administración', 'Negocios y gestión empresarial');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `colaboradores`
--

CREATE TABLE `colaboradores` (
  `id` int NOT NULL,
  `usuario_id` int NOT NULL,
  `area` varchar(255) DEFAULT NULL,
  `puesto` varchar(255) DEFAULT NULL,
  `estado` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `colaboradores`
--

INSERT INTO `colaboradores` (`id`, `usuario_id`, `area`, `puesto`, `estado`) VALUES
(1, 7, 'Biblioteca', 'Auxiliar de archivo', 'activo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `compras_libros`
--

CREATE TABLE `compras_libros` (
  `id` int NOT NULL,
  `solicitud_id` int DEFAULT NULL,
  `editorial_id` int DEFAULT NULL,
  `comprador_id` int NOT NULL,
  `fecha_compra` datetime NOT NULL,
  `monto_total` decimal(10,2) DEFAULT NULL,
  `moneda` varchar(255) DEFAULT NULL,
  `estado` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `compras_libros`
--

INSERT INTO `compras_libros` (`id`, `solicitud_id`, `editorial_id`, `comprador_id`, `fecha_compra`, `monto_total`, `moneda`, `estado`) VALUES
(1, 1, 1, 1, '2024-01-20 09:00:00', 750.00, 'MXN', 'completada');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `copias_libros`
--

CREATE TABLE `copias_libros` (
  `id` int NOT NULL,
  `libro_id` int NOT NULL,
  `codigo_interno` varchar(255) NOT NULL,
  `estado` varchar(255) NOT NULL,
  `fecha_adquisicion` datetime DEFAULT NULL,
  `precio_compra` decimal(10,2) DEFAULT NULL,
  `moneda` varchar(255) DEFAULT NULL,
  `observaciones` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `copias_libros`
--

INSERT INTO `copias_libros` (`id`, `libro_id`, `codigo_interno`, `estado`, `fecha_adquisicion`, `precio_compra`, `moneda`, `observaciones`) VALUES
(1, 1, 'CL-001', 'prestado', '2023-01-20 00:00:00', 280.00, 'MXN', NULL),
(2, 1, 'CL-002', 'disponible', '2023-01-20 00:00:00', 280.00, 'MXN', NULL),
(3, 2, 'CL-003', 'disponible', '2023-01-20 00:00:00', 520.00, 'MXN', 'Falta 1 pagina'),
(4, 2, 'CL-004', 'disponible', '2023-01-20 00:00:00', 520.00, 'MXN', NULL),
(5, 3, 'CL-005', 'disponible', '2023-01-21 00:00:00', 850.00, 'MXN', NULL),
(6, 4, 'CL-006', 'disponible', '2023-02-05 00:00:00', 230.00, 'MXN', NULL),
(7, 5, 'CL-007', 'disponible', '2023-02-05 00:00:00', 180.00, 'MXN', NULL),
(8, 5, 'CL-008', 'disponible', '2023-02-05 00:00:00', 180.00, 'MXN', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `devoluciones`
--

CREATE TABLE `devoluciones` (
  `id` int NOT NULL,
  `prestamo_id` int NOT NULL,
  `recibido_por` int NOT NULL,
  `fecha_devolucion` datetime NOT NULL,
  `condicion_libro` varchar(255) NOT NULL,
  `observaciones` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `devoluciones`
--

INSERT INTO `devoluciones` (`id`, `prestamo_id`, `recibido_por`, `fecha_devolucion`, `condicion_libro`, `observaciones`) VALUES
(1, 1, 2, '2024-04-13 10:30:00', 'buena', NULL),
(2, 3, 2, '2026-05-04 10:34:55', 'Bueno', ''),
(3, 2, 2, '2026-05-04 10:35:10', 'Bueno', ''),
(4, 4, 2, '2026-05-04 10:35:30', 'Bueno', ''),
(5, 5, 11, '2026-05-04 10:58:08', 'Daño menor', 'Falta 1 pagina');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `editoriales`
--

CREATE TABLE `editoriales` (
  `id` int NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `pais` varchar(255) DEFAULT NULL,
  `contacto` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `editoriales`
--

INSERT INTO `editoriales` (`id`, `nombre`, `pais`, `contacto`) VALUES
(1, 'Pearson', 'México', 'ventas@pearson.com.mx'),
(2, 'McGraw-Hill', 'México', 'info@mcgrawhill.com.mx'),
(3, 'Alfaguara', 'España', 'editorial@alfaguara.com'),
(4, 'Anaya', 'España', 'contacto@anaya.es'),
(5, 'Fondo de Cultura', 'México', 'fce@fondodeculturaeconomica.com');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `entidades_externas`
--

CREATE TABLE `entidades_externas` (
  `id` int NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `tipo` varchar(255) NOT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `estado` varchar(255) NOT NULL DEFAULT 'activo'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `entidades_externas`
--

INSERT INTO `entidades_externas` (`id`, `nombre`, `tipo`, `descripcion`, `estado`) VALUES
(1, 'Sistema Escolar', 'escolar', 'Entidad externa que provee alumnos inscritos', 'activo'),
(2, 'Recursos Humanos', 'recursos_humanos', 'Entidad externa que provee profesores y colaboradores', 'activo'),
(3, 'Tesorería', 'tesoreria', 'Entidad externa que valida pagos y multas', 'activo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `eventos_microcontrolador`
--

CREATE TABLE `eventos_microcontrolador` (
  `id` int NOT NULL,
  `microcontrolador_id` int NOT NULL,
  `accion` varchar(255) NOT NULL,
  `payload` json DEFAULT NULL,
  `fecha_evento` datetime NOT NULL,
  `estado` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `eventos_microcontrolador`
--

INSERT INTO `eventos_microcontrolador` (`id`, `microcontrolador_id`, `accion`, `payload`, `fecha_evento`, `estado`) VALUES
(1, 1, 'lectura_externa', '{\"origen\": \"escolar\", \"protocolo\": \"UART->HTTP gateway simulado\", \"registros_recibidos\": 3}', '2026-05-04 11:32:54', 'procesado'),
(2, 2, 'lectura_externa', '{\"origen\": \"recursos_humanos\", \"protocolo\": \"UART->HTTP gateway simulado\", \"registros_recibidos\": 3}', '2026-05-04 11:33:01', 'procesado'),
(3, 3, 'lectura_externa', '{\"origen\": \"tesoreria\", \"protocolo\": \"UART->HTTP gateway simulado\", \"registros_recibidos\": 0}', '2026-05-04 11:33:01', 'procesado');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `idiomas`
--

CREATE TABLE `idiomas` (
  `id` int NOT NULL,
  `nombre` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `idiomas`
--

INSERT INTO `idiomas` (`id`, `nombre`) VALUES
(1, 'Español'),
(3, 'Francés'),
(2, 'Inglés');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `libros`
--

CREATE TABLE `libros` (
  `id` int NOT NULL,
  `titulo` varchar(255) NOT NULL,
  `isbn` varchar(255) DEFAULT NULL,
  `editorial_id` int DEFAULT NULL,
  `categoria_id` int DEFAULT NULL,
  `idioma_id` int DEFAULT NULL,
  `anio_publicacion` int DEFAULT NULL,
  `paginas` int DEFAULT NULL,
  `ubicacion` varchar(255) DEFAULT NULL,
  `precio_reposicion` decimal(10,2) DEFAULT NULL,
  `descripcion` text,
  `tipo_uso` varchar(255) NOT NULL,
  `estado_catalogo` varchar(255) NOT NULL,
  `fecha_alta` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `libros`
--

INSERT INTO `libros` (`id`, `titulo`, `isbn`, `editorial_id`, `categoria_id`, `idioma_id`, `anio_publicacion`, `paginas`, `ubicacion`, `precio_reposicion`, `descripcion`, `tipo_uso`, `estado_catalogo`, `fecha_alta`) VALUES
(1, 'Cien años de soledad', '978-0307474728', 3, 3, 1, 1967, 417, 'A-01-03', 350.00, NULL, 'prestamo', 'disponible', '2023-01-15 10:00:00'),
(2, 'Clean Code', '978-0132350884', 2, 2, 2, 2008, 431, 'B-02-01', 620.00, NULL, 'prestamo', 'disponible', '2023-01-15 10:00:00'),
(3, 'The Art of Computer Programming', '978-0201896831', 1, 2, 2, 1968, 672, 'B-01-05', 980.00, NULL, 'consulta', 'disponible', '2023-01-16 10:00:00'),
(4, 'Sapiens', '978-0062316097', 4, 4, 1, 2011, 443, 'C-03-02', 280.00, NULL, 'prestamo', 'disponible', '2023-02-01 10:00:00'),
(5, 'La ciudad y los perros', '978-8420420738', 5, 3, 1, 1963, 352, 'A-02-01', 210.00, NULL, 'prestamo', 'disponible', '2023-02-01 10:00:00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `libro_autor`
--

CREATE TABLE `libro_autor` (
  `id` int NOT NULL,
  `libro_id` int NOT NULL,
  `autor_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `libro_autor`
--

INSERT INTO `libro_autor` (`id`, `libro_id`, `autor_id`) VALUES
(1, 1, 1),
(2, 2, 3),
(3, 3, 2),
(4, 4, 4),
(5, 5, 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `microcontroladores_integracion`
--

CREATE TABLE `microcontroladores_integracion` (
  `id` int NOT NULL,
  `entidad_externa_id` int NOT NULL,
  `codigo` varchar(255) NOT NULL,
  `ubicacion` varchar(255) DEFAULT NULL,
  `estado` varchar(255) NOT NULL DEFAULT 'activo',
  `ultimo_ping` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `microcontroladores_integracion`
--

INSERT INTO `microcontroladores_integracion` (`id`, `entidad_externa_id`, `codigo`, `ubicacion`, `estado`, `ultimo_ping`) VALUES
(1, 1, 'MCU-ESCOLAR-01', 'Rack de integración biblioteca', 'activo', '2026-05-04 11:32:54'),
(2, 2, 'MCU-RH-01', 'Rack de integración biblioteca', 'activo', '2026-05-04 11:33:01'),
(3, 3, 'MCU-TESORERIA-01', 'Rack de integración biblioteca', 'activo', '2026-05-04 11:33:01');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `multas`
--

CREATE TABLE `multas` (
  `id` int NOT NULL,
  `usuario_id` int NOT NULL,
  `prestamo_id` int DEFAULT NULL,
  `tipo_id` int NOT NULL,
  `monto` decimal(10,2) NOT NULL,
  `estado` varchar(255) NOT NULL,
  `fecha_generacion` datetime NOT NULL,
  `dias_retraso` int DEFAULT NULL,
  `observaciones` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `multas`
--

INSERT INTO `multas` (`id`, `usuario_id`, `prestamo_id`, `tipo_id`, `monto`, `estado`, `fecha_generacion`, `dias_retraso`, `observaciones`) VALUES
(1, 8, 4, 1, 75.00, 'pendiente', '2024-02-16 08:00:00', 15, NULL),
(2, 8, 4, 2, 200.00, 'pendiente', '2024-02-16 08:00:00', NULL, NULL),
(3, 5, 3, 1, 3605.00, 'pendiente', '2026-05-04 10:34:55', 721, 'Devolución tardía - 721 días'),
(4, 4, 2, 1, 3695.00, 'pendiente', '2026-05-04 10:35:10', 739, 'Devolución tardía - 739 días'),
(5, 8, 4, 1, 4040.00, 'pendiente', '2026-05-04 10:35:30', 808, 'Devolución tardía - 808 días');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `notificaciones`
--

CREATE TABLE `notificaciones` (
  `id` int NOT NULL,
  `usuario_id` int NOT NULL,
  `tipo` varchar(255) NOT NULL,
  `mensaje` text NOT NULL,
  `medio` varchar(255) DEFAULT NULL,
  `fecha_envio` datetime DEFAULT NULL,
  `estado` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `notificaciones`
--

INSERT INTO `notificaciones` (`id`, `usuario_id`, `tipo`, `mensaje`, `medio`, `fecha_envio`, `estado`) VALUES
(1, 4, 'vencimiento', 'Tu préstamo vence en 3 días.', 'correo', '2024-04-21 08:00:00', 'enviada'),
(2, 8, 'suspension', 'Tu cuenta ha sido suspendida por mora.', 'correo', '2024-03-01 08:00:00', 'enviada'),
(3, 3, 'reserva', 'Tu reserva del libro está lista para recoger.', 'correo', '2024-04-21 09:00:00', 'enviada');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pagos`
--

CREATE TABLE `pagos` (
  `id` int NOT NULL,
  `usuario_id` int NOT NULL,
  `multa_id` int NOT NULL,
  `entidad_externa_id` int DEFAULT NULL,
  `monto` decimal(10,2) NOT NULL,
  `concepto` varchar(255) DEFAULT NULL,
  `fecha_pago` datetime NOT NULL,
  `estado` varchar(255) NOT NULL,
  `metodo_pago` varchar(255) DEFAULT NULL,
  `registrado_por` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `pagos`
--

INSERT INTO `pagos` (`id`, `usuario_id`, `multa_id`, `entidad_externa_id`, `monto`, `concepto`, `fecha_pago`, `estado`, `metodo_pago`, `registrado_por`) VALUES
(1, 8, 1, NULL, 75.00, 'Pago multa por retraso', '2024-03-10 10:00:00', 'completado', 'efectivo', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `permisos`
--

CREATE TABLE `permisos` (
  `id` int NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `descripcion` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `permisos`
--

INSERT INTO `permisos` (`id`, `nombre`, `descripcion`) VALUES
(1, 'ver_catalogo', 'Ver libros disponibles'),
(2, 'realizar_prestamo', 'Solicitar préstamo de un libro'),
(3, 'gestionar_usuarios', 'Crear y editar usuarios'),
(4, 'gestionar_catalogo', 'Agregar y editar libros'),
(5, 'gestionar_multas', 'Crear y cobrar multas'),
(6, 'ver_reportes', 'Acceso a reportes y auditoría'),
(7, 'crearUsuarios', 'Crear usuarios'),
(8, 'suspenderUsuarios', 'Suspender usuarios'),
(9, 'registrarPrestamo', 'Registrar préstamos'),
(10, 'registrarDevolucion', 'Registrar devoluciones'),
(11, 'renovarPrestamo', 'Renovar préstamos'),
(12, 'gestionarCatalogo', 'Gestionar catálogo de libros'),
(13, 'buscarLibros', 'Buscar libros'),
(14, 'consultarCatalogo', 'Consultar catálogo'),
(15, 'verReportes', 'Ver reportes');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `prestamos`
--

CREATE TABLE `prestamos` (
  `id` int NOT NULL,
  `usuario_id` int NOT NULL,
  `copia_id` int NOT NULL,
  `bibliotecario_id` int NOT NULL,
  `fecha_prestamo` datetime NOT NULL,
  `fecha_vencimiento` datetime NOT NULL,
  `numero_renovaciones` int NOT NULL DEFAULT '0',
  `estado` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `prestamos`
--

INSERT INTO `prestamos` (`id`, `usuario_id`, `copia_id`, `bibliotecario_id`, `fecha_prestamo`, `fecha_vencimiento`, `numero_renovaciones`, `estado`) VALUES
(1, 3, 1, 2, '2024-04-01 10:00:00', '2024-04-15 10:00:00', 0, 'devuelto'),
(2, 4, 4, 2, '2024-04-10 11:00:00', '2024-04-24 11:00:00', 1, 'devuelto'),
(3, 5, 6, 2, '2024-04-12 09:00:00', '2024-05-12 09:00:00', 0, 'devuelto'),
(4, 8, 7, 2, '2024-02-01 10:00:00', '2024-02-15 10:00:00', 0, 'devuelto'),
(5, 11, 3, 11, '2026-05-04 10:57:42', '2026-05-19 00:00:00', 0, 'devuelto');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `profesores`
--

CREATE TABLE `profesores` (
  `id` int NOT NULL,
  `usuario_id` int NOT NULL,
  `departamento` varchar(255) DEFAULT NULL,
  `especialidad` varchar(255) DEFAULT NULL,
  `estado` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `profesores`
--

INSERT INTO `profesores` (`id`, `usuario_id`, `departamento`, `especialidad`, `estado`) VALUES
(1, 5, 'Ciencias Exactas', 'Matemáticas', 'activo'),
(2, 6, 'Humanidades', 'Literatura', 'activo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `recibos`
--

CREATE TABLE `recibos` (
  `id` int NOT NULL,
  `prestamo_id` int NOT NULL,
  `tipo` varchar(255) NOT NULL,
  `medio_envio` varchar(255) DEFAULT NULL,
  `fecha_generacion` datetime NOT NULL,
  `generado_por` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `recibos`
--

INSERT INTO `recibos` (`id`, `prestamo_id`, `tipo`, `medio_envio`, `fecha_generacion`, `generado_por`) VALUES
(1, 1, 'prestamo', 'correo', '2024-04-01 10:05:00', 2),
(2, 1, 'devolucion', 'correo', '2024-04-13 10:35:00', 2),
(3, 2, 'prestamo', 'correo', '2024-04-10 11:05:00', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `registros_entidad_externa`
--

CREATE TABLE `registros_entidad_externa` (
  `id` int NOT NULL,
  `entidad_externa_id` int NOT NULL,
  `clave_externa` varchar(255) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `correo` varchar(255) DEFAULT NULL,
  `matricula` varchar(255) DEFAULT NULL,
  `rol_sugerido` varchar(255) NOT NULL,
  `area` varchar(255) DEFAULT NULL,
  `payload` json DEFAULT NULL,
  `estado` varchar(255) NOT NULL DEFAULT 'pendiente',
  `fecha_sincronizacion` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `registros_entidad_externa`
--

INSERT INTO `registros_entidad_externa` (`id`, `entidad_externa_id`, `clave_externa`, `nombre`, `correo`, `matricula`, `rol_sugerido`, `area`, `payload`, `estado`, `fecha_sincronizacion`) VALUES
(1, 1, 'ESC-ALU-1001', 'Ana Sofia Reyes', 'ana.reyes@uni.edu', 'ALU-1001', 'alumno', 'Ingeniería en Software', '{\"sensor\": \"lector-rfid-escolar\", \"semestre\": 4}', 'pendiente', '2026-05-04 11:32:54'),
(2, 1, 'ESC-ALU-1002', 'Luis Martinez Gomez', 'luis.martinez@uni.edu', 'ALU-1002', 'alumno', 'Arquitectura', '{\"sensor\": \"lector-rfid-escolar\", \"semestre\": 2}', 'pendiente', '2026-05-04 11:32:54'),
(3, 1, 'ESC-ALU-1003', 'Valeria Perez', 'valeria.perez@uni.edu', 'ALU-1003', 'alumno', 'Derecho', '{\"sensor\": \"lector-rfid-escolar\", \"semestre\": 6}', 'pendiente', '2026-05-04 11:32:54'),
(4, 2, 'RH-PRO-2001', 'Dr. Roberto Silva', 'roberto.silva@uni.edu', 'PRO-2001', 'profesor', 'Ciencias Exactas', '{\"puesto\": \"Profesor titular\", \"sensor\": \"nodo-rh\"}', 'pendiente', '2026-05-04 11:32:54'),
(5, 2, 'RH-PRO-2002', 'Mtra. Carmen Rodriguez', 'carmen.rodriguez@uni.edu', 'PRO-2002', 'profesor', 'Humanidades', '{\"puesto\": \"Profesora\", \"sensor\": \"nodo-rh\"}', 'pendiente', '2026-05-04 11:32:54'),
(6, 2, 'RH-COL-3001', 'Mariana Torres', 'mariana.torres@ducky.edu', 'COL-3001', 'colaborador', 'Biblioteca', '{\"puesto\": \"Auxiliar administrativo\", \"sensor\": \"nodo-rh\"}', 'pendiente', '2026-05-04 11:32:54');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `renovaciones`
--

CREATE TABLE `renovaciones` (
  `id` int NOT NULL,
  `prestamo_id` int NOT NULL,
  `fecha_renovacion` datetime NOT NULL,
  `fecha_vencimiento_anterior` datetime NOT NULL,
  `fecha_vencimiento_nueva` datetime NOT NULL,
  `autorizado_por` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `renovaciones`
--

INSERT INTO `renovaciones` (`id`, `prestamo_id`, `fecha_renovacion`, `fecha_vencimiento_anterior`, `fecha_vencimiento_nueva`, `autorizado_por`) VALUES
(1, 2, '2024-04-24 09:00:00', '2024-04-24 11:00:00', '2024-05-08 11:00:00', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reservas`
--

CREATE TABLE `reservas` (
  `id` int NOT NULL,
  `usuario_id` int NOT NULL,
  `libro_id` int NOT NULL,
  `fecha_reserva` datetime NOT NULL,
  `fecha_expiracion` datetime DEFAULT NULL,
  `estado` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `reservas`
--

INSERT INTO `reservas` (`id`, `usuario_id`, `libro_id`, `fecha_reserva`, `fecha_expiracion`, `estado`) VALUES
(1, 3, 2, '2024-04-20 12:00:00', '2024-04-27 12:00:00', 'activa'),
(2, 6, 1, '2024-04-18 10:00:00', '2024-04-25 10:00:00', 'expirada');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles`
--

CREATE TABLE `roles` (
  `id` int NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `descripcion` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `roles`
--

INSERT INTO `roles` (`id`, `nombre`, `descripcion`) VALUES
(1, 'admin', 'Acceso total al sistema'),
(2, 'bibliotecario', 'Gestión de préstamos y catálogo'),
(3, 'alumno', 'Usuario registrado como alumno'),
(4, 'profesor', 'Usuario registrado como profesor'),
(5, 'colaborador', 'Personal interno no docente');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rol_permisos`
--

CREATE TABLE `rol_permisos` (
  `id` int NOT NULL,
  `rol_id` int NOT NULL,
  `permiso_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `rol_permisos`
--

INSERT INTO `rol_permisos` (`id`, `rol_id`, `permiso_id`) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 1, 3),
(4, 1, 4),
(5, 1, 5),
(6, 1, 6),
(18, 1, 7),
(23, 1, 8),
(21, 1, 9),
(20, 1, 10),
(22, 1, 11),
(19, 1, 12),
(16, 1, 13),
(17, 1, 14),
(24, 1, 15),
(7, 2, 1),
(8, 2, 2),
(9, 2, 4),
(10, 2, 5),
(35, 2, 9),
(34, 2, 10),
(36, 2, 11),
(33, 2, 12),
(31, 2, 13),
(32, 2, 14),
(37, 2, 15),
(11, 3, 1),
(12, 3, 2),
(38, 3, 13),
(39, 3, 14),
(13, 4, 1),
(14, 4, 2),
(15, 5, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `solicitudes_compra`
--

CREATE TABLE `solicitudes_compra` (
  `id` int NOT NULL,
  `usuario_id` int NOT NULL,
  `titulo_solicitado` varchar(255) NOT NULL,
  `autor_solicitado` varchar(255) DEFAULT NULL,
  `editorial` varchar(255) DEFAULT NULL,
  `motivo` text,
  `fecha_solicitud` datetime NOT NULL,
  `estado` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `solicitudes_compra`
--

INSERT INTO `solicitudes_compra` (`id`, `usuario_id`, `titulo_solicitado`, `autor_solicitado`, `editorial`, `motivo`, `fecha_solicitud`, `estado`) VALUES
(1, 5, 'Introducción al Análisis Matemático', 'Tom Apostol', NULL, 'Material de apoyo para curso', '2024-01-10 10:00:00', 'aprobada'),
(2, 3, 'El Principito', 'Antoine de Saint-Exupéry', NULL, 'Lectura recomendada', '2024-02-15 11:00:00', 'pendiente');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `suspensiones`
--

CREATE TABLE `suspensiones` (
  `id` int NOT NULL,
  `usuario_id` int NOT NULL,
  `motivo` varchar(255) NOT NULL,
  `fecha_inicio` datetime NOT NULL,
  `fecha_fin` datetime DEFAULT NULL,
  `estado` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `suspensiones`
--

INSERT INTO `suspensiones` (`id`, `usuario_id`, `motivo`, `fecha_inicio`, `fecha_fin`, `estado`) VALUES
(1, 8, 'Libro no devuelto en plazo', '2024-03-01 00:00:00', '2024-04-01 00:00:00', 'activa');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipos_multa`
--

CREATE TABLE `tipos_multa` (
  `id` int NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `monto_base` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tipos_multa`
--

INSERT INTO `tipos_multa` (`id`, `nombre`, `descripcion`, `monto_base`) VALUES
(1, 'retraso', 'Multa por devolución tardía (por día)', 5.00),
(2, 'daño', 'Multa por daño al libro', 200.00),
(3, 'perdida', 'Multa por pérdida del libro', 500.00);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `matricula` varchar(255) DEFAULT NULL,
  `correo` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `rol_id` int NOT NULL,
  `entidad_externa_id` int DEFAULT NULL,
  `estado` varchar(255) NOT NULL,
  `fecha_creacion` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `nombre`, `matricula`, `correo`, `password`, `rol_id`, `entidad_externa_id`, `estado`, `fecha_creacion`) VALUES
(1, 'Ana García', 'ADM001', 'ana.garcia@biblio.edu', 'hashed_pw_1', 1, NULL, 'activo', '2023-01-10 08:00:00'),
(2, 'Luis Martínez', 'BIB001', 'luis.martinez@biblio.edu', 'hashed_pw_2', 2, NULL, 'activo', '2023-01-11 09:00:00'),
(3, 'Carlos López', 'ALU001', 'carlos.lopez@uni.edu', 'hashed_pw_3', 3, NULL, 'activo', '2023-02-01 10:00:00'),
(4, 'María Rodríguez', 'ALU002', 'maria.rodriguez@uni.edu', 'hashed_pw_4', 3, NULL, 'activo', '2023-02-05 10:00:00'),
(5, 'Jorge Hernández', 'PRO001', 'jorge.hernandez@uni.edu', 'hashed_pw_5', 4, NULL, 'activo', '2023-01-15 08:30:00'),
(6, 'Sofía Torres', 'PRO002', 'sofia.torres@uni.edu', 'hashed_pw_6', 4, NULL, 'activo', '2023-01-20 08:30:00'),
(7, 'Pedro Ramírez', 'COL001', 'pedro.ramirez@biblio.edu', 'hashed_pw_7', 5, NULL, 'activo', '2023-01-12 09:00:00'),
(8, 'Laura Díaz', 'ALU003', 'laura.diaz@uni.edu', 'hashed_pw_8', 3, NULL, 'suspendido', '2023-03-01 10:00:00'),
(9, 'Admin Prueba', 'ADM-TEST', 'admin.prueba@ducky.edu', '$2y$10$lvHBbfm2YYjFz1EJok77qOxxVd/lcRdkIzUGSCqi2SrarfmVVePxC', 1, NULL, 'activo', '2026-05-04 09:51:57'),
(10, 'Bibliotecario Prueba', 'BIB-TEST', 'biblio.prueba@ducky.edu', '$2y$10$AsvCzQsnPtpGd5UYlxtf9uVjzJtuXrohf12RG5VpgGH5/qfZW1FKO', 2, NULL, 'activo', '2026-05-04 09:51:57'),
(11, 'Alumno Prueba', 'ALU-TEST', 'alumno.prueba@ducky.edu', '$2y$10$3ksCpqv3OFn/Ar8h1bVD/.JEzhMzI50ZWqL5rWbFBgxxdUpqNEZeS', 3, NULL, 'activo', '2026-05-04 09:51:57');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `alumnos`
--
ALTER TABLE `alumnos`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `usuario_id` (`usuario_id`);

--
-- Indices de la tabla `auditoria_accesos`
--
ALTER TABLE `auditoria_accesos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `usuario_id` (`usuario_id`);

--
-- Indices de la tabla `auditoria_sistema`
--
ALTER TABLE `auditoria_sistema`
  ADD PRIMARY KEY (`id`),
  ADD KEY `usuario_id` (`usuario_id`);

--
-- Indices de la tabla `autores`
--
ALTER TABLE `autores`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `bajas_libros`
--
ALTER TABLE `bajas_libros`
  ADD PRIMARY KEY (`id`),
  ADD KEY `copia_id` (`copia_id`),
  ADD KEY `registrado_por` (`registrado_por`);

--
-- Indices de la tabla `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nombre` (`nombre`);

--
-- Indices de la tabla `colaboradores`
--
ALTER TABLE `colaboradores`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `usuario_id` (`usuario_id`);

--
-- Indices de la tabla `compras_libros`
--
ALTER TABLE `compras_libros`
  ADD PRIMARY KEY (`id`),
  ADD KEY `solicitud_id` (`solicitud_id`),
  ADD KEY `editorial_id` (`editorial_id`),
  ADD KEY `comprador_id` (`comprador_id`);

--
-- Indices de la tabla `copias_libros`
--
ALTER TABLE `copias_libros`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `codigo_interno` (`codigo_interno`),
  ADD KEY `libro_id` (`libro_id`);

--
-- Indices de la tabla `devoluciones`
--
ALTER TABLE `devoluciones`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `prestamo_id` (`prestamo_id`),
  ADD KEY `recibido_por` (`recibido_por`);

--
-- Indices de la tabla `editoriales`
--
ALTER TABLE `editoriales`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nombre` (`nombre`);

--
-- Indices de la tabla `entidades_externas`
--
ALTER TABLE `entidades_externas`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nombre` (`nombre`),
  ADD UNIQUE KEY `tipo` (`tipo`);

--
-- Indices de la tabla `eventos_microcontrolador`
--
ALTER TABLE `eventos_microcontrolador`
  ADD PRIMARY KEY (`id`),
  ADD KEY `microcontrolador_id` (`microcontrolador_id`);

--
-- Indices de la tabla `idiomas`
--
ALTER TABLE `idiomas`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nombre` (`nombre`);

--
-- Indices de la tabla `libros`
--
ALTER TABLE `libros`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `isbn` (`isbn`),
  ADD KEY `editorial_id` (`editorial_id`),
  ADD KEY `categoria_id` (`categoria_id`),
  ADD KEY `idioma_id` (`idioma_id`);

--
-- Indices de la tabla `libro_autor`
--
ALTER TABLE `libro_autor`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `libro_id` (`libro_id`,`autor_id`),
  ADD KEY `autor_id` (`autor_id`);

--
-- Indices de la tabla `microcontroladores_integracion`
--
ALTER TABLE `microcontroladores_integracion`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `codigo` (`codigo`),
  ADD KEY `entidad_externa_id` (`entidad_externa_id`);

--
-- Indices de la tabla `multas`
--
ALTER TABLE `multas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `usuario_id` (`usuario_id`),
  ADD KEY `prestamo_id` (`prestamo_id`),
  ADD KEY `tipo_id` (`tipo_id`);

--
-- Indices de la tabla `notificaciones`
--
ALTER TABLE `notificaciones`
  ADD PRIMARY KEY (`id`),
  ADD KEY `usuario_id` (`usuario_id`);

--
-- Indices de la tabla `pagos`
--
ALTER TABLE `pagos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `usuario_id` (`usuario_id`),
  ADD KEY `multa_id` (`multa_id`),
  ADD KEY `registrado_por` (`registrado_por`);

--
-- Indices de la tabla `permisos`
--
ALTER TABLE `permisos`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nombre` (`nombre`);

--
-- Indices de la tabla `prestamos`
--
ALTER TABLE `prestamos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `usuario_id` (`usuario_id`),
  ADD KEY `copia_id` (`copia_id`),
  ADD KEY `bibliotecario_id` (`bibliotecario_id`);

--
-- Indices de la tabla `profesores`
--
ALTER TABLE `profesores`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `usuario_id` (`usuario_id`);

--
-- Indices de la tabla `recibos`
--
ALTER TABLE `recibos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `prestamo_id` (`prestamo_id`),
  ADD KEY `generado_por` (`generado_por`);

--
-- Indices de la tabla `registros_entidad_externa`
--
ALTER TABLE `registros_entidad_externa`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `clave_externa` (`clave_externa`),
  ADD KEY `entidad_externa_id` (`entidad_externa_id`);

--
-- Indices de la tabla `renovaciones`
--
ALTER TABLE `renovaciones`
  ADD PRIMARY KEY (`id`),
  ADD KEY `prestamo_id` (`prestamo_id`),
  ADD KEY `autorizado_por` (`autorizado_por`);

--
-- Indices de la tabla `reservas`
--
ALTER TABLE `reservas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `usuario_id` (`usuario_id`),
  ADD KEY `libro_id` (`libro_id`);

--
-- Indices de la tabla `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nombre` (`nombre`);

--
-- Indices de la tabla `rol_permisos`
--
ALTER TABLE `rol_permisos`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `rol_id` (`rol_id`,`permiso_id`),
  ADD KEY `permiso_id` (`permiso_id`);

--
-- Indices de la tabla `solicitudes_compra`
--
ALTER TABLE `solicitudes_compra`
  ADD PRIMARY KEY (`id`),
  ADD KEY `usuario_id` (`usuario_id`);

--
-- Indices de la tabla `suspensiones`
--
ALTER TABLE `suspensiones`
  ADD PRIMARY KEY (`id`),
  ADD KEY `usuario_id` (`usuario_id`);

--
-- Indices de la tabla `tipos_multa`
--
ALTER TABLE `tipos_multa`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nombre` (`nombre`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `correo` (`correo`),
  ADD UNIQUE KEY `matricula` (`matricula`),
  ADD KEY `rol_id` (`rol_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `alumnos`
--
ALTER TABLE `alumnos`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `auditoria_accesos`
--
ALTER TABLE `auditoria_accesos`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `auditoria_sistema`
--
ALTER TABLE `auditoria_sistema`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `autores`
--
ALTER TABLE `autores`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `bajas_libros`
--
ALTER TABLE `bajas_libros`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `categorias`
--
ALTER TABLE `categorias`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `colaboradores`
--
ALTER TABLE `colaboradores`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `compras_libros`
--
ALTER TABLE `compras_libros`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `copias_libros`
--
ALTER TABLE `copias_libros`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `devoluciones`
--
ALTER TABLE `devoluciones`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `editoriales`
--
ALTER TABLE `editoriales`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `entidades_externas`
--
ALTER TABLE `entidades_externas`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `eventos_microcontrolador`
--
ALTER TABLE `eventos_microcontrolador`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `idiomas`
--
ALTER TABLE `idiomas`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `libros`
--
ALTER TABLE `libros`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `libro_autor`
--
ALTER TABLE `libro_autor`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `microcontroladores_integracion`
--
ALTER TABLE `microcontroladores_integracion`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `multas`
--
ALTER TABLE `multas`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `notificaciones`
--
ALTER TABLE `notificaciones`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `pagos`
--
ALTER TABLE `pagos`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `permisos`
--
ALTER TABLE `permisos`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de la tabla `prestamos`
--
ALTER TABLE `prestamos`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `profesores`
--
ALTER TABLE `profesores`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `recibos`
--
ALTER TABLE `recibos`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `registros_entidad_externa`
--
ALTER TABLE `registros_entidad_externa`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT de la tabla `renovaciones`
--
ALTER TABLE `renovaciones`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `reservas`
--
ALTER TABLE `reservas`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `rol_permisos`
--
ALTER TABLE `rol_permisos`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT de la tabla `solicitudes_compra`
--
ALTER TABLE `solicitudes_compra`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `suspensiones`
--
ALTER TABLE `suspensiones`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `tipos_multa`
--
ALTER TABLE `tipos_multa`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `alumnos`
--
ALTER TABLE `alumnos`
  ADD CONSTRAINT `alumnos_ibfk_1` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`);

--
-- Filtros para la tabla `auditoria_accesos`
--
ALTER TABLE `auditoria_accesos`
  ADD CONSTRAINT `auditoria_accesos_ibfk_1` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`);

--
-- Filtros para la tabla `auditoria_sistema`
--
ALTER TABLE `auditoria_sistema`
  ADD CONSTRAINT `auditoria_sistema_ibfk_1` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`);

--
-- Filtros para la tabla `bajas_libros`
--
ALTER TABLE `bajas_libros`
  ADD CONSTRAINT `bajas_libros_ibfk_1` FOREIGN KEY (`copia_id`) REFERENCES `copias_libros` (`id`),
  ADD CONSTRAINT `bajas_libros_ibfk_2` FOREIGN KEY (`registrado_por`) REFERENCES `usuarios` (`id`);

--
-- Filtros para la tabla `colaboradores`
--
ALTER TABLE `colaboradores`
  ADD CONSTRAINT `colaboradores_ibfk_1` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`);

--
-- Filtros para la tabla `compras_libros`
--
ALTER TABLE `compras_libros`
  ADD CONSTRAINT `compras_libros_ibfk_1` FOREIGN KEY (`solicitud_id`) REFERENCES `solicitudes_compra` (`id`),
  ADD CONSTRAINT `compras_libros_ibfk_2` FOREIGN KEY (`editorial_id`) REFERENCES `editoriales` (`id`),
  ADD CONSTRAINT `compras_libros_ibfk_3` FOREIGN KEY (`comprador_id`) REFERENCES `usuarios` (`id`);

--
-- Filtros para la tabla `copias_libros`
--
ALTER TABLE `copias_libros`
  ADD CONSTRAINT `copias_libros_ibfk_1` FOREIGN KEY (`libro_id`) REFERENCES `libros` (`id`);

--
-- Filtros para la tabla `devoluciones`
--
ALTER TABLE `devoluciones`
  ADD CONSTRAINT `devoluciones_ibfk_1` FOREIGN KEY (`prestamo_id`) REFERENCES `prestamos` (`id`),
  ADD CONSTRAINT `devoluciones_ibfk_2` FOREIGN KEY (`recibido_por`) REFERENCES `usuarios` (`id`);

--
-- Filtros para la tabla `libros`
--
ALTER TABLE `libros`
  ADD CONSTRAINT `libros_ibfk_1` FOREIGN KEY (`editorial_id`) REFERENCES `editoriales` (`id`),
  ADD CONSTRAINT `libros_ibfk_2` FOREIGN KEY (`categoria_id`) REFERENCES `categorias` (`id`),
  ADD CONSTRAINT `libros_ibfk_3` FOREIGN KEY (`idioma_id`) REFERENCES `idiomas` (`id`);

--
-- Filtros para la tabla `libro_autor`
--
ALTER TABLE `libro_autor`
  ADD CONSTRAINT `libro_autor_ibfk_1` FOREIGN KEY (`libro_id`) REFERENCES `libros` (`id`),
  ADD CONSTRAINT `libro_autor_ibfk_2` FOREIGN KEY (`autor_id`) REFERENCES `autores` (`id`);

--
-- Filtros para la tabla `multas`
--
ALTER TABLE `multas`
  ADD CONSTRAINT `multas_ibfk_1` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`),
  ADD CONSTRAINT `multas_ibfk_2` FOREIGN KEY (`prestamo_id`) REFERENCES `prestamos` (`id`),
  ADD CONSTRAINT `multas_ibfk_3` FOREIGN KEY (`tipo_id`) REFERENCES `tipos_multa` (`id`);

--
-- Filtros para la tabla `notificaciones`
--
ALTER TABLE `notificaciones`
  ADD CONSTRAINT `notificaciones_ibfk_1` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`);

--
-- Filtros para la tabla `pagos`
--
ALTER TABLE `pagos`
  ADD CONSTRAINT `pagos_ibfk_1` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`),
  ADD CONSTRAINT `pagos_ibfk_2` FOREIGN KEY (`multa_id`) REFERENCES `multas` (`id`),
  ADD CONSTRAINT `pagos_ibfk_3` FOREIGN KEY (`registrado_por`) REFERENCES `usuarios` (`id`);

--
-- Filtros para la tabla `prestamos`
--
ALTER TABLE `prestamos`
  ADD CONSTRAINT `prestamos_ibfk_1` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`),
  ADD CONSTRAINT `prestamos_ibfk_2` FOREIGN KEY (`copia_id`) REFERENCES `copias_libros` (`id`),
  ADD CONSTRAINT `prestamos_ibfk_3` FOREIGN KEY (`bibliotecario_id`) REFERENCES `usuarios` (`id`);

--
-- Filtros para la tabla `profesores`
--
ALTER TABLE `profesores`
  ADD CONSTRAINT `profesores_ibfk_1` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`);

--
-- Filtros para la tabla `recibos`
--
ALTER TABLE `recibos`
  ADD CONSTRAINT `recibos_ibfk_1` FOREIGN KEY (`prestamo_id`) REFERENCES `prestamos` (`id`),
  ADD CONSTRAINT `recibos_ibfk_2` FOREIGN KEY (`generado_por`) REFERENCES `usuarios` (`id`);

--
-- Filtros para la tabla `renovaciones`
--
ALTER TABLE `renovaciones`
  ADD CONSTRAINT `renovaciones_ibfk_1` FOREIGN KEY (`prestamo_id`) REFERENCES `prestamos` (`id`),
  ADD CONSTRAINT `renovaciones_ibfk_2` FOREIGN KEY (`autorizado_por`) REFERENCES `usuarios` (`id`);

--
-- Filtros para la tabla `reservas`
--
ALTER TABLE `reservas`
  ADD CONSTRAINT `reservas_ibfk_1` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`),
  ADD CONSTRAINT `reservas_ibfk_2` FOREIGN KEY (`libro_id`) REFERENCES `libros` (`id`);

--
-- Filtros para la tabla `rol_permisos`
--
ALTER TABLE `rol_permisos`
  ADD CONSTRAINT `rol_permisos_ibfk_1` FOREIGN KEY (`rol_id`) REFERENCES `roles` (`id`),
  ADD CONSTRAINT `rol_permisos_ibfk_2` FOREIGN KEY (`permiso_id`) REFERENCES `permisos` (`id`);

--
-- Filtros para la tabla `solicitudes_compra`
--
ALTER TABLE `solicitudes_compra`
  ADD CONSTRAINT `solicitudes_compra_ibfk_1` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`);

--
-- Filtros para la tabla `suspensiones`
--
ALTER TABLE `suspensiones`
  ADD CONSTRAINT `suspensiones_ibfk_1` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`);

--
-- Filtros para la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD CONSTRAINT `usuarios_ibfk_1` FOREIGN KEY (`rol_id`) REFERENCES `roles` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
