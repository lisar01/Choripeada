package unq.tarea.modelo.parcial

import org.uqbar.commons.model.annotations.Observable
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.applicationContext.ApplicationContext
import org.uqbar.commons.model.utils.ObservableUtils
import java.util.List
import org.uqbar.commons.model.annotations.Dependencies

@Observable
@Accessors
class SistemaChoripeada {
	Pago pagoSeleccionado
	List<Pago> pagos

	
	new() {
		pagos = repoPagos.pagos
	}
	
	@Dependencies("pagos")
	def getTotalAsistentes() {
		pagos.size
	}
	
	@Dependencies("pagos")
	def getTotalRecaudacion() {
		pagos.fold(0)[total, pago | pago.pago + total]
	}
	
	def agregarPago(Pago pago) {
		repoPagos.create(pago)
		
		actualizar
	}
		
	def actualizarPago() {
		repoPagos.update(pagoSeleccionado)
		pagoSeleccionado = null
		
		actualizar
	}
	
	def actualizar() {
		pagos = repoPagos.pagos
		ObservableUtils.firePropertyChanged(this, "pagos")
	}
	
	def RepoPagos getRepoPagos() {
		ApplicationContext.instance.getSingleton(typeof(Pago))
	}
	
}