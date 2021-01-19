class User < ApplicationRecord
	validates :username, presence: true, uniqueness: true, length: { maximum: 21 }
	has_many :posts
	has_many :comments
end
