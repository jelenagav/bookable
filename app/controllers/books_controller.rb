class BooksController < ApplicationController
before_action :find_book, only: [:show, :destroy]

  def index
    @books = Book.all
  end

  def show
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)

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
    params.require(:book).permit(:title, :author, :description, :publication_date)
  end

  def find_book
    @book = Book.find(params[:id])
  end
end
