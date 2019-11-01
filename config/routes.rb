Rails.application.routes.draw do
  resources :users, only: [ :create ] do
    collection do
      post 'sign_in'
      get 'me' # ← 追加
    end
  end
end