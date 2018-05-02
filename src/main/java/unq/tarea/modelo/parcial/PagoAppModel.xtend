package unq.tarea.modelo.parcial

import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.model.annotations.TransactionalAndObservable
import org.uqbar.commons.model.exceptions.UserException

@Accessors
@TransactionalAndObservable
class PagoAppModel {
	Pago pagoSeleccionado

	new(Pago unPago) {
		pagoSeleccionado = unPago
	}
	
	def getNombre() {
		pagoSeleccionado.nombre
	}

	def setNombre(String nombre) {
		if (nombre === null || nombre.trim().equals("")) {
			throw new UserException("No ha a ingresado el nombre")
		}
		pagoSeleccionado.nombre = nombre
	}
	
	def getPago() {
		pagoSeleccionado.pago
	}

	def setPago(int pago) {
		pagoSeleccionado.pago = pago
	}
	
	def getPosiblesPagos() {
		#[0,10]
	}

}
