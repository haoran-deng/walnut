require "sinatra"
require "sinatra/activerecord"

Dir.glob("#{File.dirname(__FILE__)}/{helpers,models,controllers}/*.rb").each { |file| require file }

configure :development do
    set :database, "sqlite3:///db/walnut.db"
end

class Post < ActiveRecord::Base
end

helpers do
  # If @title is assigned, add it to the page's title.
  def title
    if @title
      "#{@title} -- My Blog"
    else
      "My Blog"
    end
  end

  # Format the Ruby Time object returned from a post's created_at method
  # into a string that looks like this: 06 Jan 2012
  def pretty_date(time)
   time.strftime("%d %b %Y")
  end

end 

get "/" do
  @posts = Post.order("created_at DESC")
  erb :"posts/index"
end
