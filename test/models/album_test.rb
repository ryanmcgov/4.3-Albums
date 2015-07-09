require 'test_helper'

class AlbumTest < ActiveSupport::TestCase
  test "The truth" do
    assert true
  end

  test "Conditions are valid" do
    a = Album.new(title: 'Drones', genre: 'Rock', artist: 'Muse', length: 50)
    assert a.valid?
  end

  test "Test a valid save" do
    a = Album.new(title: 'Drones', genre: 'Rock', artist: 'Muse', length: 50)
    a.save
    album = Album.find_by(title: 'Drones')
    assert album
  end

  test "Length must be greater than 1" do 
    a = Album.new(title: 'Drones', genre: 'Rock', artist: 'Muse', length: 1)
    assert_equal a.valid?, false
  end

  test "Length must be an integer" do 
    a = Album.new(title: 'Drones', genre: 'Rock', artist: 'Muse', length: -1)
    assert_equal a.valid?, false
  end

  test "Can't have dupe albums" do
    a = Album.new(title: 'Drones', genre: 'Rock', artist: 'Muse', length: 50)
    a.save
    b = Album.new(title: 'Drones', genre: 'Rock', artist: 'Muse', length: 50)
    assert_equal b.valid?, false
  end

  test "Artist can have multiple albums" do
    a = Album.new(title: 'Drones', genre: 'Rock', artist: 'Muse', length: 50)
    a.save
    b = Album.new(title: 'Resistance', genre: 'Rock', artist: 'Muse', length: 72)
    assert b.valid?, true
  end

end
