<?php
include_once 'procesosBD.php';

class jsonUsu{
	public $usuDatos="";
    public $usuPermisos="";
    public $opcDisponibles="";
}

class Documentos{

    const SERVER = "localhost";
    const USER = "root";
    const PWD = "";
    const DB = "palabrayespiritu";
    const FILESPATH = "archivosAdjuntos/";
    const FILESPATHSTORE = "../../archivosAdjuntos";
    
    /******************** MÉTODOS DE USUARIOS *********************/
    public function usuario_select($datosLogin){
        $ProcesosBD = new ProcesosBD(self::SERVER,self::USER,self::PWD,self::DB);
        $consulta = "SELECT * FROM admusuarios WHERE clave = '".$datosLogin['claveLogin']."'";
        return $ProcesosBD->registro($consulta);
    }

    public function usuario_menu($idUsuario){
        $ProcesosBD = new ProcesosBD(self::SERVER,self::USER,self::PWD,self::DB);
        $consulta = "SELECT * FROM admmenu m LEFT JOIN admusuariomenu um ON m.idMenu = um.idMenu WHERE um.idUsuario = ".$idUsuario." order by tituloMenu";
        return $ProcesosBD->tabla($consulta);
    }

    public function usuarios_todos(){
        $ProcesosBD = new ProcesosBD(self::SERVER,self::USER,self::PWD,self::DB);
        $consulta = "SELECT * FROM admusuarios ORDER BY nombreUsuario";
        return $ProcesosBD->tabla($consulta);
    }

    public function usuario_select_datos($idUsuario){
        $ProcesosBD = new ProcesosBD(self::SERVER,self::USER,self::PWD,self::DB);
        
        $consulta = "SELECT idUsuario, nombreUsuario, clave FROM admusuarios WHERE idUsuario = ".$idUsuario." ORDER BY nombreUsuario";
        $consultaPermisos = "SELECT m.tituloMenu, um.id, um.idUsuario, um.idMenu  FROM admusuariomenu um LEFT JOIN admmenu m ON um.idMenu = m.idMenu WHERE um.idUsuario = ".$idUsuario." order by m.tituloMenu" ;
        $consultaOpciones = "SELECT * FROM admmenu ORDER BY tituloMenu";

        $usu = $ProcesosBD->registro($consulta);
        $per = $ProcesosBD->tabla($consultaPermisos);
        $opc = $ProcesosBD->tabla($consultaOpciones);

        $jsonUsu = new jsonUsu();
        $jsonUsu->usuDatos = $usu;
        $jsonUsu->usuPermisos = $per;
        $jsonUsu->opcionesDisponibles = $opc;

        return json_encode($jsonUsu);
    }
    
    public function usuario_borra_opcion_menu($id){
        $ProcesosBD = new ProcesosBD(self::SERVER,self::USER,self::PWD,self::DB);
        $consulta = "DELETE FROM admusuariomenu WHERE id = ".$id;
        return $ProcesosBD->ejecutaSentencia($consulta);
    }

    public function usuario_agrega_opcion_menu($idUsuario,$idMenu){
        $ProcesosBD = new ProcesosBD(self::SERVER,self::USER,self::PWD,self::DB);

        // Evaluamos si ya existe esa opción para el usuario
        $consultaExistente = "SELECT * FROM admusuariomenu WHERE idUsuario = ".$idUsuario." AND idMenu = ".$idMenu;
        $existe = $ProcesosBD->existeRegistro($consultaExistente);
        if($existe == 0){
            $consulta = "INSERT INTO admusuariomenu (idUsuario,idMenu) VALUES (".$idUsuario.",".$idMenu.")";
            return $ProcesosBD->ejecutaSentencia($consulta);
        }
    }

