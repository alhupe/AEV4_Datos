<?php

header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: GET");
header("Content-Type: application/json");

// Configuración de la base de datos
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "pokemoncards";

// Conexión a la base de datos
$conn = new mysqli($servername, $username, $password, $dbname);

// Verificar la conexión
if ($conn->connect_error) {
    die("Conexión fallida: " . $conn->connect_error);
}

// Consulta SQL para obtener todos los Pokémon guardados con sus habilidades y ataques
$sql = "SELECT cp.id, cp.nombre, cp.tipo, cp.nivel, cp.hp, cp.debilidades, cp.resistencias, cp.rareza, cp.imagen, a.nombre AS ataque_nombre, a.descripcion AS ataque_descripcion, h.nombre AS habilidad_nombre, h.descripcion AS habilidad_descripcion
        FROM cartas_pokemon cp
        LEFT JOIN carta_ataque ca ON cp.id = ca.carta_id
        LEFT JOIN ataques a ON ca.ataque_id = a.id
        LEFT JOIN carta_habilidad ch ON cp.id = ch.carta_id
        LEFT JOIN habilidades h ON ch.habilidad_id = h.id";

$result = $conn->query($sql);

if ($result->num_rows > 0) {
    // Crear un array para almacenar los resultados
    $pokemonArray = array();

    // Obtener los datos de cada fila y agregarlos al array
    while ($row = $result->fetch_assoc()) {
        $pokemonId = $row['id'];

        // Verificar si ya existe el Pokémon en el array
        $pokemonIndex = array_search($pokemonId, array_column($pokemonArray, 'id'));

        if ($pokemonIndex === false) {
            // Si no existe, crear un nuevo array para el Pokémon
            $pokemon = array(
                'id' => $pokemonId,
                'name' => $row['nombre'],
                'types' => $row['tipo'],
                'level' => $row['nivel'],
                'hp' => $row['hp'],
                'rarity' => $row['rareza'],
                'imagen' => $row['imagen'],
                'images' => array('small' => $row['imagen']),
                'attacks' => array(),
                'abilities' => array()
            );

            // Manejar debilidades y resistencias
            $pokemon['weaknesses'] = array_map(function ($weakness) {
                return array('type' => $weakness);
            }, explode(', ', $row['debilidades']));

            $pokemon['resistances'] = array_map(function ($resistance) {
                return array('type' => $resistance);
            }, explode(', ', $row['resistencias']));

            $pokemonArray[] = $pokemon;
            $pokemonIndex = count($pokemonArray) - 1;
        }

        // Agregar ataques y habilidades al Pokémon
        if (!empty($row['ataque_nombre'])) {
            $pokemonArray[$pokemonIndex]['attacks'][] = array(
                'name' => $row['ataque_nombre'],
                'text' => $row['ataque_descripcion']
            );
        }

        if (!empty($row['habilidad_nombre'])) {
            $pokemonArray[$pokemonIndex]['abilities'][] = array(
                'name' => $row['habilidad_nombre'],
                'text' => $row['habilidad_descripcion']
            );
        }
    }

    // Devolver el array como respuesta en formato JSON
    echo json_encode($pokemonArray);
} else {
    echo json_encode(array('message' => 'No se encontraron Pokémon en la base de datos.'));
}

// Cerrar la conexión a la base de datos
$conn->close();
?>
