import parcelas.*

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
