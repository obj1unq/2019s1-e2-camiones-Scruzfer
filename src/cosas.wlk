object knightRider {
	method peso() { return 500 }
	method nivelPeligrosidad() { return 10 }
	method bultos() { return 1 }
	method estaSiendoCargado(){}
}

object bumblebee {
	var transformadoEnAuto = true
	
	method peso() { return 800 }
	method nivelPeligrosidad() { return if (transformadoEnAuto) { 15 } else { 30 }  }
	method transformar() { transformadoEnAuto = not transformadoEnAuto }
	method bultos() { return 2 }
	method estaSiendoCargado(){
		transformadoEnAuto = false
	}
}

object paqueteDeLadrillos{
	var property cantidadLadrillos = 100
	
	method cantidadDeLadrillos(cantidad){
		cantidadLadrillos = cantidad
	}
	method peso(){ return 2 * cantidadLadrillos }
	method nivelPeligrosidad(){ return 2 }
	method bultos() { return if(cantidadLadrillos.between(0,100)){1}
							 else if(cantidadLadrillos.between(101,300)){2}
							 else{3}
	}
	
	method estaSiendoCargado(){cantidadLadrillos += 12}
}

object arenaAGranel{
	method peso(kg){ return kg }
	method nivelPeligrosidad(){ return 1 }
	method bultos() { return 1 }
}

object bateriaAntiaerea{
	var conMisiles = true
	
	method peso(){ return if(conMisiles){300} else {200} }
	method nivelPeligrosidad(){ return if(conMisiles){100} else {0} }
	method sacarMisiles(){ conMisiles = not conMisiles }
	method bultos() { return if(conMisiles){2} else {1} }
}

object contenedorPortuario{
	const contenido = []
	
	method agregarContenido(_contenido){
		contenido.add(_contenido)
	}
	method peso(){ return 100 + contenido.sum({unaCosa => unaCosa.peso()})}
	method nivelPeligrosidad(){
		return
			if (contenido.isEmpty()) 0
			else contenido.max({unaCosa => unaCosa.nivelPeligrosidad()}).nivelPeligrosidad()
	}
	method bultos() { return 1 + contenido.sum({unaCosa => unaCosa.bultos()})}
	
	method estaSiendoCargado(){
		contenido.forEach({unaCosa => unaCosa.estaSiendoCargada() })
	}
}

object residuosRadiactivos{
	method peso(variable){return variable}
	
	method nivelPeligrosidad(){ return 200 }
	method bultos() { return 1 }
}

object embalajeDeSeguridad{
	
	method peso(unaCosa){return unaCosa.peso()}
	
	method nivelPeligrosidad(unaCosa){return unaCosa.nivelPeligrosidad() / 2}
	method bultos() { return 2 }
}