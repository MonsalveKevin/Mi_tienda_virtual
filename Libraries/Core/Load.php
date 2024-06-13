<?php

//Load
$controller = ucwords($controller); //Cambiar la primera letra de los controladores en mayuscula para que no hayan problemas a la hora de subirlo a un hosting
$controllerFile = "Controllers/".$controller.".php";

if (file_exists($controllerFile)) {
    require_once($controllerFile);
    $controller = new $controller();

    if (method_exists($controller, $method)) {
        $controller -> {$method}($params);
    } else {
        require_once("Controllers/Error.php");
    }

} else {
    require_once("Controllers/Error.php");
}


?>