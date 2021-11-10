/** First Wollok example */
import expediciones.*

const odin = new Granjero(armas = 2,claseSocial = jarl,  hijos = 2 , hectareas = 10)
const invasionATroya = new Expedicion(areasInvolucradas = {})

/*
1) vikingo.subir(expedicion) -> [accion]
2) expedicion.valeLaPena(vikingo) -> BOOL
3)


 */
class Vikingo{		// pueden ser granjeros o soldados. Clase abstracta
	var property claseSocial = jarl
	var property oro
	
	method puedeIr(expedicion) =
		self.esProductivo() && self.puedeViajar(armas)		

	method esProductivo(){	return true}

	method puedeViajar(_){return claseSocial.puedeViajar(armas)}
	
	method subir(invasion){
		if (self.puedeIr(invasion)){
			invasion.subir(self)
		}else{
			throw noPuedeSubirAExpedicion
			
		}
	}
	
	method escalarSocialmente(){
		claseTipo.escalar()
	}
	method recibirPaga(paga){
		oro =+ paga
	}
}


object jarl{	// esclavo
	method puedeViajar(armas) = armas == 0
	
}
object karl {	// casta media 
	method puedeViajar(_){return true}
	
	method escalar()
} 

object thrall{	// nobles
	method puedeViajar(_){return true}
	
} 

class Soldado inherits Vikingo{
	var property armas
	var property vidasCobradas 
	override method esProductivo(){
		if (vidasCobradas > 20  && self.tieneArmas()){
			return true
		}else{
			throw new DomainException(message = "no puede viajar porq no es productivos")
			
		}
	}
	method tieneArmas(){
		if (armas > 0){
			return true
		}else {
			throw new DomainException(message = "no tiene armas")
		}
	}
	
}

class Granjero inherits Vikingo{
	var property hijos 
	var property hectareas 
	
	override method esProductivo(){
		if (hectareas >= 2 * hijos){
			return true
		}else{
			throw new DomainException(message = "no puede viajar porq no es productivos")	
		}
	}

}

object noPuedeSubirAExpedicion inherits Exception{}

