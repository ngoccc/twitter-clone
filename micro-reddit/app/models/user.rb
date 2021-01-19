class User < ApplicationRecord
	has_many :posts, dependent: :destroy
	has_many :comments, dependent: :destroy

	validates :name,
					presence: true,
					uniqueness: true,
					length: { minimum: 3,  message: "can't be shorter than 3 characters." }
	validates :age,
					numericality: { greater_than_or_equal_to: 16, message: "has to be at least 16." }
end

