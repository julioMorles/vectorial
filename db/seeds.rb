Tipovehiculo.delete_all
Tipotarifa.delete_all

p 'Creando los tipos de tarifa'
tipoNormal = Tipotarifa.create( {descripcion: "Normal"})
tipoMensual = Tipotarifa.create( {descripcion: "Mensual"})

p 'Creando los tipos de vehiculos'
Tipovehiculo.create([
    {descripcion: "Residencial", tarifa: 100,  tipotarifa_id: tipoMensual.id},
    {descripcion: "Visitante", tarifa: 200,  tipotarifa_id: tipoNormal.id}
])

# p Tipotarifa.first.tipovehiculos