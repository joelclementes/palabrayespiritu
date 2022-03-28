<?php 

include_once("../../BackEnd/palabrayespiritu.php");

$oContenido = new Documentos();
$proceso = $_GET["proceso"];

switch ($proceso){
    case "CATCONTENIDO_SELECT_ALL":
        print $oContenido->catcontenido_select_all($_GET["tabla"]);
        break;
    case "CONTENIDOTEXTUAL_SELECT_ALL":
        print $oContenido->contenidotextual_select_all();
        break;
    case "CONTENIDOTEXTUAL_SELECT":
        print $oContenido->contenidotextual_select($_GET["cont"],$_GET["lim"]);
        break;
    case "CONTENIDOTEXTUAL_SAVE":
        print $oContenido->contenidotextual_save(
            $_GET["id"],
            $_GET["idContenidoTextual"],
            $_GET["titulo"],
            $_GET["subtitulo"],
            $_GET["texto"],
            $_GET["por"],
            $_FILES["imagen"]["name"],
            $_FILES["imagen"]["size"],
            $_FILES["imagen"]["tmp_name"],
            $_FILES["imagen"]["type"]
        );
        break;
    case "CONTENIDOTEXTUAL_SAVE_SIN_ARCHIVO":
        print $oContenido->contenidotextual_save_sin_archivo(
            $_GET["id"],
            $_GET["idContenidoTextual"],
            $_GET["titulo"],
            $_GET["subtitulo"],
            $_GET["texto"],
            $_GET["por"]
        );
        break;
    case "CONTENIDOTEXTUAL_DELETE":
        print $oContenido->contenidotextual_delete($_GET["id"]);
        break;
}
?>