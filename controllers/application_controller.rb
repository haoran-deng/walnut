class ApplicationController < Sinatra::Base
    enable :sessions
    enable :logging
    enable :static

    set :root, $APP_ROOT

    get '/' do
        'Hello world'
    end
    #helpers do
    #    include Rack::Utils
    #    alias_method :h, :escape_html
    #end
end
