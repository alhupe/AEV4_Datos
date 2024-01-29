<?php

header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: POST");

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

// Verificar si se ha enviado información desde el formulario
if (isset($_POST['nombrePokemon'])) {
    $idPokemon = $_POST['idPokemon'];
    $nombrePokemon = $_POST['nombrePokemon'];
    $tipo = $_POST['tipo'];
    $nivel = $_POST['nivel'];
    $hp = $_POST['hp'];
    $debilidades = $_POST['debilidades'];
    $resistencias = $_POST['resistencias'];
    $rareza = $_POST['rareza'];
    $imagen = $_POST['imagen'];

    // Consulta SQL para insertar datos en la tabla cartas_pokemon
    $sqlCarta = $conn->prepare("INSERT INTO cartas_pokemon (id, nombre, tipo,  nivel, hp, debilidades, resistencias, rareza, imagen) 
                                VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)");

    $sqlCarta->bind_param("sssisssss", $idPokemon, $nombrePokemon, $tipo, $nivel, $hp, $debilidades, $resistencias, $rareza, $imagen);


    // Ejecutar la consulta para insertar la carta
if ($sqlCarta->execute() === TRUE) {
        // Verificar si se proporcionaron ataques
        if (isset($_POST['ataques'])) {
            $ataques = explode(', ', $_POST['ataques']);
            $ataquesDesc = explode(', ', $_POST['ataquesDesc']);

            // Insertar ataques en la tabla ataques y establecer la relación en la tabla carta_ataque
            foreach ($ataques as $key => $ataque) {
                $descripcionAtaque = $ataquesDesc[$key];

                // Consulta SQL para insertar datos en la tabla ataques
                $sqlAtaque = "INSERT INTO ataques (nombre, descripcion) VALUES ('$ataque', '$descripcionAtaque')";

                $conn->query($sqlAtaque);

                $ataqueId = $conn->insert_id;

                // Consulta SQL para establecer la relación en la tabla carta_ataque
                $sqlRelacion = "INSERT INTO carta_ataque (carta_id, ataque_id) VALUES ('$idPokemon', '$ataqueId')";

                $conn->query($sqlRelacion);
            }
        }

        // Verificar si se proporcionaron habilidades
        if (isset($_POST['habilidades'])) {
            $habilidades = explode(', ', $_POST['habilidades']);
            $habilidadesDesc = explode(', ', $_POST['habilidadesDesc']);

            // Insertar habilidades en la tabla habilidades y establecer la relación en la tabla carta_habilidad
            for ($i = 0; $i < count($habilidades); $i++) {
                $nombreHabilidad = $habilidades[$i];
                $descripcionHabilidad = $habilidadesDesc[$i];

                // Consulta SQL para insertar datos en la tabla habilidades
                $sqlHabilidad = "INSERT INTO habilidades (nombre, descripcion) VALUES ('$nombreHabilidad', '$descripcionHabilidad')";

                $conn->query($sqlHabilidad);

                $habilidadId = $conn->insert_id;

                // Consulta SQL para establecer la relación en la tabla carta_habilidad
                $sqlRelacionHabilidad = "INSERT INTO carta_habilidad (carta_id, habilidad_id) VALUES ('$idPokemon', '$habilidadId')";


                $conn->query($sqlRelacionHabilidad);
            }
        }

        echo "Registro insertado correctamente";
    } else {
        echo "Error al insertar el registro de la carta: " . $conn->error;
    }
}

// Cerrar la conexión a la base de datos
$conn->close();
?>
