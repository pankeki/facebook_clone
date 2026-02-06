class Post < ApplicationRecord
  belongs_to :user
  has_many :likes, dependent: :destroy
end
class User < ApplicationRecord
  has_many :posts
end