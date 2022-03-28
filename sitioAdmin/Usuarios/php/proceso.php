<?php 
include_once("../../BackEnd/palabrayespiritu.php");

$oDoc = new Documentos();
$proceso = $_GET["proceso"];

switch ($proceso){
    case "USUARIOS_TODOS":
        print $oDoc->usuarios_todos();
        break;
    case "USUARIO_GUARDA":
        print $oDoc->usuario_guarda(
            $_GET["id"],
            $_GET["nombre"],
            $_GET["clave"],
            $_GET["pwd"],
            $_GET["nuevo"]
        );
        break;
    case "USUARIO_SELECT_DATOS":
        print $oDoc->usuario_select_datos($_GET["idDelUsuario"]);
        break;
    case "USUARIO_BORRA_OPCION_MENU":
        print $oDoc->usuario_borra_opcion_menu($_GET["idQueSeBorra"]);
        break;
    case "USUARIO_AGREGA_OPCION_MENU":
        print $oDoc->usuario_agrega_opcion_menu($_GET["idUsuario"],$_GET["idMenu"]);
        break;
    case "USUARIO_ELIMINA":
        print $oDoc->usuario_elimina($_GET["idUsuario"]);
        break;

}
?>