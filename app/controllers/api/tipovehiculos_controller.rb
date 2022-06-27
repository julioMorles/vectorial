class Api::TipovehiculosController < ApplicationController
    def index
        tipovehiculos = Tipovehiculo.order('created_at')
        render json: {tipo_vehiculos:tipovehiculos}, status: 200
    end
    def create
        begin
            permitted = params.require(:tipovehiculo).permit(:descripcion, :tarifa, :tipotarifa_id)
            save = Tipovehiculo.create(permitted)
            render json: {estado: "ok", mensaje: "Se muestra con existo", data: save}, status: 200
        rescue => exception
            render json: {estado: "error",data: "error al guardar"}, status: 500
        end
    end 
end