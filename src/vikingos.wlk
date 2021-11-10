/** First Wollok example */
const odin = new Granjero(armas = 2,claseSocial = jarl,  hijos = 2 , hectareas = 10)
const invasionATroya = new Expedicion(areasInvolucradas = {})

/*
1) vikingo.subir(expedicion) -> [accion]
2) expedicion.valeLaPena(vikingo) -> BOOL
3)


 */
class Vikingo{		// pueden ser granjeros o soldados. Clase abstracta
	var claseSocial = jarl
	var armas = 0
	
	method puedeIr(expedicion){
		return self.esProductivo() && self.puedeViajar(armas)
	}
	method esProductivo(){	return true}
	method tieneArmas(){
		if (armas > 0){
			return true
		}else {
			throw new DomainException(message = "no tiene armas")
		}
	}
	method puedeViajar(_){return claseSocial.puedeViajar(armas)}
	method subir(invasion){
		if (self.puedeIr(invasion)){
			invasion.subir(self)
		}
	}
	
	method escalarSocialmente(){
		claseTipo.escalar()
	}
}

object jarl{	// esclavo
	method puedeViajar(armas){
		if (armas == 0){
			return true
		}else{
			throw new DomainException(message = "no puede viajar porq es un jarl y tiene armas")
		}
	}
}
object karl {	// casta media 
	method puedeViajar(_){return true}
	
	method escalar()
} 

object thrall{	// nobles
	method puedeViajar(_){return true}
	
} 

class Soldado inherits Vikingo{
	var vidasCobradas = 0
	override method esProductivo(){
		if (vidasCobradas > 20  && self.tieneArmas()){
			return true
		}else{
			throw new DomainException(message = "no puede viajar porq no es productivos")
			
		}
	}
	
}

class Granjero inherits Vikingo{
	var hijos = 0
	var hectareas = 0
	
	override method esProductivo(){
		if (hectareas >= (2 * hijos)){
			return true
		}else{
			throw new DomainException(message = "no puede viajar porq no es productivos")	
		}
	}

}



