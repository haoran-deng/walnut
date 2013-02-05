class ApplicationController < Sinatra::Base
    use Rack::MethodOverride ##<-- Required for put delete
    
    enable :sessions
    enable :logging
    enable :static

    set :root, $APP_ROOT
    set :erb, :layout => :"layouts/application.html"

    get '/' do
        'Hello world'
    end
    #helpers do
    #    include Rack::Utils
    #    alias_method :h, :escape_html
    #end
end
