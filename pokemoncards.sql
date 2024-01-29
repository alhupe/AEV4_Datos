-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 29-01-2024 a las 23:44:57
-- Versión del servidor: 10.4.27-MariaDB
-- Versión de PHP: 8.1.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `pokemoncards`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ataques`
--

CREATE TABLE `ataques` (
  `id` int(11) NOT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  `descripcion` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `ataques`
--

INSERT INTO `ataques` (`id`, `nombre`, `descripcion`) VALUES
(74, 'Psyshock', 'Flip a coin. If heads'),
(75, 'Copy', 'Choose 1 of the Defending Pokémon\'s attacks. Copy copies that attack. This attack does nothing if Mew doesn\'t have the Energy necessary to use that attack. (You must still do anything else required for that attack.) Mew performs that attack.'),
(76, 'Extra Draw', 'If your opponent has any Pokémon-ex in play'),
(77, 'Link Blast', 'If Mew and the Defending Pokémon have a different amount of Energy attached to them'),
(78, 'Surprise Attack', 'Flip a coin. If tails'),
(79, 'Blast Burn', 'Flip a coin. If heads'),
(80, 'Fire Spin', 'Discard 2 Energy cards attached to Charizard or this attack does nothing.'),
(81, 'Forest Dump', ''),
(82, 'Solar Plant-GX', 'This attack does 50 damage to each of your opponent\'s Pokémon. If this Pokémon has at least 2 extra Energy attached to it (in addition to this attack\'s cost)'),
(83, 'Rainbow Wave', 'Choose a type of Energy other than Colorless attached to Mew. This attack does 20 damage to each of your opponent\'s Pokémon of that type (including Benched Pokémon). Don\'t apply Weakness and Resistance.'),
(84, 'Future Sight', 'Look at the top 5 cards of either player\'s deck and put them back on top of that player\'s deck in any order.'),
(85, 'Leaf Bind', 'Flip a coin. If heads'),
(86, 'Confuse Ray', 'Flip a coin. If heads'),
(87, 'Stoke', 'Flip a coin. If heads'),
(88, 'Fire Blast', 'search your deck for up to 3 basic Energy cards and attach them to this Pokémon. Shuffle your deck afterward.'),
(89, 'Aqua Press', 'Does 20 damage plus 10 more damage for each Energy attached to all Pokémon (both yours and your opponent\'s).'),
(90, 'Double Launcher', 'Discard 2 Energy attached to Blastoise. Choose 2 of your opponent\'s Benched Pokémon. This attack does 60 damage to each of them. (Don\'t apply Weakness and Resistance for Benched Pokémon.) Blastoise can\'t use Double Launcher during your next turn.'),
(91, 'Lariat', 'Flip a coin. If tails'),
(92, 'Swift', 'This attack\'s damage isn\'t affected by Weakness'),
(93, 'Leaf Storm', 'Heal 40 damage from each of your Grass Pokémon.'),
(94, 'Flog', 'Flip a coin. If heads'),
(95, 'Fairy Power', 'Return 1 of your Pokémon and all cards attached to it in your hand.'),
(96, 'Moon Impact', ''),
(97, 'Hypnoblast', 'The Defending Pokémon is now Asleep.'),
(98, 'Psychic', 'Does 40 damage plus 10 more damage for each Energy attached to the Defending Pokémon.'),
(99, 'Pulse Blast', ''),
(100, 'Double Leg Hammer', 'Choose 2 of your opponent\'s Benched Pokémon. This attack does 40 damage to each of them. (Don\'t apply Weakness and Resistance for Benched Pokémon.)');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cartas_pokemon`
--

