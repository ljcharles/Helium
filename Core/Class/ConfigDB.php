<?php
/**
 * Created by PhpStorm.
 * User: fresh
 * Date: 2018-03-25
 * Time: PM 14:54
 */

class ConfigDB
{
    private static $dsn = "mysql:host=localhost;dbname=helium";

    private static $username = "root";

    private static $password = "";

    private static $encoding = "SET NAMES utf8";

    /**
     * @return string
     */
    public static function getEncoding()
    {
        return self::$encoding;
    }

    /**
     * @param string $encoding
     */
    public static function setEncoding($encoding)
    {
        self::$encoding = $encoding;
    }

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