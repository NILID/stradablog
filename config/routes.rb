Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  scope "(:locale)", locale: /ru|en/ do
    get :about, to: 'main#about'
    get :team, to: 'main#team'
    get :exhibition, to: 'main#exhibition'
    get :top_10, to: 'main#top'
    get :interview, to: 'main#interview'
    root 'main#index'
  end
end
