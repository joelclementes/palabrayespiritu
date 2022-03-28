class Catalogo {
    constructor(reset = false) {
        this.urlProceso = "CatContenidoAudiovisual/php/proceso.php";
        this.tabla ="catcontenidoaudiovisual";
        alertify.defaults.transition = "zoom";
        alertify.defaults.theme.ok = "btn btn-primary";
        alertify.defaults.theme.cancel = "btn btn-danger";
        alertify.defaults.theme.input = "form-control";
        if (reset) {
            // En cada módulo hay que usar new Menu().fnCreaMenu() porque si no, desaparecen las opciones
            new Menu().fnCreaMenu();

            // Con esta función cargamos los datos
            new Catalogo().fnLimpiaDatos();

            // Funciones de los botones cuando se hace clic en ellos.
            document.querySelector("#btnGuardar").addEventListener("click", () => { new Catalogo().catcontenido_save() })
            document.querySelector("#btnCancelar").addEventListener("click", () => { new Catalogo().fnLimpiaDatos() })

        }
    }

    catcontenido_select_all(){
        let parametrosAjax = { proceso: "CATCONTENIDO_SELECT_ALL", tabla:this.tabla};
        $.ajax({
            data: parametrosAjax,
            url: this.urlProceso,
            dataType:"json",
            success: function (datos) {
                new Catalogo().fnConstruyeLista(datos);
            }
        })
    }

    fnConstruyeLista(datos) {
        // datos = JSON.parse(datos);
        let elementos = ``;
        for (let d of datos) {
            let jsonDatos = {};
            jsonDatos = JSON.stringify(d);
            elementos += `
                    <div class="lista_item">
                        <div class="col-10 lista_nombre">${d.nombre}</div>
                        <div class="col-2 lista_botones">
                            <button style="color:#4582EC" class="btn btn-link" onclick='new Catalogo().fnMuestraDatos(`+ jsonDatos + `)'><i class="fa fa-pencil-alt"></i></button>
                            <button style="color:#FF0000" class="btn btn-link" onclick='new Catalogo().fnBorraDatos(`+ jsonDatos + `)'><i class="far fa-trash-alt"></i></button>
                        </div>
                    </div>
            `;
        }
        $("#listaElementos").html(elementos);
    }


    fnMuestraDatos(dato) {
        new Catalogo().fnLimpiaDatos();
        document.querySelector("#txtNombre").value = dato.nombre;
        document.querySelector("#txtDescripcion").value = dato.descripcion;
        document.querySelector("#nombreModificado").innerHTML = `Modificando etiqueta <strong>${dato.nombre}</strong>`;
        document.querySelector("#txtNombre").focus();
        localStorage.setItem("idRegistroModificado", dato.id);
    }

    fnBorraDatos(depto){
        let resp = alertify.confirm('Atención', 'Se borrarrá la etiqueta ' + depto.nombre
                , () => { new Catalogo().catcontenido_delete(depto)  }
                , () => {});
    }

    catcontenido_delete(depto){
        let par_id = depto.id;
        let parametrosAjax = {
            proceso: "CATCONTENIDO_DELETE",
            id: par_id,
            tabla: this.tabla
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
                    new Catalogo().fnLimpiaDatos();
                }
            }
        })
    }

    catcontenido_save() {
        let par_id = localStorage.getItem("idRegistroModificado") == null ? 0 : parseInt(localStorage.getItem("idRegistroModificado"), 10);
        let par_nombre = document.querySelector("#txtNombre").value;
        let par_descripcion = document.querySelector("#txtDescripcion").value;

        if (par_nombre == "") {
            alertify.alert('Atención', "No ha capturado nombre").set('modal', false);
            return;
        }

        let parametrosAjax = {
            proceso: "CATCONTENIDO_SAVE",
            id: par_id,
            nombre: par_nombre,
            descripcion: par_descripcion,
            tabla: this.tabla
        }
        $.ajax({
            data: parametrosAjax,
            url: this.urlProceso,
            success: function (resultado) {
                if (resultado != 1) {
                    alertify.alert('Ocurrió un error', resultado).set('modal', false);
                    return;
                } else {
                    new Catalogo().fnLimpiaDatos();
                }
            }
        })
    }

    fnLimpiaDatos() {
        // DATOS DE ETIQUETA
        document.querySelector("#txtNombre").value = "";
        document.querySelector("#txtDescripcion").value = "";
        document.querySelector("#nombreModificado").innerHTML = "Etiqueta nueva";
        localStorage.removeItem("idRegistroModificado");

        // Se muestran todos los usuarios al cargar la página
        new Catalogo().catcontenido_select_all();

        document.querySelector("#txtNombre").focus();
    }
}
window.onload = () => new Catalogo(true);