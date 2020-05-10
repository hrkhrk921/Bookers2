class UsersController < ApplicationController
	before_action :authenticate_user!
	def show
		@book = Book.new
		@user = User.find(params[:id])
		@books = @user.books
		
	end
	def index
		@book = Book.new
		@books = Book.all
		@users = User.all
		@user = current_user
	end
	def create
		@book = Book.new(book_params)
		@book.user_id = current_user.id
		@book.save
		redirect_to @book
	end
	def edit
		@user = User.find(params[:id])
		@book = Book.find(params[:id])
		@user = current_user
	end
	def update
		@user = User.find(params[:id])
		@user.update(user_params)
		redirect_to user_path(@user.id)
	end
	private
    def book_params
    	params.require(:book).permit(:title, :body)
    end
    def user_params
  	params.require(:user).permit(:name, :profile_image, :introduction)
  end

end
