<?php
/**
 * Created by PhpStorm.
 * User: fresh
 * Date: 2018-03-25
 * Time: PM 23:15
 */

require "Core\Class\ConnectionDB.php";
$conn = new ConnectionDB();

$monTexte = $_POST["monTexte"];

$query = "INSERT INTO description(texte) VALUES(?)";

$conn = $conn->getInstance();
$statement = $conn->prepare($query);
$statement->bindParam(1,$monTexte);
$statement->execute();