    public function usuario_guarda($id,$nombre,$clave,$pwd,$esNuevo){
        $ProcesosBD = new ProcesosBD(self::SERVER,self::USER,self::PWD,self::DB);      
        
        // Evaluamos si existe un registro con la misma clave
        if($esNuevo==1){
            $consultaExistente = "SELECT * FROM admusuarios WHERE clave = '".$clave."'".$id;
        } else {
            $consultaExistente = "SELECT * FROM admusuarios WHERE clave = '".$clave."' AND idUsuario <> ".$id;
        }
        $existeClave = $ProcesosBD->existeRegistro($consultaExistente);
        // if($existeClave == 1 && $esNuevo == 1){
        if($existeClave == 1){
            return "Ya existe un usuario con esta clave";
        }
        $pwd2 = md5($pwd);
        if($esNuevo==1){
            $consulta = "INSERT INTO admusuarios (nombreUsuario, clave, pwd) VALUES ('".$nombre."','".$clave."','".$pwd2."')";
        } else {
            if($pwd==""){
                $consulta = "UPDATE admusuarios SET nombreUsuario = '".$nombre."', clave = '".$clave."' WHERE idUsuario = ".$id;
            } else {
                $consulta = "UPDATE admusuarios SET nombreUsuario = '".$nombre."', clave = '".$clave."', pwd = '".$pwd2."' WHERE idUsuario = ".$id;
            }
        }

        return $ProcesosBD->ejecutaSentencia($consulta);
    }
    
    public function usuario_elimina($idUsuario){
        $ProcesosBD = new ProcesosBD(self::SERVER,self::USER,self::PWD,self::DB);

        $eliminaOpciones = "DELETE FROM admusuariomenu WHERE idUsuario = ".$idUsuario;
        $ProcesosBD->ejecutaSentencia($eliminaOpciones);

        $eliminaUsuario = "DELETE FROM admusuarios WHERE idUsuario = ".$idUsuario;
        return $ProcesosBD->ejecutaSentencia($eliminaUsuario);
    }

    public function usuario_update_pwd($idUsuario,$pwd){
        $ProcesosBD = new ProcesosBD(self::SERVER,self::USER,self::PWD,self::DB);
        $sentencia = "UPDATE admusuarios SET pwd='".$pwd."' WHERE idUsuario = ".$idUsuario;
        return $ProcesosBD->ejecutaSentencia($sentencia);
    }


    //******************** */ CATÁLOGO DE CONTENIDO AUDIOVISUAL Y TEXTUAL SEGÚN PARÁMETRO *************************/
    public function catcontenido_select_all($tabla){
        $ProcesosBD = new ProcesosBD(self::SERVER,self::USER,self::PWD,self::DB);
        $consulta = "SELECT * FROM $tabla ORDER BY nombre";
        return $ProcesosBD->tabla($consulta);        
    }

    public function catcontenido_save($tabla,$id,$nombre,$descripcion){
        $ProcesosBD = new ProcesosBD(self::SERVER,self::USER,self::PWD,self::DB);
        if($id!=0){
            $sentencia = "UPDATE $tabla SET nombre='$nombre', descripcion='$descripcion' WHERE id = $id";
        } else {
            $sentencia = "INSERT INTO $tabla (nombre,descripcion) VALUES ('$nombre','$descripcion')";
        }
        return $ProcesosBD->ejecutaSentencia($sentencia);
    }

    public function catcontenido_delete($tabla,$id){
        $ProcesosBD = new ProcesosBD(self::SERVER,self::USER,self::PWD,self::DB);
        $sentencia = "DELETE FROM $tabla WHERE id = $id";
        return $ProcesosBD->ejecutaSentencia($sentencia);
    }

    //***************** CONTENIDO AUDIOVISUAL *****************/

