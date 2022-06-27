Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  namespace 'api' do
    get '/tipotarifas', to: 'tipotarifas#index'
    post '/tipotarifas', to: 'tipotarifas#create'
    get '/tipovehiculos', to: 'tipovehiculos#index'
    post '/tipovehiculos', to: 'tipovehiculos#create'
    get '/registros', to: 'registros#index'
    get '/registros/:id', to: 'registros#show'
    post '/registros', to: 'registros#create'
    post '/liquidar', to: 'registros#liquida'
    get '/vehiculos', to: 'vehiculos#index'
    post '/vehiculos', to: 'vehiculos#create'
  end
end
