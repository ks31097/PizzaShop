require 'sinatra'
require 'sinatra/activerecord'
require 'sinatra/reloader'

set :database, {adapter: "sqlite3", database: "pizzashop.db"}

class Product < ActiveRecord::Base
end

class Order < ActiveRecord::Base
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
  orders_input = params[:orders]
  @client_bye = orders_input
  @items = parse_orders_input orders_input

  @items.each do |item|
    item[0] = @products.find(item[0])
  end

  erb :cart
end

def parse_orders_input orders_input
  s1 = orders_input.split(/,/)
  arr = []
  s1.each do |x|
    s2 = x.split(/=/)
    s3 = s2[0].split(/_/)

    id = s3[1]
    cnt = s2[1]

    arr2 = [id, cnt]

    arr.push arr2
  end

  return arr
end

post '/place_order' do
  @order_info = Order.new params[:order]
  if @order_info.save
      erb "<h2>Спасибо, Ваш заказ принят!</h2>"
  else
    @error = @order_info.errors.full_messages.first
    erb :cart
  end
end
