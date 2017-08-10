class BooksController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :update, :edit, :destroy]

  def index
    @books = Book.all
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)

    if @book.save
      flash.notice = 'Book successfully saved!'
      redirect_to root_path
    else
      flash.alert = 'Book was not saved, please try again.'
      render :new
    end
  end
  
  def show
    @book = Book.find(params[:id])
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to root_path
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    @book.update_attributes(book_params)
    redirect_to root_path
  end

  private
    
  def book_params
    params.require(:book).permit(:title, :author, :genre, :classification, :book_type, :year)
  end

end
