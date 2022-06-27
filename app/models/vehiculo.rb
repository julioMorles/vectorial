class Vehiculo < ApplicationRecord
    belongs_to :tipovehiculo
    def self.buscarplaca(placa)
        vehiculo = Vehiculo.where(placa: placa).first
        if vehiculo.nil?
            tipo = Tipovehiculo.where(descripcion: "Visitante").first
            vehiculo = Vehiculo.create({placa:placa , tipovehiculo_id: tipo.id })
        end
        return vehiculo
    end
end