CREATE TABLE `cartas_pokemon` (
  `id` varchar(255) NOT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  `tipo` varchar(50) DEFAULT NULL,
  `nivel` varchar(50) DEFAULT NULL,
  `hp` int(11) DEFAULT NULL,
  `debilidades` varchar(255) DEFAULT NULL,
  `resistencias` varchar(255) DEFAULT NULL,
  `rareza` varchar(50) DEFAULT NULL,
  `imagen` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `cartas_pokemon`
--

INSERT INTO `cartas_pokemon` (`id`, `nombre`, `tipo`, `nivel`, `hp`, `debilidades`, `resistencias`, `rareza`, `imagen`) VALUES
('base1-1', 'Alakazam', 'Psychic', '42', 80, 'Psychic', '', 'Rare Holo', 'https://images.pokemontcg.io/base1/1.png'),
('base6-3', 'Charizard', 'Fire', '76', 120, 'Water', 'Fighting', 'Rare Holo', 'https://images.pokemontcg.io/base6/3.png'),
('col1-1', 'Clefable', 'Colorless', '0', 80, 'Fighting', '', 'Rare Holo', 'https://images.pokemontcg.io/col1/1.png'),
('dp3-3', 'Charizard', 'Fire', '55', 130, 'Water', 'Fighting', 'Rare Holo', 'https://images.pokemontcg.io/dp3/3.png'),
('dp6-11', 'Mewtwo', 'Psychic', '42', 80, 'Psychic', '', 'Rare Holo', 'https://images.pokemontcg.io/dp6/11.png'),
('ex12-10', 'Mew', 'Psychic', '0', 70, 'Psychic', '', 'Rare Holo', 'https://images.pokemontcg.io/ex12/10.png'),
('ex9-2', 'Deoxys', 'Psychic', '0', 70, 'Psychic', '', 'Rare Holo', 'https://images.pokemontcg.io/ex9/2.png'),
('gym1-2', 'Brock\'s Rhydon', 'Fighting', '38', 80, 'Grass', 'Lightning', 'Rare Holo', 'https://images.pokemontcg.io/gym1/2.png'),
('hgss2-4', 'Metagross', 'Psychic', '0', 130, 'Psychic', '', 'Rare Holo', 'https://images.pokemontcg.io/hgss2/4.png'),
('hgss4-3', 'Celebi', 'Psychic', '0', 70, 'Psychic', '', 'Rare Holo', 'https://images.pokemontcg.io/hgss4/3.png'),
('mcd19-1', 'Caterpie', 'Grass', '0', 50, 'Fire', '', '', 'https://images.pokemontcg.io/mcd19/1.png'),
('pl1-2', 'Blastoise', 'Water', '60', 130, 'Lightning', '', 'Rare Holo', 'https://images.pokemontcg.io/pl1/2.png'),
('pop4-4', 'Mew', 'Psychic', '0', 70, 'Psychic', '', 'Rare', 'https://images.pokemontcg.io/pop4/4.png'),
('pop5-3', 'Mew δ', 'Fire', '0', 60, 'Psychic', '', 'Rare', 'https://images.pokemontcg.io/pop5/3.png'),
('si1-1', 'Mew', 'Psychic', '0', 30, 'Psychic', '', '', 'https://images.pokemontcg.io/si1/1.png'),
('sm12-1', 'Venusaur & Snivy-GX', 'Grass', '0', 270, 'Fire', '', 'Rare Holo GX', 'https://images.pokemontcg.io/sm12/1.png'),
('xy11-2', 'Tangrowth', 'Grass', '0', 130, 'Fire', '', 'Uncommon', 'https://images.pokemontcg.io/xy11/2.png'),
('xy2-11', 'Charizard-EX', 'Fire', '0', 180, 'Water', '', 'Rare Holo EX', 'https://images.pokemontcg.io/xy2/11.png');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `carta_ataque`
--

CREATE TABLE `carta_ataque` (
  `carta_id` varchar(255) NOT NULL,
  `ataque_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `carta_ataque`
--

INSERT INTO `carta_ataque` (`carta_id`, `ataque_id`) VALUES
('base1-1', 86),
('base6-3', 80),
('col1-1', 95),
('col1-1', 96),
('dp3-3', 79),
('dp6-11', 97),
('dp6-11', 98),
('ex12-10', 77),
('ex9-2', 92),
('gym1-2', 91),
('hgss2-4', 99),
('hgss2-4', 100),
('hgss4-3', 84),
('hgss4-3', 85),
('mcd19-1', 78),
('pl1-2', 89),
('pl1-2', 90),
('pop4-4', 74),
('pop5-3', 75),
('pop5-3', 76),
('si1-1', 83),
('sm12-1', 81),
('sm12-1', 82),
('xy11-2', 93),
('xy11-2', 94),
('xy2-11', 87),
('xy2-11', 88);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `carta_habilidad`
--

CREATE TABLE `carta_habilidad` (
  `carta_id` varchar(255) NOT NULL,
  `habilidad_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `carta_habilidad`
--

INSERT INTO `carta_habilidad` (`carta_id`, `habilidad_id`) VALUES
('base1-1', 56),
('base6-3', 52),
('col1-1', 62),
('dp3-3', 51),
('dp6-11', 63),
('ex12-10', 49),
('ex9-2', 60),
('gym1-2', 59),
('hgss2-4', 64),
('hgss4-3', 55),
('mcd19-1', 50),
('pl1-2', 58),
('pop4-4', 47),
('pop5-3', 48),
('si1-1', 54),
('sm12-1', 53),
('xy11-2', 61),
('xy2-11', 57);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `habilidades`
--

CREATE TABLE `habilidades` (
  `id` int(11) NOT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  `descripcion` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `habilidades`
--

INSERT INTO `habilidades` (`id`, `nombre`, `descripcion`) VALUES
(47, 'Reactive Barrier', 'As long as Mew has any React Energy cards attached to it'),
(48, '', ''),
(49, 'Type Change', 'Once during your turn (before your attack)'),
(50, '', ''),
(51, 'Fury Blaze', 'If your opponent has 3 or less Prize cards left'),
(52, 'Energy Burn', 'As often as you like during your turn (before your attack)'),
(53, 'Shining Vine', 'Once during your turn'),
(54, '', ''),
(55, '', ''),
(56, 'Damage Swap', 'As often as you like during your turn (before your attack)'),
(57, '', ''),
(58, 'Dig Well', 'Once during your turn (before your attack)'),
(59, 'Bench Guard', 'As long as Brock\'s Rhydon is Benched'),
(60, 'Form Change', 'Once during your turn (before your attack)'),
(61, '', ''),
(62, '', ''),
(63, '', ''),
(64, 'Psychic Float', 'If you have any Psychic Energy attached to your Active Pokémon');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `ataques`
--
ALTER TABLE `ataques`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `cartas_pokemon`
--
ALTER TABLE `cartas_pokemon`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `carta_ataque`
--
ALTER TABLE `carta_ataque`
  ADD PRIMARY KEY (`carta_id`,`ataque_id`),
  ADD KEY `ataque_id` (`ataque_id`);

--
-- Indices de la tabla `carta_habilidad`
--
ALTER TABLE `carta_habilidad`
  ADD PRIMARY KEY (`carta_id`,`habilidad_id`),
  ADD KEY `habilidad_id` (`habilidad_id`);

--
-- Indices de la tabla `habilidades`
--
ALTER TABLE `habilidades`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `ataques`
--
ALTER TABLE `ataques`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;

--
-- AUTO_INCREMENT de la tabla `habilidades`
--
ALTER TABLE `habilidades`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=65;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `carta_ataque`
--
ALTER TABLE `carta_ataque`
  ADD CONSTRAINT `carta_ataque_ibfk_1` FOREIGN KEY (`carta_id`) REFERENCES `cartas_pokemon` (`id`),
  ADD CONSTRAINT `carta_ataque_ibfk_2` FOREIGN KEY (`ataque_id`) REFERENCES `ataques` (`id`);

--
-- Filtros para la tabla `carta_habilidad`
--
ALTER TABLE `carta_habilidad`
  ADD CONSTRAINT `carta_habilidad_ibfk_1` FOREIGN KEY (`carta_id`) REFERENCES `cartas_pokemon` (`id`),
  ADD CONSTRAINT `carta_habilidad_ibfk_2` FOREIGN KEY (`habilidad_id`) REFERENCES `habilidades` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
