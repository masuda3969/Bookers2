class UsersController < ApplicationController
  
  before_action :correct_user, only: [:edit, :update]
  
  def show
    @user = User.find(params[:id])
    @books = @user.books
    @book = Book.new
  end
  
  def create
    @book.user_id = current_user.id
    if @book.save
    # リダイレクト先検討
     redirect_to book_path(@book.id)
     flash[:notice] = "successfully" 
    else
      render :show
    end
  end

  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
   if  @user.update(user_params)
    redirect_to user_path(@user.id)
    flash[:notice] = "successfully" 
   else
     render :edit
   end
  end
  
  def index
    @user = current_user
    @users = User.all
    @book = Book.new
  end
  
  private
  
  def user_params
   params.require(:user).permit(:name, :profile_image, :introduction)
  end
  
  def book_params
    params.require(:book).permit(:title, :body)
  end
  
  def correct_user
    # @book = Book.find(params[:id])
    @user = User.find(params[:id])
    redirect_to user_path(current_user.id) unless @user == current_user
  end


end
