<?php

//Retorna la url de la tienda
function base_url()
{
    return BASE_URL;
}

function media() {
    return BASE_URL. "/Assets/";
}

//Retorna el archivo que contiene el header de la vista administrador
function headerAdmin($data= "") {
    $view_header = "Views/Template/header_admin.php";
    require_once $view_header;
}

//Retorna el archivo que contiene el footer de la vista administrador
function footerAdmin($data= "") {
    $view_footer = "Views/Template/footer_admin.php";
    require_once $view_footer;
}

//Retorna la información ya formateada
function dep($data)
{
    $format = print_r("<pre>");
    $format .= print_r($data);
    $format .= print_r("</pre>");
    return $format;
}

//Retornar modals o ventanas de formularios
function getModal(string $nameModal, $data){
    $view_modal =  "Views/Template/Modals/{$nameModal}.php";
    require_once $view_modal;
}

//Función para limpiar cadenas de caracteres
function strClean($strCadena)
{
    $string = preg_replace(['/\s+/', '/^\s|\s$/'], [' ', ''], $strCadena);
    $string = trim($string); //Elimina espacios en blanco al inicio y al final
    $string = stripslashes($string); // Elimina las \ invertidas
    $string = str_ireplace("<script>", "", $string);
    $string = str_ireplace("</script>", "", $string);
    $string = str_ireplace("<script src>", "", $string);
    $string = str_ireplace("<script type=>", "", $string);
    $string = str_ireplace("SELECT * FROM", "", $string);
    $string = str_ireplace("DELETE FROM", "", $string);
    $string = str_ireplace("INSERT INTO", "", $string);
    $string = str_ireplace("SELECT COUNT(*) FROM", "", $string);
    $string = str_ireplace("DROP TABLE", "", $string);
    $string = str_ireplace("OR '1'='1", "", $string);
    $string = str_ireplace('OR "1"="1"', "", $string);
    $string = str_ireplace('OR ´1´=´1´', "", $string);
    $string = str_ireplace("is NULL; --", "", $string);
    $string = str_ireplace("is NULL; --", "", $string);
    $string = str_ireplace("LIKE '", "", $string);
    $string = str_ireplace('LIKE "', "", $string);
    $string = str_ireplace("LIKE ´", "", $string);
    $string = str_ireplace("OR 'a'='a", "", $string);
    $string = str_ireplace('OR "a"="a', "", $string);
    $string = str_ireplace("OR ´a´=´a", "", $string);
    $string = str_ireplace("OR ´a´=´a", "", $string);
    $string = str_ireplace("--", "", $string);
    $string = str_ireplace("^", "", $string);
    $string = str_ireplace("[", "", $string);
    $string = str_ireplace("]", "", $string);
    $string = str_ireplace("==", "", $string);
    return $string;
}

//Función para generar una contraseña de 12 caracteres
function generarPassword($length = 12)
{
    $password = "";
    $longitudPass = $length;
    $cadena = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz1234567890%&#$/";
    $longitudCadena = strlen($cadena);

    for ($i = 1; $i <= $longitudPass; $i++) {
        $pos = rand(0, $longitudCadena - 1);
        $password .= substr($cadena, $pos, 1);
    }
    return $password;
}

//Función para generar un token para restablecer contraseña
function token()
{
    $r1 = bin2hex(random_bytes(8));
    $r2 = bin2hex(random_bytes(8));
    $r3 = bin2hex(random_bytes(8));
    $r4 = bin2hex(random_bytes(8));
    $token = $r1 . '-' . $r2 . '-' . $r3 . '-' . $r4;
    return $token;
}

//Función para dar formato a valores monetarios
function formatoMoneda($valor)
{
    return number_format($valor, 0, SPM, SPD);
    return $valor;
}
