# Configure your routes here
# See: http://www.rubydoc.info/gems/lotus-router/#Usage

get '/', to: 'home#index', as: :home
resources :books
