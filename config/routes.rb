Rails.application.routes.draw do
  resources :products
  root "products#index"

  # cart/2/add
  resource	:cart, only: [:show, :destroy] do
  	collection do
  		put :add, path: "add/:id"
  		get :checkout
  	end
  end

  resources :orders, only: [:index, :show, :create, :destroy]

end
