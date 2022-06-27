class Tipotarifa < ApplicationRecord
    has_many :tipovehiculos
    validates :descripcion, presence: true
end