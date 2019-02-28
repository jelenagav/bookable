class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

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


