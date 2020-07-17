require 'pry'

## REWORK

# 1. Build a class constructor Song.create that:
#    -Initializes a song and saves it @@all
#    -Returns the new song that was created
# 2. Build a class constructor Song.new_by_name that:
#    -Takes in the name of a song
#    -Returns a song instance with that name as its property
# 3. Build a class constructor Song.create_by_name that:
#    -Takes in the name of a song
#    -Returns a song instance with that name as its property
#    -Saves the song to @@all
# 4. Build a class finder Song.find_by_name that:
#    -Takes in the name of a song
#    -Finds and returns a song instance with that name
# 5. Build a class method Song.find_or_create_by_name that:
#    -Takes in the name of a song
#       -Either return a matching song instance with that name
#         -Or create a new song with that name and return
# 6. Build a class method Song.alphabetical that:
#    -Returns all songs in ascending order using #sort_by
# 7. Build a class constructor Song.new_from_filename that:
#    -Accepts a filename in the format of " -.mp3"
#    -The constructor should return a new Song instance and
#     parse the song name and artist
# 8. Build a class constructor Song.create_from_filename that:
#    -Same functionality as Song.new_from_filename but also
#     saves the Song instance that was created
# 9. Build a class method Song.destroy_all that resets @all
#    to an empty array.

class Song

  attr_accessor :name, :artist_name

  @@all = []
 
  def self.all
    @@all
  end
 
  def save
    self.class.all << self
  end

  def self.create
    song = self.new
    song.save
    song 
  end 

  def self.new_by_name(name)
    song = self.new 
    song.name = name
    song 
  end 

  def self.create_by_name(name)
    song = self.new
    song.name = name
    song.save
    song 
  end 

  def self.find_by_name(name)
    self.all.detect {|song| song.name == name}
  end 

  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create_by_name(name)
  end 

  def self.alphabetical
    self.all.sort_by {|song| song.name}
  end 

  def self.new_from_filename(filename)
    data = filename.split(" - ")
    artist_name = data[0]
    song_name = data[1].chomp(".mp3")

    song = self.new
    song.name = song_name
    song.artist_name = artist_name
    song
  end 

  def self.create_from_filename(filename)
    data = filename.split(" - ")
    artist_name = data[0]
    song_name = data[1].chomp(".mp3")

    song = self.new
    song.name = song_name
    song.artist_name = artist_name
    song.save
  end 

  def self.destroy_all 
    self.all.clear
  end 
 
end