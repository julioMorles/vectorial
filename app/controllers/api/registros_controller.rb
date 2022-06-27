class Api::RegistrosController < ApplicationController
    def index
        registros = Registro.order('created_at DESC')
        render json: {registros: registros}, status: 200
    end
    def show
        begin
            registro = Registro.find(params[:id])
            render json: {data: registro}, status: 200
        rescue => exception
            render json: {data: "No se encuentra"}, status: 200
        end 
    end
    def create
        begin
            permitted = params.require(:registro).permit(:placa, :fecha)
            vehiculo = Vehiculo.buscarplaca(permitted[:placa])
            save = Registro.ingreso(vehiculo, permitted[:fecha])
            render json: {estado: "ok", mensaje: "se registro con exito", data: save}, status: 200
        rescue => exception
            render json: {data: "error al guardar"}, status: 500
        end
    end 
    def liquida
        begin
            permitted = params.require(:registro).permit(:placa, :fechaini, :fechafin)
            vehiculo = Vehiculo.buscarplaca(permitted[:placa])
            tipotarifa =  vehiculo.tipovehiculo.tipotarifa.descripcion
            if tipotarifa == "Mensual"
                save = Registro.residencial(vehiculo, permitted[:fechaini], permitted[:fechafin])
                render json: {estado: "ok", mensaje: "se muestra con exito", detalle: save}, status: 200
            else 
                render json: {estado: "ok", mensaje: "solo para residenciales"}, status: 200
            end
        rescue => exception
            render json: {estado: "error",data: "error al guardar"}, status: 500
        end
    end
end