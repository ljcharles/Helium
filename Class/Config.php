<?php
/**
 * Created by PhpStorm.
 * User: fresh
 * Date: 2018-03-25
 * Time: PM 14:54
 */

class Config
{
    private static $dsn = "mysql:host=localhost;dbname=helium";

    private static $username = "root";

    private static $password = "";

    /**
     * @return string
     */
    public static function getDsn()
    {
        return self::$dsn;
    }

    /**
     * @param string $dsn
     */
    public static function setDsn($dsn)
    {
        self::$dsn = $dsn;
    }

    /**
     * @return string
     */
    public static function getUsername()
    {
        return self::$username;
    }

    /**
     * @param string $username
     */
    public static function setUsername($username)
    {
        self::$username = $username;
    }

    /**
     * @return string
     */
    public static function getPassword()
    {
        return self::$password;
    }

    /**
     * @param string $password
     */
    public static function setPassword($password)
    {
        self::$password = $password;
    }
}