object neo {
  var energia = 100 
  
  method esElElegido() = true
  method saltar() {
    energia = energia /(2)
  }
  method vitalidad() = energia *0.1 
}

object morfeo {
  var vitalidad = 8
  var descansado = true
  
  method esElElegido() = false
  method saltar() {
    descansado = !descansado
    vitalidad = (vitalidad - 1).max(0)
  }
  method vitalidad() = vitalidad
}

object trinity {
  method esElElegido() = false
  method saltar() {}
  method vitalidad() = 0
}

object nave {
    const pasajeros = #{neo, morfeo, trinity}

    method cantidadPasajeros() = pasajeros.size()
    method pasajeroMayorVitalidad() = pasajeros.max({p => p.vitalidad()})
    method pasajeroMenorVitalidad() = pasajeros.min({p => p.vitalidad()})
    method estaEquilibrada() {
        return
            self.pasajeroMayorVitalidad()
            <
            self.pasajeroMenorVitalidad() *2
    }
    method estaElElegido() = pasajeros.any({p => p.esElElegido()})
    method chocar() {
        pasajeros.forEach({p => p.saltar()})
        pasajeros.clear()
    } 
    method acelerar() {
        pasajeros.filter({p => !p.esElElegido()}).forEach({p => p.saltar()})
    }
}