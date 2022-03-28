<?php 
include_once("../../BackEnd/palabrayespiritu.php");

$oAcceso = new Documentos();
$proceso = $_GET["proceso"];

switch ($proceso){
    case "USUARIO_SELECT":
        print $oAcceso->usuario_select($_GET["datosLogin"]);
        break;
    case "VARIABLES_SESION":
        $usu = $_GET["usuario"];
        @session_start();
        $_SESSION["idUsuario"] = $usu["idUsuario"];
        $_SESSION["usuario"] = $usu["clave"];
        $_SESSION["nombreUsuario"] = $usu["nombreUsuario"];
        header("Location: ../../index.php?p=inicio");
        break;
}
?>