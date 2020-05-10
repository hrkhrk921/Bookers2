class BooksController < ApplicationController
	before_action :authenticate_user!
	def new
		@book = Book.new
		@books = Book.all
		@user = current_user
	end
	
	def index
		@book = Book.new
		@books = Book.all
		#@user = @book.user
		@user = current_user
	end
	def show
		@book = Book.new
		@user = User.find(params[:id])
		@books = @user.books
	end
	#投稿データの保存
	def create
		@book = Book.new(book_params)
		@book.user_id = current_user.id
		@book.save
		redirect_to @book
	end
	def update
		book = Book.find(params[:id])
		book.update(book_params)
		redirect_to book_path(book)
	end
	def edit
		@user = User.find(params[:id])
		@book = Book.find(params[:id])
	end
	def destroy
		
	end
private
    def book_params
    	params.require(:book).permit(:title, :body)
    end
    def user_params
  	params.require(:user).permit(:name, :profile_image, :introduction)
  end
end
