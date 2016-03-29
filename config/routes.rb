Rails.application.routes.draw do
  get 'square_authorize' => 'square_rails/square_integration#authorize'
  get 'square_callback' => 'square_rails/square_integration#callback'
end
  
