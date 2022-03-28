<?php 
include_once("../../BackEnd/palabrayespiritu.php");

$oEtiq = new Documentos();
$proceso = $_GET["proceso"];

switch ($proceso){
    case "CATCONTENIDO_SELECT_ALL":
        print $oEtiq->catcontenido_select_all($_GET["tabla"]);
        break;
    case "CATCONTENIDO_SAVE":
        print $oEtiq->catcontenido_save(
            $_GET["tabla"],
            $_GET["id"],
            $_GET["nombre"],
            $_GET["descripcion"]
        );
        break;
    case "CATCONTENIDO_DELETE":
        print $oEtiq->catcontenido_delete($_GET["tabla"],$_GET["id"]);
        break;
}
?>