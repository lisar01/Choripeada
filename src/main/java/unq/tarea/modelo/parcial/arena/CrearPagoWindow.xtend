package unq.tarea.modelo.parcial.arena

import org.uqbar.arena.windows.WindowOwner
import unq.tarea.modelo.parcial.Pago
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.TextBox

import static extension org.uqbar.arena.xtend.ArenaXtendExtensions.*


class CrearPagoWindow extends EditarPagoWindow {
	
	new(WindowOwner owner, Pago pago) {
		super(owner, pago)
		pago.esBecado = false
		title = "Crear Nuevo Pago"
	}
	
	override protected createFormPanel(Panel mainPanel) {
		crearBoxDeNombre(mainPanel)
		super.createFormPanel(mainPanel)
	}
	
	def crearBoxDeNombre(Panel mainPanel){
		new Label(mainPanel).text = "Nombre"
		
		new TextBox(mainPanel) => [
			value <=> "nombre"
			width = 200	
		]
	}
		
}