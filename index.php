<?php
require_once ('lib/rb.php');
R::setup('mysql:host=127.0.0.1; dbname=ese', 'c06', 'pwd');
$pg = (empty($_REQUEST['p'])) ? 'home' : $_REQUEST['p'];
$pg = 'pgs/' . $pg . '.php';
?>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Negozio di Informatica</title>
        <link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    </head>
    <body>
        <div class="container-fluid">
            <?php
            if (file_exists($pg))
                include_once ($pg);
            ?>

        </div>  
        <script
            src="https://code.jquery.com/jquery-3.1.1.min.js"
            integrity="sha256-hVVnYaiADRTO2PzUGmuLJr8BLUSjGIZsDYGmIJLv2b8="
        crossorigin="anonymous"></script>
        <script src='https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js'></script>
    </body>
</html>
