class Like < ApplicationRecord
  belongs_to :post
  belongs_to :user

  validates :user_id, uniqueness: {scope: :post_id}

  def self.user_liked_posts(user_id)
    where(user_id:user_id).select(:post_id)
  end
end
