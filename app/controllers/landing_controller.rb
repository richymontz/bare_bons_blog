class LandingController < ApplicationController
    def index
        @posts = Post.ascending
    end
end