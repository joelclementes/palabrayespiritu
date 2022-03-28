class Registro {
    constructor(reset = false) {
        this.urlProceso = "RegistroContenidoTextual/php/proceso.php";
        this.tabla = "catcontenidotextual";
        alertify.defaults.transition = "zoom";
        alertify.defaults.theme.ok = "btn btn-primary";
        alertify.defaults.theme.cancel = "btn btn-danger";
        alertify.defaults.theme.input = "form-control";

        if (reset) {
            // En cada módulo hay que usar new Menu().fnCreaMenu() porque si no, desaparecen las opciones
            new Menu().fnCreaMenu();

            // Iniciamos la actividad de textarea con clase summernote
            $("#txtTexto").summernote({
                tabsize: 2,
                toolbar: [
                    ['font', ['bold', 'underline', 'italic', 'clear']],
                    ['para', ['ul', 'ol', 'paragraph']],
                    ['insert', ['link']]
                  ]
            });

            new Registro().catcontenido_select_all();
            new Registro().contenidotextual_select_all();

            // Con esta función cargamos los datos
            new Registro().fnLimpiaDatos();

            // Funciones de los botones cuando se hace clic en ellos.
            document.querySelector("#btnGuardar").addEventListener("click", () => { new Registro().contenidotextual_save() })
            document.querySelector("#btnCancelar").addEventListener("click", () => { new Registro().fnLimpiaDatos() })
        }

        this.catcontenido_delete = (registro) => {
            let par_id = registro.id;
            let parametrosAjax = {
                proceso: "CONTENIDOTEXTUAL_DELETE",
                id: par_id,
            }
            $.ajax({
                url: this.urlProceso,
                data: parametrosAjax,
                type:"GET",
                success: function (resultado) {
                    if (resultado != 1) {
                        alertify.alert('Ocurrió un error', resultado).set('modal', false);
                        return;
                    } else {
                        alertify.success('Se borró con éxito')
                        new Registro().fnLimpiaDatos();
                    }
                }
            })
        }

    }

    catcontenido_select_all() {
        let parametrosAjax = { proceso: "CATCONTENIDO_SELECT_ALL", tabla: this.tabla };
        $.ajax({
            url: this.urlProceso,
            data: parametrosAjax,
            dataType: "json",
            type:"GET",
            success: function (datos) {
                new Registro().fnConstruyeSelect(datos);
            }
        })
    }

    contenidotextual_select_all() {
        let parametrosAjax = { proceso: "CONTENIDOTEXTUAL_SELECT_ALL" };
        $.ajax({
            url: this.urlProceso,
            data: parametrosAjax,
            dataType: "json",
            type:"GET",
            success: function (datos) {
                new Registro().fnConstruyeLista(datos);
            }
        })
    }

    fnConstruyeLista(datos) {
        let elementos = ``;
        for (let d of datos) {
            let jsonDatos = {};
            jsonDatos = JSON.stringify(d);
            elementos += `
                    <div class="lista_item">
                        <div class="col-10 lista_nombre">${d.fecha} → Título:${d.titulo} → Tipo:${d.tipo}</div>
                        <div class="col-2 lista_botones">
                            <button style="color:#4582EC" class="btn btn-link" onclick='new Registro().fnMuestraDatos(`+ jsonDatos + `)'><i class="fa fa-pencil-alt"></i></button>
                            <button style="color:#FF0000" class="btn btn-link" onclick='new Registro().fnBorraDatos(`+ jsonDatos + `)'><i class="far fa-trash-alt"></i></button>
                        </div>
                    </div>
            `;
        }
        document.querySelector("#listaElementos").innerHTML = elementos
    }

    fnConstruyeSelect(datos) {
        let elementos = `
            <option value=0>Seleccione</option>
        `;
        for (let d of datos) {
            let jsonDatos = {};
            jsonDatos = JSON.stringify(d);
            elementos += `
                    <option value="${d.id}">${d.nombre}</option>
            `;
        }
        $("#cboTipo").html(elementos);
    }

    fnMuestraDatos(dato) {
        this.fnLimpiaDatos();
        document.querySelector("#txtTitulo").value = dato.titulo;
        document.querySelector("#txtSubtitulo").value = dato.subtitulo;
        document.querySelector("#txtPor").value = dato.por;
        document.querySelector("#cboTipo").value = parseInt(dato.idContenidoTextual);

        // De esta manera asignamos el contenido del campo texto al textarea'
        $("#txtTexto").summernote('code',dato.texto);

        document.querySelector("#nombreModificado").innerHTML = `Modificando: <strong>${dato.titulo}</strong>`;
        document.querySelector("#txtTitulo").focus();
        localStorage.setItem("idRegistroModificado", dato.id);
    }

    fnBorraDatos(registro) {
        let resp = alertify.confirm('Atención', 'Se borrarrá la etiqueta ' + registro.titulo
            , () => { this.catcontenido_delete(registro) }
            , () => { });
    }


    contenidotextual_save() {
        let par_id = localStorage.getItem("idRegistroModificado") == null ? 0 : parseInt(localStorage.getItem("idRegistroModificado"), 10);
        let par_titulo = document.querySelector("#txtTitulo").value;
        let par_texto = document.querySelector("#txtTexto").value;
        let par_tipo = document.querySelector("#cboTipo").value;

        //*** Validamos que se haya capturado lo esencial del formulario ***/  

        if (par_titulo == "") {
            alertify.alert('Atención', "No ha capturado título").set('modal', false);
            return;
        }

        if (par_texto == "") {
            alertify.alert('Atención', "No ha capturado contenido").set('modal', false);
            return;
        }

        if (par_tipo == 0) {
            alertify.alert('Atención', "Seleccione un tipo de contenido").set('modal', false);
            return;
        }

        let par_subtitulo = document.querySelector("#txtSubtitulo").value;
        let par_por = document.querySelector("#txtPor").value;

        var datosEnviados = {
            proceso: "CONTENIDOTEXTUAL_SAVE_SIN_ARCHIVO",
            id : par_id,
            idContenidoTextual: par_tipo,
            titulo: par_titulo,
            subtitulo: par_subtitulo,
            texto : par_texto,
            por: par_por,
        }
        
        try {
            $.ajax({
                url: this.urlProceso,
                type: "GET",
                data: datosEnviados,
                contenType: false,
                cache: false,
                success: function (resultado) {
                    if (resultado != 1) {
                        alertify.alert('Ocurrió un error', resultado).set('modal', false);
                        return;
                    } else {
                        new Registro().fnLimpiaDatos();
                    }
                },
                error: function (jqXHR,textStatus,errorThrown ){
                    console.log("textStatus:"+textStatus)
                    console.log("errorThrown:"+errorThrown)

                }
            })
        } catch (error) {
            console.log(error)
        }
    }

    fnLimpiaDatos() {
        // DATOS DE ETIQUETA
        document.querySelector("#txtTitulo").value = "";
        document.querySelector("#txtSubtitulo").value = "";
        $("#txtTexto").summernote('reset');
        document.querySelector("#txtPor").value = "";
        document.querySelector("#cboTipo").value = 0;
        // document.querySelector("#txtTexto").value = "";
        // document.querySelector("#txtImagen").value = "";
        document.querySelector("#nombreModificado").innerHTML = "Registro nuevo";
        localStorage.removeItem("idRegistroModificado");

        // Se muestran todos los usuarios al cargar la página
        new Registro().contenidotextual_select_all();

        document.querySelector("#txtTitulo").focus();
    }
}
window.onload = () => new Registro(true);