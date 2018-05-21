<?php
/**
 * Created by PhpStorm.
 * User: fresh
 * Date: 2018-03-25
 * Time: PM 23:15
 */

require_once 'collectData.php';

if(isset($_POST)){
    $myData = new collectData();
    $myData->insertData();
}

