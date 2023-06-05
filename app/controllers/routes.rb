require './app/models/url'
require './app/services/call.rb'
require 'json'

class UrlShortnerService < Sinatra::Base
    get '/' do
        erb :index
    end

    get '/:short_url' do
        url = Call.service(:url_resolver).new(short_url: params[:short_url]).find_url
        return 404 unless url

        redirect url, 301
    end

    post '/' do
        @link = Call.service(:url_generator).new(original_url: params[:url]).shorten!
        erb :index
    end

    get '/details/:short_url' do
        url = Call.service(:url_resolver).new(short_url: params[:short_url]).url_details
        return 404 unless url

        json url.details_json
    end

    not_found do
        status 404
        erb :not_found
    end
end
