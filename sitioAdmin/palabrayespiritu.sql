-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 24-03-2022 a las 22:48:54
-- Versión del servidor: 10.4.20-MariaDB
-- Versión de PHP: 7.3.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `palabrayespiritu`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `admmenu`
--

CREATE TABLE `admmenu` (
  `idMenu` int(11) NOT NULL,
  `idDiv` varchar(100) DEFAULT NULL,
  `paginaHref` varchar(100) DEFAULT NULL,
  `tituloMenu` varchar(100) DEFAULT NULL,
  `iconoDelMenu` varchar(100) DEFAULT NULL,
  `orden` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `admmenu`
--

INSERT INTO `admmenu` (`idMenu`, `idDiv`, `paginaHref`, `tituloMenu`, `iconoDelMenu`, `orden`) VALUES
(1, 'catEtiquetasEntrada', 'CatContenidoTextual', 'Catálogo de contenido textual', 'fa fa-users', 1),
(5, 'admUsuarios', 'Usuarios', 'Administración de usuarios', 'fa fa-user-circle', 6),
(15, 'registroAudiovisual', 'RegistroContenidoAudiovisual', 'Registro de contenido audiovisual', 'fa fa-users', 1),
(11, 'admRespalda', 'Respalda', 'Respaldar base de datos', 'fa fa-download', 7),
(16, 'catContenidoAudiovisual', 'CatContenidoAudiovisual', 'Catálogo de contenido audiovisual', NULL, NULL),
(17, 'registroTextual', 'registroContenidoTextual', 'Registro de contenido textual', NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `admusuariomenu`
--

CREATE TABLE `admusuariomenu` (
  `id` int(11) NOT NULL,
  `idUsuario` int(11) NOT NULL,
  `idMenu` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `admusuariomenu`
--

INSERT INTO `admusuariomenu` (`id`, `idUsuario`, `idMenu`) VALUES
(137, 1, 1),
(5, 1, 5),
(143, 1, 15),
(136, 1, 16),
(138, 11, 15),
(139, 11, 1),
(140, 11, 16),
(145, 1, 17);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `admusuarios`
--

CREATE TABLE `admusuarios` (
  `idUsuario` int(11) NOT NULL,
  `nombreUsuario` varchar(100) DEFAULT NULL,
  `clave` varchar(20) DEFAULT NULL,
  `pwd` varchar(50) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `admusuarios`
--

INSERT INTO `admusuarios` (`idUsuario`, `nombreUsuario`, `clave`, `pwd`) VALUES
(1, 'Lic. Joel Clemente Serrano', 'jclemente', '906de634c48fb7d34136160b4c353ae4'),
(11, 'Uziel Clemente Cruz', 'uclemente', '52c7915d4e0b6d93268b1f63bfd4578b');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `catcontenidoaudiovisual`
--

CREATE TABLE `catcontenidoaudiovisual` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `descripcion` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `catcontenidoaudiovisual`
--

INSERT INTO `catcontenidoaudiovisual` (`id`, `nombre`, `descripcion`) VALUES
(1, 'Discipulado', 'Una guía en el camino de una nueva vida en Cristo'),
(2, 'Femenil', 'Materiales del Anuario de la Unión de Sociedades Femeniles de la Iglesia Nacional Presbiteriana de México.'),
(3, 'Respuestas de la fe reformada a situaciones de la vida', 'Un punto de vista a situaciones en la vida con un toque apologético'),
(4, 'Consejos para padres', 'Consejería bíblica y oportuna para los padres'),
(5, 'Escuela de formación cristiana', 'Una ventana a la doctrina bíblica en tiempos actuales'),
(6, 'Proclamación de la Palabra', 'Cultos dominicales'),
(7, 'Diálogos pastorales', 'Un diálogo sobre asuntos de carácter práctico y actuales en la vida de la iglesia');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `catcontenidotextual`
--

CREATE TABLE `catcontenidotextual` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `descripcion` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `catcontenidotextual`
--

INSERT INTO `catcontenidotextual` (`id`, `nombre`, `descripcion`) VALUES
(1, 'Devocional', 'Reflexiones diarias a partir de la meditación de la Palabra de Dios'),
(2, 'Noticias', 'Eventos en el entorno de la iglesia de Cristo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `contenidoaudiovisual`
--

CREATE TABLE `contenidoaudiovisual` (
  `id` int(11) NOT NULL,
  `idContenidoAudiovisual` int(11) NOT NULL,
  `titulo` varchar(100) NOT NULL,
  `url` varchar(300) NOT NULL,
  `fecha` datetime NOT NULL DEFAULT current_timestamp(),
  `por` varchar(100) NOT NULL,
  `imagen` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `contenidoaudiovisual`
--

INSERT INTO `contenidoaudiovisual` (`id`, `idContenidoAudiovisual`, `titulo`, `url`, `fecha`, `por`, `imagen`) VALUES
(1, 1, 'Unidos a Cristo', 'https://www.youtube.com/watch?v=SgV1u7u2YuE', '2022-01-05 19:30:00', 'Pbro. Francisco Limón Cervantes', ''),
(2, 1, 'La importancia de Cristo', 'https://www.youtube.com/watch?v=QL10UfU-fEU', '2022-01-12 19:30:00', 'Pbro. Francisco Limón Cervantes', ''),
(3, 1, 'Un tiempo con Cristo', 'https://www.youtube.com/watch?v=dd_NLZpIWkc', '2022-01-19 19:30:00', 'Pbro. Francisco Limón Cervantes', ''),
(4, 1, 'Bendecidos en comunidad', 'https://www.youtube.com/watch?v=ks1AV5fd0tg', '2022-01-26 19:30:00', 'Pbro. Francisco Limón Cervantes', ''),
(5, 1, 'En misión con Jesús', 'https://www.youtube.com/watch?v=GvIOjcJwBhE', '2022-02-02 19:30:00', 'Pbro. Francisco Limón Cervantes', ''),
(6, 2, 'Acciones que definen la masculinidad', 'https://www.youtube.com/watch?v=4Q46ei04Ld8', '2022-01-10 17:00:00', 'Hna. Sara', ''),
(7, 2, 'Superar la perspectiva cultural', 'https://www.youtube.com/watch?v=B_soDeSTz1o', '2022-01-31 17:00:00', 'Hna. Sara', ''),
(8, 3, '¿Es razonable ser cristiano en el siglo XXI?', 'https://www.youtube.com/watch?v=fSgF6aHWz2w', '2022-01-21 20:00:00', 'Hno. Irving Isaí Espino Cano', ''),
(9, 3, '¿Es confiable el texto de la Biblia?', 'https://www.youtube.com/watch?v=IijSVGT-H8w', '2022-01-28 20:00:00', 'Hno. Irving Isaí Espino Cano', ''),
(10, 4, 'Una perspectiva para la pastoral desde la óptica de la tradición reformada', 'https://www.youtube.com/watch?v=OJ6PRUvIU7A', '2022-01-27 20:00:00', 'Pbro. David López', ''),
(11, 4, 'Instruye al niño', 'https://www.youtube.com/watch?v=CNsmMuHf4lk', '2022-02-03 20:00:00', 'Pbro. David López', ''),
(12, 5, 'El mesías en el Génesis', 'https://www.youtube.com/watch?v=eelG7ogFWds', '2022-01-30 11:30:00', 'Pbro. Jaime Delgado Delgado', ''),
(13, 3, '¿Es veraz el relato de la Biblia?', 'https://www.youtube.com/watch?v=6kyGaZRJUoM', '2022-02-04 20:00:00', 'Hno. Irving Isaí Espino Cano', ''),
(14, 5, 'El mesías en el Génesis - Linaje y señales', 'https://www.youtube.com/watch?v=goPkpXuhuuo', '2022-02-06 11:30:00', 'Pbro. Jaime Delgado Delgado', ''),
(15, 6, 'Damos gracias en todo', 'https://www.youtube.com/watch?v=cXzvV_571Jo', '2021-12-31 19:30:00', 'Pbro. Francisco Limón Cervantes', ''),
(16, 2, 'Visualizando un mejor futuro', 'https://www.youtube.com/watch?v=0IC2n3GHIFU', '2022-01-03 16:00:00', 'Hna. Sara', ''),
(17, 6, 'Dios nos liberó', 'https://www.youtube.com/watch?v=GokYTd-kvhU', '2022-01-09 10:00:00', 'Pbro. Francisco Limón Cervantes', ''),
(18, 6, 'Dios me sana y me salva', 'https://www.youtube.com/watch?v=2xANwl9o3A0', '2022-01-16 10:00:00', 'Pbro. Francisco Limón Cervantes', ''),
(19, 6, 'Anhelos de fe', 'https://www.youtube.com/watch?v=T2Eu74mIBqU', '2022-01-23 10:00:00', 'Pbro. Francisco Limón Cervantes', ''),
(20, 6, 'Tu luz y verdad', 'https://www.youtube.com/watch?v=OjkZdCPJwUs', '2022-01-30 10:00:00', 'Pbro. Francisco Limón Cervantes', ''),
(21, 7, '¿Suspender la transmisión?', 'https://www.youtube.com/watch?v=tvLoAPRECDs', '2022-02-05 20:30:00', 'Pbros. Francisco Limón y Luis Arturo Santiago', ''),
(22, 6, 'Dios parece ausente', 'https://www.youtube.com/watch?v=1-xoJKFwjdc', '2022-02-06 10:00:00', 'Pbro. Francisco Limón Cervantes', ''),
(23, 2, 'Mejor que el vino', 'https://www.youtube.com/watch?v=4AOPYjAS8S4', '2022-02-07 17:00:00', 'Hna. Sara', ''),
(25, 1, 'Definición de un discípulo', 'https://www.youtube.com/watch?v=t_n8SP8MNSw', '2022-02-09 19:30:00', 'Pbro. Francisco Limón Cervantes', ''),
(26, 4, 'Amonestación', 'https://www.youtube.com/watch?v=e41JKLe8LJE', '2022-02-11 20:00:00', 'Pbro. David López', ''),
(27, 3, '¿Es la Biblia un libro diferente a los demás', 'https://www.youtube.com/watch?v=0H9E1vIvPn0', '2022-02-11 20:00:00', 'Hno. Irving Isaí Espino Cano', ''),
(28, 7, 'Modelos pastorales', 'https://www.youtube.com/watch?v=p7r7-JFH9uQ', '2022-02-12 20:00:00', 'Pbros. Francisco Limón y Luis Arturo Santiago', ''),
(29, 6, 'El Rey de la gloria', 'https://www.youtube.com/watch?v=tcb8nvVNSvQ', '2022-02-13 10:00:00', 'Pbro. Francisco Limón Cervantes', ''),
(30, 2, 'Morena soy', 'https://www.youtube.com/watch?v=BTFIsY0U08E', '2022-02-14 17:00:00', 'Hna. Sara', ''),
(31, 1, 'Llamados a ser discípulos', 'https://www.youtube.com/watch?v=OLaB2CE1zTg', '2022-02-16 19:30:00', 'Pbro. Francisco Limón Cervantes', ''),
(32, 3, '¿Realmente existió Jesús?', 'https://www.youtube.com/watch?v=pzwQs_GVBJA', '2022-02-18 20:00:00', 'Hno. Irving Isaí Espino Cano', ''),
(33, 7, 'Modelos pastorales II', 'https://www.youtube.com/watch?v=Vq0O0KscfEI', '2022-02-19 20:00:00', 'Pbros. Francisco Limón y Luis Arturo Santiago', ''),
(34, 6, 'Fe confirmada', 'https://www.youtube.com/watch?v=0TF2KYgystc', '2022-02-20 10:00:00', 'Pbro. Francisco Limón Cervantes', ''),
(35, 5, 'El Mesías en el Génesis - El Ángel de Jehová', 'https://www.youtube.com/watch?v=ROK8WxhMS50', '2022-02-20 11:30:00', 'Pbro. Jaime Delgado Delgado', ''),
(36, 2, 'Mi propia viña', 'https://www.youtube.com/watch?v=ZLtLb3oh7Lk', '2022-02-21 17:00:00', 'Hna. Sara', ''),
(37, 1, 'Unidos a Cristo - El camino', 'https://www.youtube.com/watch?v=2N_R3ISVDqw', '2022-02-23 19:30:00', 'Pbro. Francisco Limón Cervantes', ''),
(38, 4, 'Disciplina', 'https://www.youtube.com/watch?v=3OAMvR3VGPo', '2022-02-24 20:00:00', 'Pbro. David López', ''),
(39, 3, '¿Contiene la Biblia las verdaderas enseñanzas de Jesús?', 'https://www.youtube.com/watch?v=2h860Qhw2yE', '2022-02-25 20:00:00', 'Hno. Irving Isaí Espino Cano', ''),
(40, 7, 'La salud de la iglesia', 'https://www.youtube.com/watch?v=AsU-UD7AQbM', '2022-02-26 18:00:00', 'Pbros. Francisco Limón Cervantes y Luis Arturo Santiago', ''),
(41, 6, 'Dios soberano', 'https://www.youtube.com/watch?v=XiHzHmGBU4M', '2022-02-27 10:00:00', 'Pbro Francisco Limón Cervantes', ''),
(42, 2, 'Reconoce su voz', 'https://www.youtube.com/watch?v=HcGZavJxZQw', '2022-03-01 17:00:00', 'Hna Sara', ''),
(43, 1, 'Preparados por Cristo', 'https://www.youtube.com/watch?v=u0JoAVV0-0Y', '2022-03-02 19:30:00', 'Pbro. Francisco Limón Cervantes', ''),
(44, 3, '¿Realmente resucitó Jesús?', 'https://www.youtube.com/watch?v=R3tFOkVsyu4', '2022-03-05 20:00:00', 'Hno. Irving Isai Espino Cano', ''),
(45, 6, 'Grande es Dios', 'https://www.youtube.com/watch?v=uj1MirNvk1o', '2022-03-06 10:00:00', 'Pbro. Francisco Limón Cervantes', ''),
(46, 5, 'El Mesías en el Génesis - Judá el linaje del Mesías', 'https://www.youtube.com/watch?v=DCOJ3s_i94s', '2022-03-06 11:30:00', 'Pbro. Jaime Delgado Delgado', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `contenidotextual`
--

CREATE TABLE `contenidotextual` (
  `id` int(11) NOT NULL,
  `idContenidoTextual` int(11) NOT NULL,
  `titulo` varchar(100) NOT NULL,
  `subtitulo` varchar(250) NOT NULL,
  `texto` text NOT NULL,
  `fecha` datetime NOT NULL DEFAULT current_timestamp(),
  `por` varchar(100) NOT NULL,
  `imagen` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `contenidotextual`
--

INSERT INTO `contenidotextual` (`id`, `idContenidoTextual`, `titulo`, `subtitulo`, `texto`, `fecha`, `por`, `imagen`) VALUES
(1, 1, 'Devocional', '', '<p><i><b>Dios bendice al que lee a la iglesia las palabras de esta profecía y bendice a todos los que escuchan el mensaje y obedecen lo que dice, porque el tiempo está cerca. Apocalipsis 1:3 NTV</b></i><br><br>Este texto, nos presenta un breve esquema de nuestra interacción con la Palabra de Dios y la forma en como nos es bendición.<br><br>Observemos que hay dos grupos de personas.<br><br><b>1. Los que leen para otros</b>. Estos son los que ya tienen una relación con Dios. Y ahora están compartiendo la Palabra del Señor con otros. Son bendecidos porque están ministrando a otros.<br><br><b>2. Los que escuchan y obedecen</b>. Son personas que están iniciando en la fe. Ellos son bendecidos porque reciben la Palabra para ponerla en práctica.<br><br>Ambos grupos tienen en común que son bendecidos al poner en práctica lo que la Palabra de Dios dice.<br><br>¿En cuál grupo estas tú? ¿En que forma estas poniendo en práctica la Palabra de Dios que haz recibido?<br></p>', '2022-02-08 07:45:00', 'Pbro. Francisco Limón Cervantes', ''),
(2, 1, 'Devocional', '', '<p><i><b>Toda la gloria sea al que nos ama y nos ha libertado de nuestros pecados al derramar su sangre por nosotros. Él ha hecho de nosotros un reino de sacerdotes para Dios, su Padre. ¡A él sea toda la gloria y el poder por siempre y para siempre! Amén. Apocalipsis 1:5‭-‬6 NTV</b></i><br><br>Salvación y ministerio van juntos en nuestra relación con Dios.&nbsp; Pues el cambio en nuestra identidad conlleva también nuestra participación en la misión.<br><br>Por la salvación recibida es que hemos sido hechos ministros del Señor. Que servimos para Su gloria, promoviendo que la voluntad de Dios sea cumplida en esta tierra, como ya se cumple en el cielo.&nbsp; Intercediendo por los que aun no están reconciliados con Dios. Y promoviendo la santidad y edificación de los que hemos sido llamados a ser Su iglesia.<br><br>El servir a Dios, es nuestra respuesta al amor y salvación que hemos recibido. De modo que servimos en amor y libertad y no como obligación.<br></p>', '2022-02-09 07:39:00', 'Pbro. Francisco Limón Cervantes', ''),
(3, 1, 'Devocional', '', '<p><i><b>«Yo soy el Alfa y la Omega, el principio y el fin —dice el Señor Dios—. Yo soy el que es, que siempre era y que aún está por venir, el Todopoderoso». Apocalipsis 1:8 NTV</b></i><br><br>Comprender con claridad Quien es Cristo, nos permite adorarlo y servirlo mejor. Al tiempo que se refuerza nuestra confianza en El.<br><br>Cristo es eterno e inmutable. Desde la eternidad pasada y hasta la eternidad futura, Cristo es Dios. Y su Ser no cambia. Así su amor, justicia y bondad siguen siendo iguales. Del modo que estuvo con Abraham, Moisés, David, Esther, o Ruth, también esta con nosotros. <br><br>&nbsp;Es también el origen y destino de todo lo creado. Todo procede del Señor y todo es para El. De modo que adoramos y servimos con lo que El nos provee, en recursos, dones, ministerios. Y todos los que somos de Cristo, algún día llegaremos a nuestro destino en Su Presencia.<br><br>Siendo también el Todopoderoso, el podemos sentirnos confiados y no intimidados. Pues El nos ha llamado a ser pueblo suyo y tiene el poder y lo usa para que Su propósito se cumpla en nuestra vida. No habiendo nada que nos pueda separar de Su amor.<br></p>', '2022-02-10 08:22:00', 'Pbro. Francisco Limón Cervantes', ''),
(4, 1, 'Devocional', '', '<p><i><b>Yo, Juan, soy hermano de ustedes, y su compañero en el sufrimiento, en el reino de Dios y en la paciente perseverancia a la que Jesús nos llama. Me exiliaron a la isla de Patmos por predicar la palabra de Dios y por mi testimonio acerca de Jesús. Apocalipsis 1:9 NTV</b></i><br><br>El escritor del Apocalipsis se identifica a sí mismo como uno más de los discípulos de Cristo. Y al hacerlo nos muestra algunas características que son comunes a los discípulos del Señor, y que también deben estar en nosotros. <br><br>Hermano. Este termino que algunos grupos que se dicen cristianos prefieren evitar. Denota nuestra identidad para con Dios, el cual es nuestro Padre y nuestra identidad con los que son de Cristo.<br><br>Compañero. Los discípulos formamos parte de un mismo equipo, estamos al servicio del Señor y de Su iglesia. Y compartimos el sufrimiento al predicar el Evangelio, tanto como el gozo y las batallas por extender el Reino de Dios.<br><br>Perseveran. Los discípulos del Señor, sostenidos por Su gracia y fortalecidos por Su Espíritu siguen creciendo en la fe.<br><br>Predican. Aislado por causa de la predicación del Evangelio y posiblemente sin el una iglesia local. Pero con los medios de los que dispone sigue proclamando el mensaje de Cristo.<br></p>', '2022-02-11 08:00:00', 'Pbro. Francisco Limón Cervantes', ''),
(5, 1, 'Devocional', '', '<p><i><b>Cuando lo vi, caí a sus pies como muerto; pero él puso la mano derecha sobre mí y me dijo: «¡No tengas miedo! Yo soy el Primero y el Último. Yo soy el que vive. Estuve muerto, ¡pero mira! ¡Ahora estoy vivo por siempre y para siempre! Y tengo en mi poder las llaves de la muerte y de la tumba. Apocalipsis 1:17‭-‬18 NTV</b></i><br><br>El libro del Apocalipsis, contrario a la interpretación popular, no es un libro sobre desastres, incomprensible o de terror. Sino un libro que nos presenta la revelación de Jesucristo, quien ha vencido a la muerte y el pecado. Y la revelación de Cristo a las iglesias. Por ello es un libro con un mensaje que instruye a las iglesias y nos brinda confianza y esperanza a los que somos de Cristo.<br><br>Observa la actitud de Juan, al ver la revelación de Cristo. Y el contraste de las palabras del Señor para Juan. Mientras Juan piensa que va a morir por causa de haber tenido una revelación de Cristo. El Señor mismo lo primero que le dice es que no debe tener temor.<br><br>La revelación de Jesucristo es para bendición de Su Pueblo. Pues El es eterno y por ello en aquella época y ahora El sigue siendo el mismo. Es también quien venció la muerte al haber resucitado. Venciendo así al pecado. De modo que Cristo es vencedor sobre todo y es Quien tiene todo el poder en sus manos.<br><br>Saber que en la vida y en la muerte le pertenecemos a Cristo sin duda no es para tener temor. Sino consuelo y seguridad pues por amor, fuimos redimidos para estar con Él.<br></p>', '2022-02-12 08:20:00', 'Pbro. Francisco Limón Cervantes', ''),
(6, 1, 'Devocional', '', '<p><i><b>»Yo sé todo lo que haces. He visto tu arduo trabajo y tu paciencia con perseverancia. Sé que no toleras a la gente malvada. Has puesto a prueba las pretensiones de esos que dicen ser apóstoles pero no lo son. Has descubierto que son mentirosos. Has sufrido por mi nombre con paciencia sin darte por vencido. »Pero tengo una queja en tu contra. ¡No me amas a mí ni se aman entre ustedes como al principio! Apocalipsis 2:2‭-‬4 NTV</b></i><br><br>Los mensajes a las 7 iglesias que leemos en Apocalipsis, muestran la necesidad de seguir perfeccionandonos.<br><br>Hacer algunas cosas bien, como cuidar de la doctrina y moral en el pueblo de Dios es correcto. Sin embargo el solo hacer eso no es suficiente, pues puede conducir a situaciones legalistas. Por ello es necesario revisar la motivación por la que se hacen estas cosas. <br><br>La motivación para cuidar de la correcta enseñanza de la Palabra y la Ética en el pueblo de Dios. Necesita ser el amor a Dios y a nuestros semejantes.<br><br>Pues la finalidad de la Enseñanza y de la Ética son el que El pueblo del Señor sea edificando por la Palabra. Y como pueblo del Señor pongamos en evidencia Su presencia y Su gloria ante los que aun no son de Cristo.<br></p>', '2022-02-13 07:00:00', 'Pbro. Francisco Limón Cervantes', ''),
(7, 1, 'Devocional', '', '<p><i><b>»Escribe esta carta al ángel de la iglesia de Esmirna. Este es el mensaje de aquel que es el Primero y el Último, que estuvo muerto pero ahora vive: »Yo sé de tu sufrimiento y tu pobreza, ¡pero tú eres rico! Conozco la blasfemia de los que se te oponen. Dicen ser judíos pero no lo son, porque su sinagoga le pertenece a Satanás. Apocalipsis 2:8‭-‬9 NTV</b></i><br><br>Saber quien nos da un mensaje es importante, porque de allí se deriva la autoridad y confiabilidad de lo que se está diciendo. <br><br>En este caso las referencias a Cristo señalan al que es origen y destino de todo lo creado, por lo cual también es eterno. La otra referencia es el Resucitado, con lo que es vencedor sobre la muerte y el pecado. Con esta presentación da un mensaje a la iglesia.<br><br>Sabe de su pobreza, pero afirma que en realidad es rica. Sin duda Quien es el origen y destino de todas las cosas sabe mejor que nosotros cual es la realidad. Y nuestra pobreza como iglesia, se debe a nuestra limitada capacidad para ver las riquezas que Dios nos ha brindado ya. Pues el Dios que nos hizo hijos suyos es el dueño y Señor de todo lo que existe.<br><br>Saber que Cristo, El Resucitado esta a favor de nosotros, ha de llenarnos de confianza. Pues el mismo sufrió adversidad, pero es vencedor y con ello puso en evidencia a los que solo simulan ser servidores de Dios.<br></p>', '2022-02-14 08:09:00', 'Pbro. Francisco Limón Cervantes', ''),
(8, 1, 'Devocional', '', '<p><i><b>»Yo sé todo lo que haces; he visto tu amor, tu fe, tu servicio y tu paciencia con perseverancia. Y veo tu constante mejoría en todas estas cosas. »Pero tengo una queja en tu contra. Permites que esa mujer —esa Jezabel que se llama a sí misma profetisa— lleve a mis siervos por mal camino. Ella les enseña a cometer pecado sexual y a comer alimentos ofrecidos a ídolos. Apocalipsis 2:19‭-‬20 NTV</b></i><br><br>El estado actual de algunas iglesias puede ser descrito como de luces y sombras. Situación que de alguna manera hoy parece normal, pero que en realidad no corresponde al plan de Dios para Su Iglesia.<br><br>Como iglesia de Cristo, fuimos llamados a manifestar&nbsp; en este mundo la presencia y la gracia de Dios. Pues por la obra de Cristo en nuestra vida hemos sido hechos santos, apartados para El. Siendo así partícipes de Su santidad y llamados a dedicarnos íntegramente para El. <br><br>Es por ello que como discípulos del Señor, no podemos contentarnos con algunos logros, sino que necesitamos corregir las áreas deficientes en la iglesia local. Y no dar espacio a situaciones que dañen el testimonio y misión que como iglesia se nos ha encomendado.<br></p>', '2022-02-15 08:00:00', 'Pbro. Francisco Limón Cervantes', ''),
(9, 1, 'Devocional', '', '<p><i><b>»Escribe esta carta al ángel de la iglesia de Sardis. Este es el mensaje de aquel que tiene el Espíritu de Dios de siete aspectos y las siete estrellas: »Yo sé todo lo que haces y que tienes la fama de estar vivo, pero estás muerto. ¡Despierta! Fortalece lo poco que te queda, porque hasta lo que queda está a punto de morir. Veo que tus acciones no cumplen con los requisitos de mi Dios. Vuelve a lo que escuchaste y creíste al principio, y retenlo con firmeza. Arrepiéntete y regresa a mí. Si no despiertas, vendré a ti de repente, cuando menos lo esperes, como lo hace un ladrón. Apocalipsis 3:1‭-‬3 NTV</b></i><br><br>En nuestra cultura existe una tendencia de vivir de las glorias del pasado. Se exaltan los años que cumplen los templos o las organizaciones de las iglesias. Incluso nos gloriamos de las actividades en las que alguna vez fuimos participantes. Sin poder reconocer que en el día de hoy esas organizaciones van en declive y nuestra comunión con Cristo y participación en la misión esta en el mínimo. <br><br>La dura advertencia que aquí se nos hace, nos llama a despertar, arrepentirnos y volver a lo que creímos en el momento de nuestra conversión a Cristo.<br><br>Hay iglesias y creyentes que hoy en día, necesitamos retomar nuestra comunión con Dios, a través de una lectura personal diaria de La Palabra. Así como retomar los espacios de estudio servicio, evangelización, misericordia y adoración que hemos dejado.<br></p>', '2022-02-16 07:48:00', 'Pbro. Francisco Limón Cervantes', ''),
(10, 1, 'Devocional', '', '<p><i><b>»Dado que has obedecido mi mandato de perseverar, yo te protegeré del gran tiempo de prueba que vendrá sobre el mundo entero para probar a los que pertenecen a este mundo. Yo vengo pronto. Aférrate a lo que tienes, para que nadie te quite tu corona. A todos los que salgan vencedores, los haré columnas en el templo de mi Dios, y nunca tendrán que salir de allí. Yo escribiré sobre ellos el nombre de mi Dios, y ellos serán ciudadanos de la ciudad de mi Dios, la nueva Jerusalén que desciende del cielo y de mi Dios. Y también escribiré en ellos mi nuevo nombre. Apocalipsis 3:10‭-‬12 NTV</b></i><br><br>Los que han sido llamados por El Señor para integrar Su Iglesia, permanecerán siempre invictos.<br><br>Pues pasando por pruebas y adversidades, se mantienen fieles, perseverando en la fe y el servicio para el que fueron llamados.<br><br>En su perseverancia han sido protegidos por El Señor.&nbsp; Y El mismo será quien les preserve en la tribulación, a fin de que al final de los tiempos sean un testimonio del amor y cuidado de Dios por Su Pueblo.<br><br>El destino de los fieles es estar eternamente con su Señor, como ciudadanos de la ciudad de Dios.<br></p>', '2022-02-17 07:35:00', 'Pbro. Francisco Limón Cervantes', ''),
(11, 1, 'Devocional', '', '<p><i><b>Yo corrijo y disciplino a todos los que amo. Por lo tanto, sé diligente y arrepiéntete de tu indiferencia. Apocalipsis 3:19 NTV</b></i><br><br>El mensaje a la iglesia de Laodicea, es algo en lo que deberíamos poner atención muchos hoy en día.<br><br>Esta es una iglesia descrita como una iglesia indiferente e indolente. <br><br>No es fría, ni caliente (15), e incapaz de ver su propia condición espiritual pues se ve así misma como rica, cuando su realidad ante Dios es completamente diferente (17).<br><br>Hay momentos en los que nos hemos vuelto petulantes y creídos de nosotros mismos actuando con indolencia en nuestra relación con Dios y con ello en la misión a la que fuimos llamados. Llega el momento en el que nos limitamos a cumplir cuando podemos y de la forma más simple. Creyendo que de esa manera estamos honrando a Dios.<br><br>El mensaje del Señor a la iglesia de Laodicea fue que deberían arrepentirse. Y es algo que algunos de nosotros hemos de hacer al reconocer la indolencia con la que llevamos nuestra relación con Dios.<br></p>', '2022-02-18 07:55:00', 'Pbro. Francisco Limón Cervantes', ''),
(12, 1, 'Devocional', '', '<p><i><b>Los veinticuatro ancianos se postran y adoran al que está sentado en el trono (el que vive por siempre y para siempre), y ponen sus coronas delante del trono, diciendo: «Tú eres digno, oh Señor nuestro Dios, de recibir gloria y honor y poder. Pues tú creaste todas las cosas, y existen porque tú las creaste según tu voluntad». Apocalipsis 4:10‭-‬11 NTV</b></i><br><br>En un libro como el apocalipsis el uso de los números es significativo. En este caso 24 ancianos pueden representar la plenitud de los creyentes en todos los tiempos.&nbsp; Representando las 12 tribus de Israel y los 12 Apóstoles representando a la iglesia.<br><br>De esta manera se nos enseña que todos los creyentes de todos los tiempos hemos sido llamados a adorar a Cristo, quien esta en el trono.<br><br>¿Cómo lo hacemos? El texto nos nuestra dos actos.<br><br><b>Los Ancianos ponen sus coronas delante de Él</b>. Nos ponemos al servicio de Cristo. La vida que tenemos es entregada al Señor. Pues reconocemos que quienes somos, y lo que tenemos es de El Señor. Por eso lo ponemos a Su servicio. <br><br><b>Diciendo...</b> Es frecuente que al pensar en adoración el referente sea cantar, lo cual no queda excluido. Pero aquí lleva más la idea de declarar públicamente Quien es Dios. Es el testimonio público, a través del cual manifestamos que Cristo es nuestro Señor y Dios y nosotros su pueblo a Su servicio.<br></p>', '2022-02-19 07:52:00', 'Pbro. Francisco Limón Cervantes', ''),
(13, 1, 'Devocional', '', '<p><i><b>pero uno de los veinticuatro ancianos me dijo: «¡Deja de llorar! Mira, el León de la tribu de Judá, el heredero del trono de David, ha ganado la victoria. Él es digno de abrir el rollo y sus siete sellos». Apocalipsis 5:5 NTV</b></i><br><br>La visión del Cristo vencedor, genera esperanza y seguridad en los que somos sus discípulos.<br><br>Es cierto que lleva las marcas como de un cordero que fue sacrificado (v.6) pero también esta en pie y reinando. El sacrificio para librarnos del pecado fue real, como también Su Resurrección y ahora ha sido glorificado y reina eternamente.<br><br>La victoria de Cristo, es para nuestro consuelo. Pues al cruzar por tribulaciones como Cristo mismo lo hizo, El es vencedor. Y porque El nos ha unido a sí mismo, es que Su victoria es también nuestra victoria.<br><br>1. Es el León de Judá, quien hoy dirije a Su Pueblo. Es el quien conduce a Su iglesia en victoria. <br><br>2. El cumplimiento de la esperanza Mesiánica hoy en una realidad, para nuestra plena redención. <br><br>3. La revelación de Dios, para guía y fortaleza del pueblo del Señor es una realidad en Cristo.<br></p>', '2022-02-20 08:00:17', 'Pbro. Francisco Limón Cervantes', ''),
(14, 1, 'Devocional', '', '<p><i><b>Y cantaban un nuevo canto con las siguientes palabras: «Tú eres digno de tomar el rollo y de romper los sellos y abrirlo. Pues tú fuiste sacrificado y tu sangre pagó el rescate para Dios de gente de todo pueblo, tribu, lengua y nación. Y la has transformado en un reino de sacerdotes para nuestro Dios. Y reinarán sobre la tierra». Apocalipsis 5:9‭-‬10 NTV</b></i><br><br>Por la obra de Cristo, hemos sido reconciliados con El Padre. Para que ahora como pueblo suyo seamos ministros de Su gracia a favor de otros.<br><br>Como iglesia hemos sido constituidos en una comunidad sacerdotal, la cual ministra ante Dios y a favor del pueblo. En intercesión, consejo, exposición de la Palabra del Señor, ejerciendo misericordia y alabanza.<br><br>Cada uno de los que hoy componemos la iglesia del Señor, desempeñamos los ministerios que nos han sido asignados. Con los dones y recursos que El Señor nos provee y lo hacemos en Su Nombre, para Su gloria y para bendición de todos cuantos están en nuestro derredor.<br><br>También la iglesia ejerce el Señorío de Dios, sobre este mundo, al actuar siguiendo los valores del Reino, amor, justicia, verdad y paz.<br></p>', '2022-02-21 08:22:00', 'Pbro. Francisco Limón Cervantes', ''),
(15, 1, 'Devocional', '', '<p><b>Y entonces oí a toda criatura en el cielo, en la tierra, debajo de la tierra y en el mar que cantaban: «Bendición y honor y gloria y poder le pertenecen a aquel que está sentado en el trono y al Cordero por siempre y para siempre». Apocalipsis 5:13 NTV</b><br><br>Fuimos diseñados para adorar y gozar de la presencia de Dios. <br><br>Un antiguo documento confesional de la iglesia así lo enseña, personalizando así lo que podemos ver en la Palabra como una adoración universal a Dios y a Cristo. <br><br>Llegará el momento en que todos los discípulos nos sumaremos a esta adoración universal, donde todo lo creado dará gloria y honor al Señor. Pero mientras ese momento llega, los que hemos formamos parte de Su pueblo, de forma anticipada y en preparación para sumarnos al coro universal buscamos que todo cuanto hacemos sea para Su gloria.<br><br>De esta manera, buscamos qué a través de nuestras actividades familiares, profesionales, de comercio, educativas, servicio y ministeriales, Dios sea glorificado. Por eso las realizamos buscando la excelencia, pues son nuestra manera de dar gloria a Dios.<br></p>', '2022-02-22 08:29:01', 'Pbro. Francisco Limón Cervantes', ''),
(16, 1, 'Devocional', '', '<p>Cuando el Cordero rompió el quinto sello, vi debajo del altar las almas de todos los que habían muerto como mártires por causa de la palabra de Dios y por haber sido fieles en su testimonio. Ellos clamaban al Señor y decían: «Oh Señor Soberano, santo y verdadero, ¿cuánto tiempo hasta que juzgues a la gente de este mundo y tomes venganza de nuestra sangre por lo que nos han hecho?». Entonces a cada uno de ellos se le dio una túnica blanca, y se les dijo que descansaran un poco más hasta que se completara el número de sus hermanos, los consiervos de Jesús que se unirían a ellos después de morir como mártires. Apocalipsis 6:9‭-‬11 NTV</p><p>Los discípulos que son fieles hasta la muerte tienen una gran importancia en el extendiendo del reinado de Dios. Su ministerio ha servido y sirve para seguir proclamando la fe en Cristo. Contribuyen a la predicación de la Palabra, el discipulado. Así como para consolar y animar a otros discípulos a permanecer fieles en la misión.<br><br>El ministerio de los que son fieles a Cristo, aun es necesario, hasta que todos los que Dios ha elegido para salvación hayan sido integrados a la Iglesia.<br><br>Para que continúen en el ministerio al que fueron llamados, son vestidos con ropajes blancos, signo de la santidad pues son apartados y dedicados al servicio a Dios. Y son sostenidos por la gracia de Dios, hasta que llegue el momento de estar en Su presencia.<br></p>', '2022-02-23 08:22:33', 'Pbro. Francisco Limón Cervantes', ''),
(17, 1, 'Devocional', '', '<p><b>Y yo le contesté: —Tú eres quien lo sabe, señor. Entonces él me dijo: —Estos son los que murieron en la gran tribulación. Han lavado y blanqueado sus ropas en la sangre del Cordero. »Por eso están delante del trono de Dios y le sirven día y noche en su templo. Y aquel que está sentado en el trono les dará refugio. Nunca más tendrán hambre ni sed; nunca más les quemará el calor del sol. Pues el Cordero que está en el trono será su Pastor. Él los guiará a manantiales del agua que da vida. Y Dios les secará cada lágrima de sus ojos. Apocalipsis 7:14‭-‬17 NTV</b><br><br>El pueblo del Señor: los que han lavado sus ropas en la sangre del cordero. Por ello han sido declarados justos, pues por la fe ha reconocido que Jesús es su Señor y Salvador. Los que han experimentado la gracia salvadora y transformadora de Dios. Son protegidos por Dios.<br><br>Los que por gracia fuimos elegidos para conformar el pueblo de Dios. Serviremos delante de la presencia del Señor eternamente.<br><br>Los efectos dañinos de este mundo llegará el momento en el que, no tendrán efecto sobre la vida de los discípulos. Y Dios será nuestra fortaleza y consuelo. Pues Dios, haciéndose nuestro Pastor, será Quien nos conduzca por los lugares de bendición.<br><br>Piensa ahora en esto. ¿Si este es el futuro que espera a los discípulos, porque temer? Seguramente saber que este es el futuro que Dios ha preparado para los suyos, aumentará nuestro deseo de experimentarlo ya.<br></p>', '2022-02-24 07:00:00', 'Pbro. Francisco Limón Cervantes', ''),
(18, 1, 'Devocional', '', '<p><b>Entonces vino otro ángel con un recipiente de oro para quemar incienso y se paró ante el altar. Se le dio una gran cantidad de incienso para mezclarlo con las oraciones del pueblo de Dios como una ofrenda sobre el altar de oro delante del trono. El humo del incienso, mezclado con las oraciones del pueblo santo de Dios, subió hasta la presencia de Dios desde el altar donde el ángel lo había derramado. Apocalipsis 8:3‭-‬4 NTV</b><br><br>Nada de lo que los discípulos han hecho para honrar al Señor es en vano.<br><br>Aquí tenemos una bella imagen donde vemos que las oraciones del pueblo de Dios son equiparadas con el incienso del altar, para ser elevadas como ofrenda al Señor.<br><br>Las oraciones que han sido hechas pidiendo que la voluntad de Dios se cumpla en este mundo, como ya se cumple en el cielo, son gratas al Señor. Así como la intercesión de Su pueblo para que El reinado del Señor crezca. Son las oraciones elevadas al Señor dando gracias por Su misericordia. Y todas aquellas donde le reconociendo Su Señorío le damos a Él la gloria.<br><br>Cada oración, al ser elevada en reconocimiento al Señor es grata ante El y sube a Su presencia como perfume grato. Saber esto ha de animarnos a seguir intercediendo ante El Señor, para que Su Reinado sea establecido ya. Empezando en nuestra persona, hasta que cubra todo el mundo.<br></p>', '2022-02-25 07:25:00', 'Pbro. Francisco Limón Cervantes', ''),
(19, 1, 'Devocional', '', '<p><b>Sin embargo, los que no murieron en esas plagas aun así rehusaron arrepentirse de sus fechorías y volverse a Dios. Siguieron rindiendo culto a demonios y a ídolos hechos de oro, plata, bronce, piedra y madera, ¡ídolos que no pueden ni ver ni oír ni caminar! Esa gente no se arrepintió de sus asesinatos ni de su brujería ni de su inmoralidad sexual ni de sus robos. Apocalipsis 9:20‭-‬21 NTV</b><br><br>La humanidad esta dividida entre creyentes y no creyentes.<br><br>Los primeros son aquellos que por la gracia de Dios, se han vuelto a Él, reconociendo que Jesús es El Señor y Salvador. Actúan con una fe obediente y aun frente a las adversidades se mantienen fieles. Si equivocan el camino lo corrigen y durante los tiempos difíciles son protegidos por El Señor. Finalmente ellos serán restaurados y experimentarán la gloria del Señor. <br><br>El otro grupo son aquellos que han rechazado la gracia de Dios. Escucharon el llamado al arrepentimiento, pero su corazón esta endurecido. En su falta de arrepentimiento han seguido en sus malos caminos. Y serán ellos quienes experimenten el juicio del Señor.<br><br>La diferencie entre ambos grupos no es nuestra calidad moral, sino la respuesta por la fe que damos a la gracia de Dios. Si hemos respondido aceptando la gracia de Dios, es debido a la fe que Dios nos otorgó como un don para ejercerla en Su Nombre.<br></p>', '2022-02-26 07:47:00', 'Pbro. Francisco Limón Cervantes', ''),
(20, 1, 'Devocional', '', '<p><b>Entonces el ángel que vi de pie sobre el mar y sobre la tierra levantó la mano derecha hacia el cielo. Hizo un juramento en el nombre de aquel que vive por siempre y para siempre, quien creó los cielos y todo lo que hay en ellos, la tierra y todo lo que hay en ella, y el mar y todo lo que hay en él. El ángel dijo: «Ya no habrá más demora. Cuando el séptimo ángel toque su trompeta, el misterioso plan de Dios se cumplirá. Sucederá tal como él lo anunció a sus siervos los profetas». Apocalipsis 10:5‭-‬7 NTV</b><br><br>El día del Señor vendrá, tal y como Él lo ha dicho. Por amor a los elegidos, trayendo para ellos restauración plena. Donde la justicia y paz del Señor sean establecidas completamente sobre esta tierra. <br><br>Lo que algunos consideran tardanza, es una manifestación de Su gracia, dando oportunidad para el arrepentimiento. Pero finalmente el día del Señor llegará. Y quienes han permanecido sin volverse a Dios experimentarás las consecuencias de desdeñar la gracia que en Cristo hay. <br><br>De modo que habiendo escuchado el anuncio de que no habrá más demora, deberíamos todos los que leemos este mensaje, volvernos al Señor, para recibir Su gracia y colocarnos bajo Su Señorío.<br></p>', '2022-02-27 07:28:00', 'Pbro. Francisco Limón Cervantes', ''),
(21, 1, 'Devocional', '', '<p><b>Entonces el séptimo ángel tocó su trompeta, y hubo fuertes voces que gritaban en el cielo: «Ahora el mundo ya es el reino de nuestro Señor y de su Cristo, y él reinará por siempre y para siempre». Apocalipsis 11:15 NTV</b><br><br>El Reinado de Cristo finalmente es establecido, dando paso así a que la justicia del Señor se manifieste. <br><br>El establecimiento del Reinado de Cristo, trae al orden a todo aquello que estaba en contra del Señor. De modo que los que se oponían serán juzgados por su incredulidad y el rechazo que manifestaron al Señor.<br><br>Este juicio del Señor, también será para vindicar y restaurar a los que son de Cristo y sufrieron por causa de los adversarios.<br><br>Finalmente la paz del Señor será para los siervos del Señor. Y ellos reinarán con El Señor y Salvador.<br></p>', '2022-02-28 07:23:00', 'Pbro. Francisco Limón Cervantes', ''),
(22, 1, 'Devocional', '', '<p><b>Luego oí una fuerte voz que resonaba por todo el cielo: «Por fin han llegado la salvación y el poder, el reino de nuestro Dios, y la autoridad de su Cristo. Pues el acusador de nuestros hermanos —el que los acusa delante de nuestro Dios día y noche— ha sido lanzado a la tierra. Ellos lo han vencido por medio de la sangre del Cordero y por el testimonio que dieron. Y no amaron tanto la vida como para tenerle miedo a la muerte. Apocalipsis 12:10‭-‬11 NTV</b><br><br>El libro del Apocalipsis esta lleno de figuras literarias, pero el tema es perfectamente claro cuando leemos versículos como los de hoy, donde la situación de conflicto para el establecimiento del Reinado de Cristo tiene una clara resolución.<br><br>La victoria de Cristo sobre los poderes del mal es una realidad y esto significa salvación plena para el pueblo del Señor, pues al ser participantes del Pacto de gracia, también lo son del Reinado de Cristo, donde la perfecta paz de Dios es la bendición que ellos reciben pero principalmente el estar eternamente ante Dios.<br><br>Los que están con El Cristo vencedor son los que fueron declarados justos por la sangre derramada por Cristo en la cruz en expiación por su pecado y se mantuvieron fieles al Señor por causa de la gracia de Dios actuando en su vida.<br></p>', '2022-03-01 07:53:00', 'Pbro. Francisco Limón Cervantes', ''),
(23, 1, 'Devocional', '', '<p><b>Y adoraron a la bestia todos los que pertenecen a este mundo, aquellos cuyos nombres no estaban escritos en el libro de la vida que pertenece al Cordero que fue sacrificado antes de la creación del mundo. Apocalipsis 13:8 NTV</b><br><br>En el libro del Apocalipsis el tema de conflicto entre el bien y el mal es recurrente. Y así como se muestra con claridad que finalmente la victoria es del Señor, también nos permite ver que&nbsp; hay personas que se apartan de la fe y se involucran con la maldad. Pero el lenguaje que esta revelación del Señor nos muestra es que quienes así hacen no son parte de la iglesia del Señor.<br><br>Se les describe como «los que pertenecen a este mundo». Siendo aquí el concepto «mundo» como lo que se opone y rechaza a Dios. Lo cual nos hace regresar a la disyuntiva de nuestra pertenencia; pues solo hay dos opciones: pertenecemos a Dios, o pertenecemos al mundo.<br><br>Los que son del mundo, siguen aquello que está en oposición a Dios y finalmente recibirán las consecuencias de su actuar.<br><br>Los que pertenecen a Dios, son los que fueron limpiados por la sangre del Cordero y sus nombres están escritos en el libro de la vida. Porque son del Señor, también actúan conforme a Su voluntad y su destino es cierto al lado del Señor al que sirven.<br></p>', '2022-03-02 07:51:00', 'Pbro. Francisco Limón Cervantes', ''),
(24, 1, 'Devocional', '', '<p><b>Ese gran coro entonaba un nuevo canto maravilloso delante del trono de Dios y delante de los cuatro seres vivientes y los veinticuatro ancianos. Nadie podía aprender ese canto aparte de los 144.000 que habían sido rescatados de la tierra. Apocalipsis 14:3 NTV</b><br><br>Confesar y adorar a Cristo como Señor y Salvador, solo es posible para aquellos que fueron elegidos para formar parte de Su Pueblo. Pues adorar o confesar, es la respuesta a la presencia del Espíritu en la vida de los discípulos.<br><br>De modo que, cualquier persona puede leer un fragmento de la Biblia o cantar una letra religiosa, pero en el sentido correcto la <u>adoración</u>, así como <u>confesar</u> solo es posible para los redimidos, pues confiesan lo que han experimentado y adoran a quien los ha recibido como hijos.<br><br>Desde este lado de la gloria, los discípulos participamos ya confesando nuestra fe, a través de actos que hablan y muestran la gracia de Dios a favor de los que están en pecado. Llamándolos al arrepentimiento y conversión. Y nuestra adoración es para proclamar las perfecciones de Dios y anunciar Sus obras de gracia y misericordia.<br></p>', '2022-03-03 13:32:23', 'Pbro. Francisco Limón  Cervantes', ''),
(25, 1, 'Devocional', '', '<p><b>Y vi a otro ángel, que volaba por el cielo y llevaba la eterna Buena Noticia para proclamarla a los que pertenecen a este mundo: a todo pueblo y toda nación, tribu y lengua. «Teman a Dios —gritaba—. Denle gloria a él, porque ha llegado el tiempo en que ocupe su lugar como juez. Adoren al que hizo los cielos, la tierra, el mar y todos los manantiales de agua». Apocalipsis 14:6‭-‬7 NTV</b><br><br>El anuncio del evangelio a todas las naciones implica un anuncio de la gracia del Señor, así como un último llamado a la conversión y el anuncio del juicio que Dios hará sobre los que rechazan o menosprecian la gracia de Dios.<br><br>Este último llamado de un mensajero representa el final de la labor que El Señor encargó a sus discípulos.&nbsp; Con ello se cerrará el tiempo de gracia que Dios ha extendido para que todos los elegidos pudiéramos volvernos al Señor y proceder en reconocimiento, adoración y servicio ante Él.<br><br>Para los que ya fuimos redimidos y en tanto ese momento llega, es tiempo de seguir anunciando el evangelio de la gracia de Dios. Y será el Espíritu del Señor quien convenza a los elegidos de pecado, justicia y juicio, para que puedan experimentar vida eterna.<br></p>', '2022-03-04 13:04:22', 'Pbro. Francisco Limón Cervantes', ''),
(26, 1, 'Devocional', '', '<p><b>Y oí una voz del cielo que decía: «Escribe lo siguiente: benditos son los que de ahora en adelante mueran en el Señor. El Espíritu dice: “Sí, ellos son en verdad benditos, porque descansarán de su arduo trabajo, ¡pues sus buenas acciones los siguen!”». Apocalipsis 14:13 NTV</b><br><br>La Biblia dice esto de quienes se mantuvieron fieles al Señor aun en la adversidad.<br><br>El ministerio de discípulos fieles es el que sirve de aliento a que otros continúen sirviendo, pues en la adversidad&nbsp; confiaron en el Señor; y con una obediencia inquebrantable siguen predicando la Palabra, fieles al llamado que han recibido. <br><br>La ministración que llevan a cabo forma a las siguientes generaciones de discípulos, al tiempo que su servicio es un signo que habrá de seguir siendo bendición incluso cuando ellos ya no estén entre los vivos.<br><br>Los nombres de esos discípulos pueden llegar a quedar en el olvido, pero la obra de proclamar la Palabra, servicio a otros, etc. continuará siendo un testimonio, pues sembraron para la eternidad y dan fruto que glorifica a Dios.<br></p>', '2022-03-07 15:23:27', 'Pbro. Francisco Limón Cervantes', ''),
(27, 1, 'Devocional', '', '<p><b>y entonaban el canto de Moisés, siervo de Dios, y el canto del Cordero: «Grandes y maravillosas son tus obras, oh Señor Dios, el Todopoderoso. Justos y verdaderos son tus caminos, oh Rey de las naciones. ¿Quién no te temerá, Señor, y glorificará tu nombre? Pues solo tú eres santo. Todas las naciones vendrán y adorarán delante de ti, porque tus obras de justicia han sido reveladas». Apocalipsis 15:3‭-‬4 NTV</b><br><br>El canto de los redimidos proclama la grandeza de Dios y el establecimiento de su justicia, como un acto testimonial de lo que han experimentado por parte de Dios.<br><br>La adoración siempre es testimonial, pues cantamos de las grandes cosas que Dios ha hecho en nosotros, testificamos de cómo su gracia nos sana y salva, y de cómo por su justicia somos&nbsp; restaurados y establecidos como pueblo suyo.<br><br>Al mismo tiempo el canto de los redimidos convoca a toda la creación a reconocer al Señor, viniendo ante Él en adoración para poner nuestra vida a su servicio, pues solamente Él es santo, justo y todopoderoso.<br></p>', '2022-03-07 15:33:21', 'Pbro. Francisco Limón Cervantes', ''),
(28, 1, 'Devocional', '', '<p><b>Todos sufrieron quemaduras debido a la descarga de calor y maldijeron el nombre de Dios, quien tenía control sobre todas estas plagas. No se arrepintieron de sus pecados ni se volvieron a Dios ni le dieron la gloria. Apocalipsis 16:9 NTV</b><br><br>Es cierto que en la Biblia los juicios de Dios son severos, pero también son verdaderos y justos (v.7). Pues corresponden a la misma naturaleza de Dios la cual es justa y santa. Pues dejar sin represión a los que rechazan la gracia haría a Dios injusto.<br><br>Recordemos que todos los que experimentamos salvación, si bien somos pecadores como los otros y no merecedores de la bondad del Señor por nosotros mismos, hemos sido redimidos por la gracia de Dios, la cual al recibirla produjo en nuestra vida arrepentimiento y conversión; después obediencia y servicio para manifestar que la gracia de Dios ha sido efectiva en nuestra vida.<br><br>En contraste, hay quienes han escuchado el evangelio incluso experimentado las bendiciones generales de Dios, pero no han procedido al arrepentimiento, permanecen incrédulos rechazando de esta manera&nbsp; la gracia de Dios. De allí que justamente han de recibir la reprensión adecuada por no reconocer la salvación que Cristo ganó al precio de su sangre para reconciliarnos con El Padre y librarnos de nuestro propio pecado.<br></p>', '2022-03-07 15:36:58', 'Pbro. Francisco Limón Cervantes', ''),
(29, 1, 'Devocional', '', '<p><b>Irán juntos a la guerra contra el Cordero, pero el Cordero los derrotará porque él es el Señor de todos los señores y el Rey de todos los reyes. Y los que él ha llamado y elegido y le son fieles, estarán con él». Apocalipsis 17:14 NTV</b><br><br>El escenario del Apocalipsis, esta marcado por el conflicto entre el los poderes del mundo y Cristo, el Cordero de Dios.<br><br>Pero el conflicto tiene una resolución positiva, pues El Cordero es vencedor y los suyos están con Él. Los poderes del mal no prevalecerán y finalmente serán destruidos.<br><br>Este escenario que vemos en el Apocalipsis, en buena parte es también el escenario de conflicto en el cual vivimos tales como confrontaciones bélicas, políticas y económicas, violencia generalizada en marchas, estadios, fiestas, etc.<br><br>Pero este escenario caótico algún día dejará de ser, la justicia de Dios será establecida y los que fueron elegidos por el Señor y se mantuvieron fieles gozarán de la paz del reinado de Cristo. Ese día llegará y eso alienta a los discípulos a seguir trabajando con esperanza, por la paz y la reconciliación que solo son posibles en Cristo.<br></p>', '2022-03-08 07:33:00', 'Pbro. Francisco Limón Cervantes', ''),
(30, 1, 'Devocional', '', '<p><b>Después oí otra voz que clamaba desde el cielo: «Pueblo mío, salgan de ella. No participen en sus pecados o serán castigados junto con ella. Pues sus pecados se han amontonado hasta el cielo, y Dios se acuerda de sus maldades. Apocalipsis 18:4‭-‬5 NTV</b><br><br>En el libro de Apocalipsis, Babilonia es el nombre que se utiliza para tipificar al mal, y habrá de caer bajo el juicio de Dios. <br><br>De allí el llamado urgente de que el pueblo de Dios salga de esa ciudad (poder y modo de vida corrupto), pues de no hacerlo el juicio del Señor les alcanzará.<br><br>Babilonia, más que una ciudad, representa la corrupción imperante en el mundo de la cual los discípulos no deberíamos de participar. Y que en el texto podemos leer como: inmoralidad, enriquecimiento ilícito, vana gloria y ostentación, así como idolatría y abuso del poder.<br><br>Como discípulos del Señor, hemos de cuidar de no ser parte de alguna de estas practicas que desagradan al Señor, pues no conocen ni a la naturaleza de Dios, ni al llamado que como pueblo suyo hemos recibido.<br></p>', '2022-03-09 07:38:00', 'Pbro. Francisco Limón Cervantes', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mensajeria`
--

CREATE TABLE `mensajeria` (
  `id` int(11) NOT NULL,
  `nombre` varchar(250) NOT NULL,
  `correo` varchar(100) NOT NULL,
  `whatsapp` varchar(10) NOT NULL,
  `mensaje` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `admmenu`
--
ALTER TABLE `admmenu`
  ADD PRIMARY KEY (`idMenu`);

--
-- Indices de la tabla `admusuariomenu`
--
ALTER TABLE `admusuariomenu`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_admusuariomenu_admusuarios1` (`idUsuario`),
  ADD KEY `fk_admusuariomenu_admmenu1` (`idMenu`);

--
-- Indices de la tabla `admusuarios`
--
ALTER TABLE `admusuarios`
  ADD PRIMARY KEY (`idUsuario`);

--
-- Indices de la tabla `catcontenidoaudiovisual`
--
ALTER TABLE `catcontenidoaudiovisual`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `catcontenidotextual`
--
ALTER TABLE `catcontenidotextual`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `contenidoaudiovisual`
--
ALTER TABLE `contenidoaudiovisual`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `contenidotextual`
--
ALTER TABLE `contenidotextual`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `mensajeria`
--
ALTER TABLE `mensajeria`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `admmenu`
--
ALTER TABLE `admmenu`
  MODIFY `idMenu` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT de la tabla `admusuariomenu`
--
ALTER TABLE `admusuariomenu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=146;

--
-- AUTO_INCREMENT de la tabla `admusuarios`
--
ALTER TABLE `admusuarios`
  MODIFY `idUsuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `catcontenidoaudiovisual`
--
ALTER TABLE `catcontenidoaudiovisual`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `catcontenidotextual`
--
ALTER TABLE `catcontenidotextual`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `contenidoaudiovisual`
--
ALTER TABLE `contenidoaudiovisual`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- AUTO_INCREMENT de la tabla `contenidotextual`
--
ALTER TABLE `contenidotextual`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT de la tabla `mensajeria`
--
ALTER TABLE `mensajeria`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
