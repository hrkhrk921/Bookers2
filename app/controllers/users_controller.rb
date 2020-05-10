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
		if @book.save
			flash[:notice] = "successfully"
		    redirect_to @book
		else
			flash[:notice] = "error"
			render :new
		end
	end
	def edit
		@user = User.find(params[:id])
		@user = current_user
	end
	def update
		@user = User.find(params[:id])
		if @user.update(user_params)
			flash[:notice] = "successfully"
			redirect_to user_path(@user.id)
		else
			flash[:notice] = "error"
			render :edit
		end
	end
	private
    def book_params
    	params.require(:book).permit(:title, :body)
    end
    def user_params
  	params.require(:user).permit(:name, :profile_image, :introduction)
    end

end
