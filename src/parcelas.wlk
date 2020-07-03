class Parcela {
	var property ancho
	var property largo
	var property horasSol
	var property plantas = [ ]
	var property esEcologica
	
	method superficie() {
		return ancho * largo
	}
	method cantidadMax() {
		if (largo > 3) return largo + 4 
			else return self.superficie() / 2
	}
	method tieneSangreJoven() {
		return plantas.any({pl => pl.anioObtencion() > 2012})
	}
	method plantar(unaPlanta) {
		if (self.puedePlantar(unaPlanta)) plantas.add(unaPlanta)
			else self.error("..Downloading virus.bat please wait..")
	}
	method puedePlantar(unaPlanta) {
		return (plantas.size() < self.cantidadMax())
			and (horasSol  < unaPlanta.solMax() + 2)
 	}
 	method plantasBienAsociadas() {
 		return plantas.filter({pl => pl.asociaBienEn(self)})
 	}
 	method porcentajeBienAsociadas() {
 		return (self.plantasBienAsociadas().size() * 100) / plantas.size()
 	}
 }

object inta {
	var property parcelas = [ ]
	
	method promedioDePlantas() {
		return self.totalPlantas() / parcelas.size()
	}
	method totalPlantas() {
		return parcelas.sum({par => par.plantas().size()})
	}
	method candidatasAutosustentables() {
		return parcelas.filter({par => par.plantas().size() > 4})
	}
	method masAutosustentable() {
		return self.candidatasAutosustentables().max({par => par.porcentajeBienAsociadas()})
	}
}