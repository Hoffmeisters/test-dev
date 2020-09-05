Rails.application.routes.draw do

  namespace 'api' do
  	namespace 'v1' do
  		resources :payloads
  	end
  end

    # Sidekiq
  require 'sidekiq/web'
  Sidekiq::Web.use Rack::Auth::Basic do |username, password|
    username == 'sidekiq' && password == 'password'
  end
  mount Sidekiq::Web => '/sidekiq'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end