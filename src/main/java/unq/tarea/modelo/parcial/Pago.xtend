package unq.tarea.modelo.parcial

import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.model.Entity
import org.uqbar.commons.model.annotations.TransactionalAndObservable
import org.uqbar.commons.model.exceptions.UserException

@Accessors
@TransactionalAndObservable
class Pago extends Entity {
	String nombre
	int pago
	Boolean esBecado
	
	def validar() {
		if (nombre === null || nombre.trim().equals("")) {
			throw new UserException("No ha a ingresado el nombre")
		}
	}
	
}