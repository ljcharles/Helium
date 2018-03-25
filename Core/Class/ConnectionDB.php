<?php
/**
 * Created by PhpStorm.
 * User: fresh
 * Date: 2018-03-25
 * Time: PM 14:43
 */

//$connection = Connection::getInstance();
//$query = "SELECT * FROM user WHERE id = :user_id";
//
//$statement = $connection->prepare($query);
//$statement->bindValue('user_id', $user_id, \PDO::PARAM_INT);
//$statement->execute();
//
//$result = $statement->fetchColumn();

class ConnectionDB
{
    protected static $instance;

    /**
     * Connection constructor.
     */
    private function __construct() {
        try {
            self::$instance = new PDO(
                ConfigDB::getDsn(),
                ConfigDB::getUsername(),
                ConfigDB::getPassword(),
                [
                    PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION,
                    PDO::MYSQL_ATTR_INIT_COMMAND =>ConfigDB::getEncoding()
                ]
            );
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