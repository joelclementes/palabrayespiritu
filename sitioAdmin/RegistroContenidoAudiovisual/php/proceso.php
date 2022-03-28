<?php 

include_once("../../BackEnd/palabrayespiritu.php");

$oContenido = new Documentos();
$proceso = $_GET["proceso"];

switch ($proceso){
    case "CATCONTENIDO_SELECT_ALL":
        print $oContenido->catcontenido_select_all($_GET["tabla"]);
        break;
    case "CONTENIDOAUDIOVISUAL_SELECT_ALL":
        print $oContenido->contenidoaudiovisual_select_all($_GET["cont"]);
        break;
    case "CONTENIDOAUDIOVISUAL_SELECT":
        print $oContenido->contenidoaudiovisual_select($_GET["cont"],$_GET["lim"]);
        break;
    case "CONTENIDOAUDIOVISUAL_SAVE":
        print $oContenido->contenidoaudiovisual_save(
            $_GET["id"],
            $_GET["titulo"],
            $_GET["url"],
            $_GET["por"],
            $_GET["tipo"],
            $_GET["fecha"]
        );
        break;
    case "CONTENIDOAUDIOVISUAL_DELETE":
        print $oContenido->contenidoaudiovisual_delete($_GET["id"]);
        break;
}
?>