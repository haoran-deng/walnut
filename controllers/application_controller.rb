class ApplicationController < Sinatra::Base
    enable :sessions
    enable :logging
    set :views, "#{$APP_ROOT}/views"
    set :public_folder, "#{$APP_ROOT}/public"

    get '/' do
        'Hello world'
    end
    #helpers do
    #    include Rack::Utils
    #    alias_method :h, :escape_html
    #end
end
