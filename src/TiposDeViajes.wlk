import Socios.*

class Viajes {
	
	var property idiomas = #{}
	var property esfuerzo 
	var property sirveParaBroncearse
	var property cantDias = 0
	
	method esInteresante(){ return idiomas > 2}
	method idioma(tipo){ idiomas.add(tipo)}
	
	method esRecomendada(socio){ return self.esInteresante() and socio.leAtrae() and not socio.actividades().conteins(self) }
}

class ALaPlaya inherits Viajes{
	
	var property largo = 0
	
	override method cantDias(){ return (largo.div(500)) }
	override method esfuerzo(){ return largo >= 1200 }
	override method sirveParaBroncearse(){ return true }
}

class ALaCuidad inherits Viajes{
	var property cantExcursiones = 0
	
	override method cantDias(){ return (cantExcursiones.div(2)).dib() }
	override method esfuerzo(){ return cantExcursiones.between(5, 8) and not sirveParaBroncearse }
	
	override method esInteresante(){return super() or cantExcursiones == 5}
}

class ALaCuidadTropical inherits ALaCuidad{
	
	override method cantDias(){ return (cantExcursiones.div(2)) + 1}
	override method esfuerzo(){ return cantExcursiones.between(5, 8) and sirveParaBroncearse }
}

class SalidaDeTrekking inherits Viajes{
	var property kmSenderos = 0
	var property diasDeSol = 0
	
	override method cantDias(){ return (kmSenderos.div(50)) }
	override method esfuerzo(){ return kmSenderos > 80 }
	override method sirveParaBroncearse(){ return  ( diasDeSol > 200 or diasDeSol.between(100, 200) and kmSenderos > 120) }

	override method esInteresante(){return super() and diasDeSol >= 140}
}

class ClasesDeGimnasia inherits Viajes{
	
	// Agrego los override orque creo que el enunciado lo pide, pero directamente puedo asignar los valores cuando creo
	// una nueva clase "Clases de gimnasia".
	
	override method idiomas() = #{"Español"}
	override method esfuerzo() = true
	override method sirveParaBroncearse() = false
	override method cantDias() = 1
	
	override method esRecomendada(socio){ return socio.edad().between(20, 30) }
}




