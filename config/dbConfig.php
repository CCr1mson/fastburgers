<?php
$hn = 'localhost';
$un = 'fastburgeradmin';
$pw = 'CwLPk/Ys))HH7wAC';
$db = 'fastburgersapp';
$un = 'root';
$pw = '';

$conn = mysqli_connect($hn, $un, $pw, $db);
if (!$conn)
{
    die('Connection Failed: ' . mysqli_connect_error());
}

