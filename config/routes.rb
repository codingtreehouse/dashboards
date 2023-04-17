Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

get("/forex", {:controller => "forex", :action => "first_currency"})

get("/forex/:currency",{:controller => "forex", :action => "second_currency"})

get("/forex/:start_currency/:end_currency", {:controller => "forex", :action => "convert"})

end
