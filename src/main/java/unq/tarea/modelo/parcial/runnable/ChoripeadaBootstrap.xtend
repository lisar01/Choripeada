package unq.tarea.modelo.parcial.runnable

import org.uqbar.commons.applicationContext.ApplicationContext
import unq.tarea.modelo.parcial.Pago
import unq.tarea.modelo.parcial.RepoPagos
import org.uqbar.arena.bootstrap.CollectionBasedBootstrap

class ChoripeadaBootstrap extends CollectionBasedBootstrap {
	
	new() {
		ApplicationContext.instance.configureSingleton(typeof(Pago), new RepoPagos)
	}

	override run() {
		val repoPagos = ApplicationContext.instance.getSingleton(typeof(Pago)) as RepoPagos
		
		repoPagos => [
			create("Lisa Romero", 200,false)
			create("Juan Perez", 10, true)
			create("Debora Fortini", 0, true)
			create("Chiara Dodino", 100, false)
			create("Melina Dodino", 50, false)
		]
		
	}

}
