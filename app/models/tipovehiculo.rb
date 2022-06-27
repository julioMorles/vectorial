class Tipovehiculo < ApplicationRecord
    belongs_to :tipotarifa
    has_many :vehiculos
end
