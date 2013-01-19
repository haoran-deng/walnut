class PostController < ApplicationController
    helpers PostHelper
    get "/" do
        @posts = Post.order("created_at DESC")
        erb :"posts/index"
    end
end
