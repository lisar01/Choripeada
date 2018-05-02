package unq.tarea.modelo.parcial.arena

import org.uqbar.arena.aop.windows.TransactionalDialog
import unq.tarea.modelo.parcial.Pago
import org.uqbar.arena.windows.WindowOwner
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.widgets.NumericField
import org.uqbar.arena.widgets.Label

import static extension org.uqbar.arena.xtend.ArenaXtendExtensions.*
import unq.tarea.modelo.parcial.PagoAppModel

class EditarPagoWindow extends TransactionalDialog<PagoAppModel>{
	
	new(WindowOwner owner, Pago pago) {
		super(owner, new PagoAppModel(pago))
		title = "Editar Pago"
	}
	
	override protected createFormPanel(Panel mainPanel) {
		
		new Label(mainPanel).text = "Monto pagado"
		
		new NumericField(mainPanel) => [
			value <=> "pago"
			width = 100
		]
	
	}	
	
	override protected addActions(Panel actionsPanel) {
		new Button(actionsPanel) => [
			caption = "Aceptar"
			onClick [|this.accept]
			setAsDefault
			disableOnError	
		]
	}
	
}
