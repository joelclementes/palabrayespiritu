class Registro {
    constructor(reset = false) {
        this.urlProceso = "RegistroContenidoAudiovisual/php/proceso.php";
        this.tabla ="catcontenidoaudiovisual";
        alertify.defaults.transition = "zoom";
        alertify.defaults.theme.ok = "btn btn-primary";
        alertify.defaults.theme.cancel = "btn btn-danger";
        alertify.defaults.theme.input = "form-control";


        if (reset) {
            // En cada módulo hay que usar new Menu().fnCreaMenu() porque si no, desaparecen las opciones
            new Menu().fnCreaMenu();

            new Registro().catcontenido_select_all();
            new Registro().contenidoaudiovisual_select_all();

            // Con esta función cargamos los datos
            new Registro().fnLimpiaDatos();

            // Funciones de los botones cuando se hace clic en ellos.
            document.querySelector("#btnGuardar").addEventListener("click", () => { new Registro().contenidoaudiovisual_save() })
            document.querySelector("#btnCancelar").addEventListener("click", () => { new Registro().fnLimpiaDatos() })

        }
    }

    catcontenido_select_all(){
        let parametrosAjax = { proceso: "CATCONTENIDO_SELECT_ALL", tabla:this.tabla};
        $.ajax({
            data: parametrosAjax,
            url: this.urlProceso,
            dataType:"json",
            success: function (datos) {
                new Registro().fnConstruyeSelect(datos);
            }
        })
    }

    contenidoaudiovisual_select_all(){
        let parametrosAjax = { proceso: "CONTENIDOAUDIOVISUAL_SELECT_ALL", cont: ""};
        $.ajax({
            data: parametrosAjax,
            url: this.urlProceso,
            dataType:"json",
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
        $("#listaElementos").html(elementos);
    }

    fnConstruyeSelect(datos) {
        let elementos = `
            <option value=0>Seleccione</option>
        `;
        for (let d of datos) {
            let jsonDatos = {};
            jsonDatos = JSON.stringify(d);
            elementos += `
                    <option value=${d.id}>${d.nombre}</option>
            `;
        }
        $("#cboTipo").html(elementos);
    }

    fnMuestraDatos(dato) {
        this.fnLimpiaDatos();
        document.querySelector("#txtTitulo").value = dato.titulo;
        document.querySelector("#txtUrl").value = dato.url;
        document.querySelector("#txtPor").value = dato.por;
        document.querySelector("#cboTipo").value = parseInt(dato.idContenidoAudiovisual);
        document.querySelector("#txtFecha").value = dato.fecha.substring(0,10);
        document.querySelector("#txtHora").value = dato.fecha.substring(11,16);

        document.querySelector("#nombreModificado").innerHTML = `Modificando: <strong>${dato.titulo}</strong>`;
        document.querySelector("#txtTitulo").focus();
        localStorage.setItem("idRegistroModificado", dato.id);
    }

    fnBorraDatos(registro){
        let resp = alertify.confirm('Atención', 'Se borrarrá la etiqueta ' + registro.titulo
                , () => { new Registro().catcontenido_delete(registro)  }
                , () => {});
    }

    catcontenido_delete(registro){
        let par_id = registro.id;
        let parametrosAjax = {
            proceso: "CONTENIDOAUDIOVISUAL_DELETE",
            id: par_id,
        }
        $.ajax({
            data: parametrosAjax,
            url: this.urlProceso,
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

    contenidoaudiovisual_save() {
        let par_id = localStorage.getItem("idRegistroModificado") == null ? 0 : parseInt(localStorage.getItem("idRegistroModificado"), 10);
        let par_titulo = document.querySelector("#txtTitulo").value;
        let par_url = document.querySelector("#txtUrl").value;
        let par_por = document.querySelector("#txtPor").value;
        let par_tipo = document.querySelector("#cboTipo").value;
        let par_fecha = `${document.querySelector("#txtFecha").value} ${document.querySelector("#txtHora").value}:00`;

        if (par_titulo == "") {
            alertify.alert('Atención', "No ha capturado título").set('modal', false);
            return;
        }

        if (par_url == "") {
            alertify.alert('Atención', "No ha capturado url").set('modal', false);
            return;
        }

        if(par_tipo == 0) {
            alertify.alert('Atención', "Seleccione un tipo de contenido").set('modal', false);
            return;
        }
        let parametrosAjax = {
            proceso: "CONTENIDOAUDIOVISUAL_SAVE",
            id : par_id,
            titulo : par_titulo,
            url : par_url,
            por : par_por,
            tipo : par_tipo,
            fecha : par_fecha
        }
        $.ajax({
            data: parametrosAjax,
            url: this.urlProceso,
            dataType:"json",
            success: function (resultado) {
                if (resultado != 1) {
                    alertify.alert('Ocurrió un error', resultado).set('modal', false);
                    return;
                } else {
                    new Registro().fnLimpiaDatos();
                }
            }
        })
    }

    fnLimpiaDatos() {
        // DATOS DE ETIQUETA
        document.querySelector("#txtTitulo").value = "";
        document.querySelector("#txtUrl").value = "";
        document.querySelector("#txtPor").value = "";
        document.querySelector("#txtUrl").value = "";
        document.querySelector("#cboTipo").value = 0;
        document.querySelector("#nombreModificado").innerHTML = "Registro nuevo";
        localStorage.removeItem("idRegistroModificado");
        document.querySelector("#txtFecha").value = fechaDeHoy();
        document.querySelector("#txtHora").value = horaActual();

        // Se muestran todos los usuarios al cargar la página
        // new Registro().catcontenido_select_all();
        new Registro().contenidoaudiovisual_select_all();

        document.querySelector("#txtTitulo").focus();
    }
}
window.onload = () => new Registro(true);