class User < ApplicationRecord
  mount_uploader :photo, PhotoUploader
  has_many :books
  has_many :bookings
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # has_many :booked_books, through: :bookings, foreign_key: "book_id", class_name: "Book"


  def booked_books
    Book.joins(:bookings).where(user: self).where('bookings.status = ?', "pending")
  end

  def bookings_of_owned_books
    Booking.where(book: self.books)
  end
end


