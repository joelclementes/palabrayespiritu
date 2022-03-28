<?php 
include_once("../../BackEnd/palabrayespiritu.php");

$oAcceso = new documentos();
$proceso = $_GET["proceso"];

switch ($proceso){
    case "USUARIO_MENU":
        print $oAcceso->usuario_menu($_GET["idUsuario"]);
        break;
}
?>