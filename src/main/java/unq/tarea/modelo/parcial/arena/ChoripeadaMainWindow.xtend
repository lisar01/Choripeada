package unq.tarea.modelo.parcial.arena

import org.uqbar.arena.windows.SimpleWindow
import org.uqbar.arena.windows.WindowOwner
import org.uqbar.arena.widgets.Panel
import unq.tarea.modelo.parcial.SistemaChoripeada
import org.uqbar.arena.widgets.tables.Table
import unq.tarea.modelo.parcial.Pago

import static extension org.uqbar.arena.xtend.ArenaXtendExtensions.*
import org.uqbar.arena.widgets.tables.Column
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.bindings.NotNullObservable
import org.uqbar.arena.layout.HorizontalLayout

class ChoripeadaMainWindow extends SimpleWindow<SistemaChoripeada> {

	new(WindowOwner parent) {
		super(parent, new SistemaChoripeada)
		title = "Formulario De Pagos"
	}
	
	override protected createFormPanel(Panel mainPanel) {

		val table = new Table<Pago>(mainPanel, typeof(Pago)) => [
			items <=> "pagos"
			value <=> "pagoSeleccionado"
			title = "Choripeada"
			numberVisibleRows = 10
		]

		new Column<Pago>(table) => [
			title = "Asistente"
			fixedSize = 200
			bindContentsToProperty("nombre")
		]

		new Column<Pago>(table) => [
			title = "Pagado"
			fixedSize = 100
			alignRight
			bindContentsToProperty("pago")
		]
		
		new Column<Pago>(table) => [
			title = "Es Becado"
			fixedSize = 100
			alignRight
			bindContentsToProperty("esBecado").transformer =[ Boolean esBecado |if (esBecado) "SI" else "NO"]
		]

		new Panel(mainPanel) => [
			layout = new HorizontalLayout
			
			new Label(it).text = "Total Asistentes"
			new Label(it) => [
				value <=> "totalAsistentes"
			]
		]
		
		new Panel(mainPanel) => [
			layout = new HorizontalLayout
			
			new Label(it).text = "Total Recaudado"
			new Label(it) => [
				value <=> "totalRecaudacion"
			]
		]
	}

	override protected addActions(Panel actionsPanel) {
		val elementSelected = new NotNullObservable("pagoSeleccionado")

		new Button(actionsPanel) => [
			caption = "Crear"
			onClick([|this.crearPago])
			setAsDefault
			disableOnError
		]
		
		new Button(actionsPanel) => [
			caption = "Crear Becado"
			onClick([|this.crearPagoDeBecado])
			setAsDefault
			disableOnError
		]

		new Button(actionsPanel) => [
			caption = "Editar Pagado"
			onClick([|this.editarPago])
			setAsDefault
			disableOnError
			bindEnabled(elementSelected)
		]

	}

	def crearPago() {
		val pago = new Pago
		new CrearPagoWindow(this, pago) => [
			onAccept[this.modelObject.agregarPago(pago)]
			open
		]
	}
	
		
	def crearPagoDeBecado() {
		val pago = new Pago
		new CrearPagoBecadoWindow(this, pago) => [
			onAccept[this.modelObject.agregarPago(pago)]
			open
		]
	}

	def editarPago() {
		new EditarPagoWindow(this, modelObject.pagoSeleccionado) => [
			onAccept[this.modelObject.actualizarPago]
			open
		]
	}

}
