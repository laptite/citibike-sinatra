require 'rubygems'
require 'bundler'
require 'debugger'

Bundler.require

Dir.glob('./lib/*.rb') do |model|
  require model
end

module Citibike
	class App < Sinatra::Application
    before do
      json = File.open("data/citibikenyc.json").read
      @data = MultiJson.load(json)
    end

    get '/' do
      erb :home
    end

    get '/form' do
      erb :form
    end

    post '/form' do
      @start = params["start"].split(",")
      @end = params["end"].split(",")
      erb :form
    end

    post '/map' do
      @start = params["start"].split(",")
      @end = params["end"].split(",")
      erb :map
    end

  end
end

# "#{params.inspect}"