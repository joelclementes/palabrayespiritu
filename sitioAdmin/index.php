<?php 
if (!isset($_SESSION)) {
  @session_start();
}
@$usuario = $_SESSION["usuario"];
@$idUsuario = $_SESSION["idUsuario"];
@$nombreUsuario = $_SESSION["nombreUsuario"];
@$p = $_GET["p"];
$pag = $p . "/index.html";

if ($p == "inicio" || $p=="") {
  $pag = "accInicio/index.html";
}
if ($p == "cambioContrasena") {
  $pag = "paginas/perfil.php";
}
?>
<!DOCTYPE html>
<html lang="es">

<head>
  <title>Gestor de contenidos</title>
  <link rel="icon" href="./images/LogoPalabraEspiritu.ico" />
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1" />

  <?php
  include("estilos.php");
  include("scripts.php");
  ?>

</head>

<body>
  <?php
  if ($usuario == "") {
    require_once("Login/index.html");
  } else { ?>
    <?php require("Menu/index.html"); ?>
    <main style="margin-top:80px">
      <?php
      @include($pag);
      ?>
    </main>
  <?php } ?>

</body>

</html>

