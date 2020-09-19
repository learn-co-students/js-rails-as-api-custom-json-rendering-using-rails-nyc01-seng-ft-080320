Rails.application.routes.draw do
  get '/birds' => 'birds#index'
  get '/birds/:id' => 'birds#show'
end

#=>> multiple routes can be used to differentiate between specific requests to/from API. these are called "endpoints", and are used to access specific pieces of data from the API