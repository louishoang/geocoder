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
  distance = params[:distance] ||= 10

  if params[:address]
    @users = User.near(params[:address], distance)
    @users.order('distance')

    if @users.class != NilClass
      @map_center = @users.first.latitude.to_s + ',' + @users.first.longitude.to_s
    else
      @map_center = %Q{-34.397, 150.644}
    end
  else
    @users = User.all
    @map_center = %Q{-34.397, 150.644}
  end
  erb :'users/index'
end
