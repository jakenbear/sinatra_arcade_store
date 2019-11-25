require 'sinatra/base'
require './store.rb'
require './location.rb'
require './product.rb'
require 'yaml/store'

module Storeapp
  class Web < Sinatra::Base

    #LOADING FUNCTIONS - BEGIN
    def load_stores()
      s = []
      YAML.load_file('store.yaml').each do |entry|
        s.push entry
      end
      return s
    end

    def load_products()
      p = []
      YAML.load_file('product.yaml').each do |entry|
        p.push entry
      end
      return p
    end

    def load_locations()
      l = []
      YAML.load_file('location.yaml').each do |entry|
        l.push entry
      end
      return l
    end
    #LOADING FUNCTIONS - END

    #STORE APP CODE - HOME
    get '/' do
      @title = 'Jakes Arcade Store Homepage!'
      erb :index
    end

    #STORE DISPLAY
    get '/stores' do
      stores = load_stores()
      locations = load_locations()
      products = load_products()
      @title = 'STORE INFO'
      @store = stores
      erb :stores
    end

    #PRODUCTS DISPLAY
    get '/products' do
      products = load_products()
      @title = 'PRODUCTS'
      @products = products
      erb :products
    end

    #LOCATIONS DISPLAY
    get '/locations' do
      locations = load_locations()
      @title = 'LOCATIONS'
      @locations = locations
      erb :locations
    end



  end
end
