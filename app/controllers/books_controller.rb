class BooksController < ApplicationController
  before_action :correct_user, only: [:edit, :update]

  def new
    @book = Book.new
    @user = current_user
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      flash[:notice] = "You have cerated book successfully."
      redirect_to book_path(@book.id)
    else
      @user = current_user
      @books = Book.all
      render "index"
    end
  end

  def index
    @books = Book.all
    @book = Book.new
    @user = current_user
  end

  def edit
    @book = Book.find(params[:id])
    if @user = current_user
      render "edit"
    else
      redirect_to book_path
    end
  end

  def update
    @book = Book.find(params[:id])
    @book.user_id = current_user.id
    if @book.update(book_params)
      flash[:notice] = "Book was successfully updated."
      redirect_to book_path(@book.id)
    else
      @user = current_user
      render "edit"
    end
  end

  def show
    @book = Book.find(params[:id])
    @user = @book.user
    @book_comment = BookComment.new
  end

  def destroy
    @book = Book.find(params[:id])
    if @book.destroy
      flash[:notice] = "Book was successfully destroyed."
      redirect_to '/books'
    end
  end

  private

  def book_params
    params.require(:book).permit(:title, :body)
  end

  def correct_user
    @book = Book.find(params[:id])
    @user = @book.user
    redirect_to(books_path) unless @user == current_user
  end

end
