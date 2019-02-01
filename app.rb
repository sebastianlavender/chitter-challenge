require 'sinatra/base'
require './lib/peep'
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
    redirect('/')
  end
end