    public function contenidoaudiovisual_select_all($contenido=''){
        $ProcesosBD = new ProcesosBD(self::SERVER,self::USER,self::PWD,self::DB);
        if ($contenido==''){
            $consulta = "SELECT c.*, cat.nombre as tipo FROM contenidoaudiovisual c LEFT JOIN catcontenidoaudiovisual cat ON c.idContenidoAudiovisual=cat.id ORDER BY c.fecha DESC  ";
        } else {
            $consulta = "SELECT 
                            c.id,
                            c.idContenidoAudiovisual,
                            c.titulo,
                            DATE_FORMAT(c.fecha,'%d/%m/%Y') AS fecha,
                            c.por,
                            substring(c.url,locate('=',c.url)+1,50) as idVideo, 
                            cat.nombre as tipo 
                        FROM contenidoaudiovisual c LEFT JOIN catcontenidoaudiovisual cat ON c.idContenidoAudiovisual=cat.id 
                        WHERE cat.nombre like '$contenido%' 
                        ORDER BY c.fecha DESC  ";
        }
        return $ProcesosBD->tabla($consulta);
    }

    public function contenidoaudiovisual_select($contenido,$lim){
        $ProcesosBD = new ProcesosBD(self::SERVER,self::USER,self::PWD,self::DB);
        $lim = $lim==0 ? 5 : $lim;
        $consulta = "SELECT 
                        c.id,
                        c.idContenidoAudiovisual,
                        c.titulo,
                        DATE_FORMAT(c.fecha,'%d/%m/%Y') AS fecha,
                        c.por,
                        substring(c.url,locate('=',c.url)+1,50) as idVideo, 
                        cat.nombre as tipo 
                    FROM contenidoaudiovisual c LEFT JOIN catcontenidoaudiovisual cat ON c.idContenidoAudiovisual=cat.id 
                    WHERE cat.nombre like '$contenido%' 
                    ORDER BY c.fecha DESC 
                    LIMIT $lim ";
        return $ProcesosBD->tabla($consulta);
    }

    public function contenidoaudiovisual_save($id,$titulo,$url,$por,$tipo,$fecha){
        $ProcesosBD = new ProcesosBD(self::SERVER,self::USER,self::PWD,self::DB);
        if($id!=0){
            $sentencia = "UPDATE contenidoaudiovisual SET titulo='$titulo', url='$url', por='$por', idContenidoAudiovisual=$tipo, fecha = '$fecha' WHERE id = $id";
        } else {
            $sentencia = "INSERT INTO contenidoaudiovisual (titulo,url,por,idContenidoAudiovisual,fecha) VALUES ('$titulo','$url','$por',$tipo,'$fecha')";
        }
        return $ProcesosBD->ejecutaSentencia($sentencia);
    }

    public function contenidoaudiovisual_delete($id){
        $ProcesosBD = new ProcesosBD(self::SERVER,self::USER,self::PWD,self::DB);
        $sentencia = "DELETE FROM contenidoaudiovisual WHERE id = $id";
        return $ProcesosBD->ejecutaSentencia($sentencia);
    }


    //********************** CONTENIDO TEXTUAL *******************/
    public function contenidotextual_select_all(){
        $ProcesosBD = new ProcesosBD(self::SERVER,self::USER,self::PWD,self::DB);
        $consulta = "SELECT c.*, cat.nombre as tipo FROM contenidotextual c LEFT JOIN catcontenidotextual cat ON c.idContenidoTextual=cat.id ORDER BY c.fecha DESC  ";
        return $ProcesosBD->tabla($consulta); 
    }
    
    public function contenidotextual_select($contenido,$lim){
        $ProcesosBD = new ProcesosBD(self::SERVER,self::USER,self::PWD,self::DB);
        $lim = $lim==0 ? 5 : $lim;
        $consulta = "SELECT 
                        c.id,
                        c.idContenidoTextual,
                        c.titulo,
                        c.subtitulo,
                        c.texto,
                        DATE_FORMAT(c.fecha,'%d/%m/%Y') AS fecha,
                        c.por,
                        cat.nombre as tipo FROM contenidotextual c LEFT JOIN catcontenidotextual cat ON c.idContenidoTextual=cat.id WHERE cat.nombre = '$contenido' ORDER BY c.fecha DESC LIMIT $lim ";
        return $ProcesosBD->tabla($consulta); 
    }

