class BooksController < ApplicationController
	def new
		@book = Book.new
		@books = Book.all
		@user = current_user
	end
	#投稿データの保存
	def create
		@book = Book.new(book_params)
		@book.user_id = current_user.id
		@book.save
		redirect_to 'book/new'
	end
	def index
		@book = Book.new
		@books = Book.all
		#@user = @book.user
		@user = current_user
	end
	
	def edit
		
	end
	def show
		@book = Book.find(params[:id])
		@user = current_user
		@book = Book.new
	end
private
    def book_params
    	params.require(:book).permit(:title, :body)
    end
end
