import cosas.*

object camion {
	const property cosas = []
	const property peso = 1000
	var property pesoMaximo = 2500
	var property pesosDeLasCosas = []
	
	method cargar(unaCosa) {
		cosas.add(unaCosa)
		unaCosa.estaSiendoCargado()
	}
	
	method descargar(unaCosa){
		cosas.remove(unaCosa)
	}
	
	method pesoTotal(){
		return peso + cosas.sum({unaCosa => unaCosa.peso()})
	}
	
	method excedidoDePeso(){
		return self.pesoTotal() > pesoMaximo
	}
	
	method objetosPeligrosos(nivel){
		return cosas.filter({unaCosa => unaCosa.nivelPeligrosidad() > nivel})
	}
	
	method objetosMasPeligrososQue(cosa){
		return cosas.filter({unaCosa => unaCosa.nivelPeligrosidad() > cosa.nivelPeligrosidad()})
	}
	
	method puedeCircularEnRuta(nivelMaximoPeligrosidad){
		return cosas.all({unaCosa => unaCosa.nivelPeligrosidad() <= nivelMaximoPeligrosidad})
	}
	
/* 	method puedeCircularEnRuta(nivelMaximoPeligrosidad){
		return cosas.filter({unaCosa => unaCosa.nivelPeligrosidad() > nivelMaximoPeligrosidad}) == []
	}*/ //Otra forma de hacer lo mismo **CONSULTAR**
	
	method tieneAlgoQuePesaEntre(min,max){
		return cosas.any({unaCosa => unaCosa.peso() > min and unaCosa.peso() < max})
	}
	
	method cosaMasPesada(){
		return cosas.max({unaCosa => unaCosa.peso()})
	}
	
	method totalBultos(){
		return cosas.sum({unaCosa => unaCosa.bultos()})
	}
	
	method pesos(){
		return cosas.forEach({unaCosa => pesosDeLasCosas.add(unaCosa.peso())})
	}
}
