<?php
/**
 * Created by PhpStorm.
 * User: fresh
 * Date: 2018-03-25
 * Time: PM 14:43
 */

class Connection
{
    protected static $instance;

    /**
     * Connection constructor.
     */
    private function __construct() {
        try {
            self::$instance = new PDO(Config::getDsn(), Config::getUsername(), Config::getPassword());
        } catch (PDOException $e) {
            echo "MySql Connection Error: " . $e->getMessage();
        }
    }

    /**
     * @return PDO
     */
    public static function getInstance() {
        if (!self::$instance) {
            $object = __CLASS__;
            self::$instance = new $object;
        }

        return self::$instance;
    }

}