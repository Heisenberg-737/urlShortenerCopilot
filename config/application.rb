require 'rake'
require 'sinatra'
require 'sinatra/activerecord'
require 'sinatra/contrib'

class UrlShortnerService < Sinatra::Base

    #Registering Active Record
    register Sinatra::ActiveRecordExtension
    register Sinatra::Contrib

    enable :logging
end