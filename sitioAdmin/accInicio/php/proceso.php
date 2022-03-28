<?php 
include_once "../../BackEnd/palabrayespiritu.php";
$oDoc = new Documentos();
$proceso = $_GET["proceso"];

switch ($proceso){
    case "USUARIO_MENU":
        print $oDoc->usuario_menu($_GET["idUsuario"]);
        break;
}
?>