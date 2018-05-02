package unq.tarea.modelo.parcial.runnable

import org.uqbar.arena.Application
import org.uqbar.arena.windows.Window
import unq.tarea.modelo.parcial.arena.ChoripeadaMainWindow

class ChoripeadaApplication extends Application {

	new(ChoripeadaBootstrap bootstrap) {
		super(bootstrap)
	}

	static def void main(String[] args) {
		new ChoripeadaApplication(new ChoripeadaBootstrap).start()
	}

	override protected Window<?> createMainWindow() {
		return new ChoripeadaMainWindow(this)
	}

	
}