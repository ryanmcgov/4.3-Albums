class Album < ActiveRecord::Base
  validates :title, :genre, :artist, :length, presence: true
  validates :title, :genre, :artist, :length, length: { minimum: 1 }
  validates :title, uniqueness: { scope: :artist }
  validates :length, numericality: { only_integer: true, greater_than: 1 }
end
