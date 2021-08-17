class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  def get_all_recent_posts(size)
    Post.all.order(created_at: :desc).limit(size)
  end


end
