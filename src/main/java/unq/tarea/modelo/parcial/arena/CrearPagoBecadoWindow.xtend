package unq.tarea.modelo.parcial.arena

import unq.tarea.modelo.parcial.arena.CrearPagoWindow
import org.uqbar.arena.windows.WindowOwner
import unq.tarea.modelo.parcial.Pago
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.widgets.RadioSelector
import org.uqbar.arena.bindings.ObservableProperty
import org.uqbar.arena.widgets.Label


class CrearPagoBecadoWindow extends CrearPagoWindow {

	new(WindowOwner owner, Pago pago) {
		super(owner, pago)
		pago.esBecado = true
		title = title + " Becado" 
	}

	override protected createFormPanel(Panel mainPanel) {
		crearBoxDeNombre(mainPanel)
		new Panel(mainPanel) => [

			new Label(it).text = "Monto pagado"

			new RadioSelector(it) => [
				bindItems(new ObservableProperty(modelObject, "posiblesPagos"))
				bindValueToProperty("pago")
			]
		]
	}

}
