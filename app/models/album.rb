class Album < ActiveRecord::Base
  validates :title, :genre, :artist, :length, acceptance: true
  validates :title, :genre, :artist, :length, length: { minimum: 2 }
  validates :title, uniqueness: { scope: artist }
  validates :number, numericality { only_integer: true }
end
