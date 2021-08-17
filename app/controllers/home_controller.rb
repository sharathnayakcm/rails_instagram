class HomeController < ApplicationController
  def index
    def index
      @users = User.all
    end
  end
end
