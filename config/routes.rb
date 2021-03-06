Rails.application.routes.draw do
  post 'user/create' => 'api#createUser'
  post 'user/login' => 'api#login'
  get 'user/sign_out' => 'api#sign_out'
  post 'contact/create' => 'contact#CreateUsecontacts'
  get 'contact/findContacts' => 'contact#findContacts'
  post 'contact/deleteContacts' => 'contact#deleteContacts'
  post 'contact/updateContacts' => 'contact#updateContacts'
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
