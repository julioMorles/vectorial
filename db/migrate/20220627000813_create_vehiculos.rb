class CreateVehiculos < ActiveRecord::Migration[7.0]
  def change
    create_table :tipotarifas do |t|
      t.string :descripcion 
      t.timestamps
    end
    create_table :tipovehiculos do |t|
      t.string :descripcion 
      t.integer :tarifa
      t.references :tipotarifa, null: true, foreign_key: true
      t.timestamps
    end
    create_table :vehiculos do |t|
      t.string :placa
      t.references :tipovehiculo, null: true, foreign_key: true
      t.timestamps
    end
    create_table :registros do |t|
      t.references :vehiculo, null: true, foreign_key: true
      t.datetime :fecha_ingreso
      t.datetime :fecha_salida
      t.integer :valor
      t.timestamps
    end
    
  end
end