    public function contenidotextual_save($idContenidoTextual,$titulo,$subtitulo,$texto,$por,$nameArchivo,$sizeArchivo,$tmpArchivo,$typeArchivo){
        $target_dir = self::FILESPATHSTORE;
        if (!file_exists($target_dir)) {
			mkdir($target_dir, 0777, true);
		}
        $tarjet_file = $target_dir.'/'.basename($nameArchivo);
        if(move_uploaded_file($tmpArchivo,$tarjet_file)){
            $ProcesosBD = new ProcesosBD(self::SERVER,self::USER,self::PWD,self::DB);
            $sentencia = "INSERT INTO contenidotextual (idContenidoTextual,titulo,subtitulo,texto,por,imagen) VALUES ($idContenidoTextual,'$titulo','$subtitulo','$texto','$por','$nameArchivo')";
            return $ProcesosBD->ejecutaSentencia($sentencia);
        }
    }

    public function contenidotextual_save_sin_archivo($id,$idContenidoTextual,$titulo,$subtitulo,$texto,$por){
        $ProcesosBD = new ProcesosBD(self::SERVER,self::USER,self::PWD,self::DB);
        if($id!=0){
            $sentencia = "UPDATE contenidotextual set idContenidoTextual=$idContenidoTextual, titulo='$titulo', subtitulo='$subtitulo', texto='$texto', por='$por' WHERE id=$id";
        }
        else {
            $sentencia = "INSERT INTO contenidotextual (idContenidoTextual,titulo,subtitulo,texto,por) VALUES ($idContenidoTextual,'$titulo','$subtitulo','$texto','$por')";
        }
        return $ProcesosBD->ejecutaSentencia($sentencia);
    }

    public function contenidotextual_delete($id){
        $ProcesosBD = new ProcesosBD(self::SERVER,self::USER,self::PWD,self::DB);
        $sentencia = "DELETE FROM contenidotextual WHERE id = $id";
        return $ProcesosBD->ejecutaSentencia($sentencia);
    }

    /************************* SELECCION DE DOCUMENTOS *************************/
    public function documentos_select_all($idUsuario,$etiqueta,$idOrigen){
        $ProcesosBD = new ProcesosBD(self::SERVER,self::USER,self::PWD,self::DB);
        $condicionUsuario ="";
        if($idUsuario!=0 && $etiqueta=="" && $idOrigen==0){
            $condicionUsuario = " WHERE d.idRecibio = $idUsuario ";
        }
        if($idUsuario==0 && $etiqueta!="" && $idOrigen==0){
            $condicionUsuario = " WHERE d.etiquetasEntrada LIKE '%$etiqueta%'";
        }
        if($idUsuario==0 && $etiqueta=="" && $idOrigen!=0){
            $condicionUsuario = " WHERE d.idOrigen = $idOrigen";
        }
        $consulta = 
            "SELECT 
                d.idDocumento, 
                o.nombre AS origen,
                u.nombreUsuario AS recibio,
                d.numeroOficio,
                DATE_FORMAT(d.fecha,'%d-%m-%Y') AS fechaOficio,
                d.firmadoPor,
                d.asunto,
                d.etiquetasEntrada,
                DATE_FORMAT(d.fecha,'%d-%m-%Y') AS fechaRegistro,
                DATE_FORMAT(d.fecha,'%h:%i%p') AS hora,
                d.archivo as nombreArchivo,
                concat('".self::FILESPATH."',d.archivo) AS archivo,
                d.notas 
            FROM documento d LEFT JOIN catorigen o ON d.idOrigen = o.idOrigen LEFT JOIN 
                admusuarios u ON d.idRecibio = u.idUsuario 
                $condicionUsuario 
            ORDER BY d.fecha DESC";
            
        return $ProcesosBD->tabla($consulta);
    }

    public function documentos_actualiza_historial($idDocumento,$nota,$idUsuario){
        $ProcesosBD = new ProcesosBD(self::SERVER,self::USER,self::PWD,self::DB);
        $sentencia = "INSERT INTO documentohistorial (idDocumento,nota,idUsuario) VALUES ($idDocumento,'$nota',$idUsuario)";
        $ProcesosBD->ejecutaSentencia($sentencia);
        $this->documentos_historial_select($idDocumento);
    }

