require 'sinatra'
require 'sinatra/activerecord'
require 'sinatra/reloader'

set :database, {adapter: "sqlite3", database: "pizzashop.db"}

class Product < ActiveRecord::Base
end

before do
  @products = Product.all
end

get '/' do
  erb :index
end

get '/about' do
  @title = "About Us"
  erb :about
end

post '/cart' do
  erb "Hello!"
end
