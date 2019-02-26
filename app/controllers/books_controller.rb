class BooksController < ApplicationController
before_action :find_book, only: [:show, :destroy]
skip_before_action :authenticate_user!, only: [:home, :index]

  def index
    @books = policy_scope(Book.all)
  end

  def show
    authorize @book
  end

  def new
    @user = current_user
    @book = Book.new
    authorize @book
  end

  def create
    @book = Book.new(book_params)
    @book.user = current_user
    authorize @book

    if (@book.save)
     redirect_to book_path(@book)
    else
      render :new
    end
  end

  def destroy
  end

  private

  def book_params
    params.require(:book).permit(:title, :author, :description, :publication_year, :photo)
  end

  def find_book
    @book = Book.find(params[:id])
  end
end
