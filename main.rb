require 'sinatra'
require 'sinatra/reloader'

get '/' do
  erb "Welcome to PizzaShop!"
end
