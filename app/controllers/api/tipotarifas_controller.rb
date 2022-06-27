class Api::TipotarifasController < ApplicationController
    def index
        tipotarifa = Tipotarifa.order('created_at')
        render json: {tipo_tarifas:tipotarifa}, status: 200
    end
    def create
        begin
            permitted = params.require(:tipotarifa).permit(:descripcion)
            save = Tipotarifa.create(permitted)
            render json: {estado: "ok", mensaje: "se registro con exito", data: save}, status: 200
        rescue => exception
            render json: {estado: "error",data: "error al guardar"}, status: 500
        end
    end 
end
