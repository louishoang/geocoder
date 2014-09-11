require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/activerecord'
require 'sinatra/flash'
require 'geocoder'
require 'pry'

configure do
  set :views, 'app/views'
end

Dir['app/**/*.rb'].each do |file|
  require_relative file
  also_reload file
end

get '/' do
  redirect '/users'
end

get '/users' do
  if params[:address]
    @users = User.near(params[:address], 10)
    @users.order('distance')
  else
    @users = User.all
  end
  erb :'users/index'
end
