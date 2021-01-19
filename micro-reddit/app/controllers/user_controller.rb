class UserController < ApplicationController
	
	# GET users/
	def index
		@users = User.all 
	end

	def show
	end

	def new
		@user = User.new
	end

	def edit
	end

	def create
		@user = User.new(user_params)
		#
	end

	def update
		#
	end
	private
		def user_params
			params.require(:user).permit(:name, :city, :age)
		end
end
