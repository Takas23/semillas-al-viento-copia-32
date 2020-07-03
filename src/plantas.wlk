import parcelas.*

class Planta {
	var property anioObtencion
	var property altura
		
	method esFuerte() {
		return self.solMax() > 9
	}
	method solMax() {
		return 7
	}
	method daSemilla() {
		return self.esFuerte()
	}
	method espacio()
	method esIdeal(unaParcela)
	method asociaBienEn(unaParcela) {
		if (unaParcela.esEcologica()) 
			return unaParcela.tieneSangreJoven() and self.esIdeal(unaParcela)
		else return unaParcela.plantas().size() <= 2 and self.esFuerte()
	} 
/* enunciado:"que haya como máximo 2 plantas" 
		yo entendi que haya como maximo 2 plantas plantadas.
		* si era "que la cantidad max de plantas sea 2 iria: 
		* unaParcela.cantidadMax() <= 2 and self.esFuerte()
*/
}

class Menta inherits Planta {
	override method daSemilla() {
		return super() or self.altura() > 0.4
	}
	override method espacio() {
		return self.altura() + 1
	}
	override method esIdeal(unaParcela) {
		return unaParcela.superficie() > 6
	}
}

class Peperina inherits Menta {
	override method espacio() {
		return super() * 2
	}
}

class Soja inherits Planta {
	override method solMax() {
		if (self.altura() < 0.3) return 6
			else if (self.altura().between(0.3, 0.8)) return 7
				else return 12
	}
	override method daSemilla() {
		return super() or 
			((self.anioObtencion() > 2007) and (self.altura().between(0.75, 0.9)))
	}
	override method espacio() {
		return self.altura() / 2
	}
	override method esIdeal(unaParcela) {
		return unaParcela.horasSol() == self.solMax()
	}
}

class SojaTrans inherits Soja {
	override method daSemilla() {
		return false
	}
	override method esIdeal(unaParcela) {
		return unaParcela.cantidadMax() == 1
	}
}


class Quinoa inherits Planta {
	var property espacio 
	
 	override method solMax() {
		if (self.espacio() < 0.3) return 10
			else return super()
	}
	override method daSemilla() {
		return super() or self.anioObtencion() < 2005
	}
	override method esIdeal(unaParcela) {
		return unaParcela.plantas().all({pl => pl.altura() <= 1.5})
	}
	
}