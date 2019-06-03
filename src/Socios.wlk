import TiposDeViajes.*

class Socios {
	
	var property actividades = #{}
	var property cantActividades = 0
	var property edad = 0
	var property idiomasQueHabla = #{}
	var property leAtrae = true
	
	method actividad(tipo){ if ( actividades.size() == cantActividades){ "Error, Llego al maximo de actividades permitidas" }else{ actividades.add(tipo) } }
	method esAdoradorDelSol(){ return actividades.all({ a => a.sirvaParaBroncearse()}) }
	method actividadesEsforsadas(){ return actividades.AsSet({ a => a.esfuerzo()}) }
	
	method leAtrae(tipo){return leAtrae}
	
}

class SocioTranquilo inherits Socios{
	
	override method leAtrae(tipo){ return tipo.cantDias() >= 4 }
}

class SocioCoherente inherits Socios{
	
	override method leAtrae(tipo){ return if (self.esAdoradorDelSol()){ tipo.sirveParaBroncearse() }else{ tipo.esfuerzo()} }
}

class SocioRelajado inherits Socios{
	
	override method leAtrae(tipo){ return idiomasQueHabla.any({ i => tipo.idiomas().conteins(i) }) }
}