Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'images/:username' => 'show_image#show'
  wash_out :wsimages
  post 'chat' =>'wschats#chat'
end
