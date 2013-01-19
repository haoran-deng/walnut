$APP_ROOT = File.dirname(File.expand_path(__FILE__))

require "#{$APP_ROOT}/config/boot.rb"

map('/posts') { run PostController } 
map('/') { run ApplicationController }