    public function documentos_update_documento($idDocumento,$nameArchivo,$tmpArchivo){
        $ProcesosBD = new ProcesosBD(self::SERVER,self::USER,self::PWD,self::DB);

        $target_dir = self::FILESPATHSTORE;
        if (!file_exists($target_dir)) {
			mkdir($target_dir, 0777, true);
		}
        $tarjet_file = $target_dir.'/'.basename($nameArchivo);
        if(move_uploaded_file($tmpArchivo,$tarjet_file)){
            $ProcesosBD = new ProcesosBD(self::SERVER,self::USER,self::PWD,self::DB);
            $sentencia = "UPDATE documento SET archivo = '$nameArchivo' WHERE idDocumento = $idDocumento";
            return $ProcesosBD->ejecutaSentencia($sentencia);
        }
    }

    public function documentos_historial_select($idDocumento){
        $ProcesosBD = new ProcesosBD(self::SERVER,self::USER,self::PWD,self::DB);
        $consulta = 
            "SELECT 
                dh.id, 
                u.idUsuario,
                dh.idDocumento,
                dh.nota,
                DATE_FORMAT(dh.fecha,'%d-%m-%Y') AS fecha,
                DATE_FORMAT(dh.fecha,'%h:%i%p') AS hora,
                u.nombreUsuario
            FROM documentohistorial dh LEFT JOIN admusuarios u ON dh.idUsuario = u.idUsuario 
            WHERE idDocumento = $idDocumento 
            ORDER BY id DESC";
        return $ProcesosBD->tabla($consulta);
    }

    public function usuario_recibio_select(){
        $ProcesosBD = new ProcesosBD(self::SERVER,self::USER,self::PWD,self::DB);
        $consulta = 
        "SELECT DISTINCT
                0 as idUsuario, 
                'TODOS LOS DOCUMENTOS' as nombreUsuario,
                count(idDocumento) as tantos
            FROM documento  
        UNION
        SELECT DISTINCT
                u.idUsuario, 
                u.nombreUsuario,
                count(d.idDocumento) as tantos
            FROM documento d LEFT JOIN admusuarios u ON d.idRecibio = u.idUsuario 
            GROUP BY nombreUsuario 
            ORDER BY idUsuario, nombreUsuario
        ";
        return $ProcesosBD->tabla($consulta);
    }

    public function etiquetasEntada_select(){
        $ProcesosBD = new ProcesosBD(self::SERVER,self::USER,self::PWD,self::DB);
        $jsonDatos = new jsonDocumentosEtiquetas();
        $consulta1 = "SELECT etiquetasEntrada FROM documento";
        $jsonDatos->datEtiquetasEntrada = $ProcesosBD->tabla($consulta1);

        $consulta2 = "SELECT nombre FROM catetiquetas ORDER BY nombre";
        $jsonDatos->datEtiquetas = $ProcesosBD->tabla($consulta2);

        return json_encode($jsonDatos);
    }

    public function origenEntrada_select(){
        $ProcesosBD = new ProcesosBD(self::SERVER,self::USER,self::PWD,self::DB);
        $consulta = 
        "SELECT DISTINCT
                o.idOrigen, 
                o.nombre as nombreOrigen,
                count(d.idDocumento) as tantos
            FROM documento d LEFT JOIN catorigen o ON d.idOrigen = o.idOrigen 
            GROUP BY nombreOrigen 
            ORDER BY idOrigen, nombreOrigen
        ";
        return $ProcesosBD->tabla($consulta);
    }

    public function documentos_borra_comentario($id){
        $ProcesosBD = new ProcesosBD(self::SERVER,self::USER,self::PWD,self::DB);
        $sentencia = "DELETE FROM documentohistorial WHERE id = $id";
        return $ProcesosBD->ejecutaSentencia($sentencia);
    }
}
