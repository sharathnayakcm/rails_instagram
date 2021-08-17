class Like < ApplicationRecord
  belongs_to :post
  belongs_to :user

  # creating association to fetch all post which user liked
  belongs_to :liked_posts, class_name: 'Post' ,foreign_key: 'post_id'

  validates :user_id, uniqueness: {scope: :post_id}

  def self.user_liked_posts(user_id)
    where(user_id:user_id).select(:post_id)
  end
end
