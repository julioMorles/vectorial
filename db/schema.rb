# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2022_06_27_000813) do
  create_table "registros", charset: "utf8mb4", force: :cascade do |t|
    t.bigint "vehiculo_id"
    t.datetime "fecha_ingreso"
    t.datetime "fecha_salida"
    t.integer "valor"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["vehiculo_id"], name: "index_registros_on_vehiculo_id"
  end

  create_table "tipotarifas", charset: "utf8mb4", force: :cascade do |t|
    t.string "descripcion"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tipovehiculos", charset: "utf8mb4", force: :cascade do |t|
    t.string "descripcion"
    t.integer "tarifa"
    t.bigint "tipotarifa_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["tipotarifa_id"], name: "index_tipovehiculos_on_tipotarifa_id"
  end

  create_table "vehiculos", charset: "utf8mb4", force: :cascade do |t|
    t.string "placa"
    t.bigint "tipovehiculo_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["tipovehiculo_id"], name: "index_vehiculos_on_tipovehiculo_id"
  end

  add_foreign_key "registros", "vehiculos"
  add_foreign_key "tipovehiculos", "tipotarifas"
  add_foreign_key "vehiculos", "tipovehiculos"
end
