class Post < ApplicationRecord
  has_many :comments, dependent: :destroy

  validates :title, presence: true
  validates :body, presence: true, length: { minimum: 10 }

  has_one_attached :image
  after_commit :add_post_default_img, on: %i[create update]

  def add_post_default_img
    return if image.attached?

    image.attach(
      io: File.open(Rails.root.join('app', 'assets', 'images', 'default-post.jpg')),
      filename: 'default-post.jpg',
      content_type: 'image/jpg'
    )
  end
end
