class Registro < ApplicationRecord
    def self.ingreso(vehiculo, fecha)
        condicional = where(vehiculo_id: vehiculo.id, fecha_salida: nil).first
        if condicional.nil?
            return create(
                {vehiculo_id: vehiculo.id, fecha_ingreso: fecha}
            )
        else
            tarifa = vehiculo.tipovehiculo.tarifa
            tipotarifa =  vehiculo.tipovehiculo.tipotarifa.descripcion
            condicional.update(fecha_salida: fecha) 
            minutos = (condicional.fecha_salida -  condicional.fecha_ingreso)/ 60
            valor = tarifa * minutos
            condicional.update(valor: valor) 
            return {valor: valor, tarifa: tarifa, tipotarifa: tipotarifa, minutos:minutos }
        end 
    end
    def self.residencial(vehiculo, fechaini, fechafin)
        buscar = where(vehiculo_id: vehiculo.id, fecha_salida: fechaini..fechafin)
        total = 0
        buscar.each do |b|
            total += b.valor
        end
        return {total: total,  data: buscar}
    end 
end
