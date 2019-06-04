import TiposDeViajes.*

class Socios {
	
	var property actividades = #{}
	var property maxActividades = 0
	var property edad = 0
	var property idiomasQueHabla = #{}
	var property leAtrae = true
	
	method actividad(tipo){ if ( actividades.size() == maxActividades){ self.mensaje() }else{ actividades.add(tipo) } }
	method mensaje(){ return "Error, Llego al maximo de actividades permitidas"}
	method esAdoradorDelSol(){ return actividades.all({ a => a.sirveParaBroncearse()}) }
	method actividadesEsforzadas(){ return actividades.filter({ a=>a.esfuerzo()}) }
	method idiomaQueHabla(tipo){ idiomasQueHabla.add(tipo)}
	
	method saberCantidad(){return actividades.size()}
	
	method leAtrae(tipo){return leAtrae}
	
}

class SocioTranquilo inherits Socios{
	
	override method leAtrae(tipo){ return tipo.cantDias() >= 4 }
}

class SocioCoherente inherits Socios{
	
	override method leAtrae(tipo){ return if (self.esAdoradorDelSol()){ tipo.sirveParaBroncearse() }else{ tipo.esfuerzo()} }
}

class SocioRelajado inherits Socios{
	
	override method leAtrae(tipo){ return idiomasQueHabla.any({ i => tipo.idiomas().contains(i) }) }
}