import vikingos.*


class Expedicion{
	var areasInvolucradas = #{} // pueden ser aldeas o capitales
	var vikingos = #{}
	var	botin = 0
	
	method valeLaPena(){
		return areasInvolucradas.all({area => area.valeLaPena(vikingos.size()) })	// vale la pena para toda aldea y para toda ciudad
	}
	method subir(vikingo){
		vikingos.add(vikingo)
	}
	
	method invadir(){
		areasInvolucradas.forEach({area=> area.invadir(vikingos.size()) })
		self.dividirEquitativamente(self.botinTotal())
	}
	method dividirEquitativamente(botinTotal){
		vikingos.forEach({ vikingo => vikingo.recibirPaga(botinIndivual(botinTotal)) })
	}
	
	method botinTotal(){
		return areasInvolucradas.sum({ area => area.botin() })
	}
	method botinIndividual(botinTotal){
		return botinTotal / vikingos
	}

}


class Capital{
	var riqueza = 1
	var defensores = 300
	
	method botin(vikingos){	// en monedas de oro
		return self.defensoresDerrotados(vikingos) * riqueza				// ya que cada vikingo se cobrará la vida de un defensor.
	}
	
	method valeLaPena(vikingos){
		return self.botin(vikingos) >= (vikingos * 3)
	}
	method defensoresDerrotados(vikingos){
		return  vikingos.min(defensores)		// cant defensores derrotados
	}

}

class Aldea{
	var crucijidos = 100
	method valeLaPena(_){
		return self.botin() >= 15
	}
	method botin(){
		return crucijidos
	}
}
class AldeaAmurallada inherits Aldea{
	var cantMinimaVikingosEnComitiva = 0 
	
	override method valeLaPena(vikingos){
		return vikingos >= cantMinimaVikingosEnComitiva
	}

}
