Rails.application.routes.draw do

  scope module: 'api' do
    namespace :v1 do
      resources :jobs
      resources :companies do
        resources :jobs
      end
    end
  end

  scope module: 'api' do
    namespace :v1 do
      resources :applies
      resources :geeks do
        resources :applies
      end
    end
  end

  scope module: 'api' do
    namespace :v1 do
      resources :applies
      resources :jobs do
        resources :applies
      end
    end
  end


  match "*path", to: "application#catch_404", via: :all
end
