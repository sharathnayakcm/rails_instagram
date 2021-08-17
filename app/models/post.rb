class Post < ApplicationRecord
  belongs_to :user

  has_one_attached :image

  has_many :likes, dependent: :destroy

  has_many :comments, dependent: :destroy

  #validates :image, attached: true, content_type: ['image/png', 'image/jpg', 'image/jpeg']

  validates :image, presence: true

  validate :image_content_type

  # Like methods
  def has_liked?(user_id)
    self.likes.where(user_id:user_id).count.positive?
  end



  def likes_count
    self.likes.count
  end

# Comments methods
  def post_comments
    self.comments.order(created_at: :desc)
  end

  def comments_count
    self.comments.count
  end

  private

  def image_content_type
    if image.present?
      if !image.content_type.in?(%('image/jpeg image/png'))
          errors.add(:image, "needs to be a jpeg or png!")
      end
    end
  end

end
