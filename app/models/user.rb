class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :image
  has_many :post_comments, dependent: :destroy
  has_many :post_image, dependent: :destroy
  has_many :shooes, dependent: :destroy

  def get_image(width, height)
   unless image.attached?
    file_path = Rails.root.join('app/assets/images/nothing.jpg')
    image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
   end
   image.variant(resize_to_limit: [width, height]).processed
  end


  validates :name, uniqueness: true, length: {maximum:20, minimum: 2}
end
