require "sinatra"

enable :sessions
get '/' do
  erb :index
end
   
post '/toppings' do 
	session[:toppings] = params[:toppings]
	session[:meat] = params[:meat]
	session[:veg] = params[:veg]
	session[:cheese] = params[:cheese]
	session[:sauce] = params[:sauce]
	session[:crust] = params[:crust]
 redirect '/confirm'
 end

get '/confirm' do
  erb :confirm, locals: {toppings: session[:toppings], veg: session[:veg], meat: session[:meat], cheese: session[:cheese], sauce: session[:sauce], crust: session[:crust]}
end
post '/confirm' do
	session[:toppings] = params[:toppings]
	session[:meat] = params[:meat]
	session[:veg] = params[:veg]
	session[:cheese] = params[:cheese]
	session[:sauce] = params[:sauce]
	session[:crust] = params[:crust]
	redirect '/final' do 
end

  get '/final' do 
	erb :final, locals: {final: session[:confirmchoices]}
	erb :confirm, locals: {toppings: session[:toppings], veg: session[:veg], meat: session[:meat], cheese: session[:cheese], sauce: session[:sauce], crust: session[:crust]}

end
end
