class Api::VehiculosController < ApplicationController
    def index
        vehiculos = Vehiculo.order('created_at')
        render json: {vehiculos:vehiculos}, status: 200
    end
    def create
        begin
            permitted = params.require(:vehiculo).permit(:placa, :tipovehiculo_id)
            save = Vehiculo.create(permitted)
            render json: {estado: "ok", mensaje: "Se muestra con existo", data: save}, status: 200
        rescue => exception
            render json: {estado: "error",data: "error al guardar"}, status: 500
        end
    end 
end