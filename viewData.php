<?php
/**
 * Created by PhpStorm.
 * User: fresh
 * Date: 2018-03-25
 * Time: PM 23:15
 */

require "Core\Class\ConnectionDB.php";

class viewData{
    function getTexte(){
        $conn = new ConnectionDB();

        $query = "SELECT texte FROM description ORDER BY id DESC LIMIT 1";

        $conn = $conn->getInstance();
        $statement = $conn->query($query);

        $texte = $statement->fetch();

        return $texte['texte'];
    }
}
