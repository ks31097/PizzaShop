require 'sinatra'
require 'sinatra/reloader'

get '/' do
  erb :index
end

get '/about' do
  @title = "About Us"
  erb :about
end
