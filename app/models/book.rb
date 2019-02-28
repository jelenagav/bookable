class Book < ApplicationRecord
  belongs_to :user
  has_many :bookings
  mount_uploader :photo, PhotoUploader

  include PgSearch
  pg_search_scope :search_by_title_and_author,
    against: [:title, :author],
    using: {
      tsearch: { prefix: true } # <-- now `superman batm` will return something!
      }
end
