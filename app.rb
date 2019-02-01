require 'sinatra/base'
require './lib/peep'
require './lib/user'
require_relative 'database_helper'

database_setup

class Chitter < Sinatra::Base

  get '/' do
    @peeps = Peep.all
    erb(:index)
  end

  post '/peep' do
    Peep.create(message: params[:message])
    redirect('/')
  end

  get '/signup' do
    erb(:signup)
  end

  post '/credentials' do
    user = User.create(username: params[:username], password: params[:password])
    redirect("/homepage/#{user.id}")
  end

  get '/homepage/:id' do
    @peeps = Peep.all
    @user = User.get(params[:id])
    erb(:homepage)
  end
end
