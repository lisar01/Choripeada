package unq.tarea.modelo.parcial

import org.uqbar.commons.model.annotations.Observable
import org.uqbar.commons.model.CollectionBasedRepo
import unq.tarea.modelo.parcial.Pago

@Observable
class RepoPagos extends CollectionBasedRepo<Pago> {

	def void create(String nombre, Integer pago, Boolean esBecado) {
		this.create(new Pago => [
			it.nombre = nombre
			it.pago = pago
			it.esBecado = esBecado
		])
	}
	
	def getPagos() {
		allInstances.toList
	}
	
	override protected validateCreate(Pago object) {
		object.validar
	}
	
	override protected getCriterio(Pago example) {
		
	}
	
	override createExample() {
		
	}
	
	override getEntityType() {
		typeof(Pago)
	}
}
