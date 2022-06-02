class BooksController < ApplicationController
  before_action :correct_user, only: [:edit, :update]
  def new
   @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
  if@book.save
    flash[:notice] = 'You have created book successfully.'
    redirect_to book_path(@book.id)
  else
    @books=Book.all
    @user= current_user
    render:index
  end
  end

  def index
    @book =Book.new
    @books=Book.all
    @user= current_user
  end

  def show
    @book = Book.find(params[:id])
    @book_comment = BookComment.new
    @user= @book.user
  end

  def edit
  @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
  if @book.update(book_params)
    flash[:notice] = 'You have updated book successfully.'
    redirect_to book_path(@book)
  else
    render :edit
  end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end

  def get_image
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    image
  end

  private

  def book_params
    params.require(:book).permit(:title, :body, )
  end
end

  def correct_user
    @book = Book.find(params[:id])
    @user = @book.user
    if @user != current_user
      redirect_to books_path
    end
  end