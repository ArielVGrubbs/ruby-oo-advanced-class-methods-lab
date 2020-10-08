require 'pry'

class Song

  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def self.create
    song = self.new
    @@all << song
    song
  end

  def self.new_by_name (name)
    # @name = name
    song = self.new
    song.name = name
    song
  end

  def self.new_by_name_mp3 (artist_name, name)
    # @name = name
    song = self.new
    song.name = name
    song.artist_name = artist_name
    song
  end

  def self.create_by_name (name)
    # song = self.new
    # song.name = name
    # @@all << song
    song = self.create
    song.name = name
    song
  end

  def self.create_by_name_mp3 (artist_name, name)
    # song = self.new
    # song.name = name
    # @@all << song
    song = self.create
    song.name = name
    song.artist_name = artist_name
    song
  end

  def self.find_by_name (name)
    @@all.find{|person| person.name == name}
  end
  def self.find_or_create_by_name (name)
    # if self.find_by_name (name) == nil
    #   self.create_by_name (name)
    # else
    #   self.find_by_name (name)
    # end
    self.create_by_name (name)
    self.find_by_name (name)    
  end

  def self.alphabetical
    @@all.sort_by do |song_instance|
      song_instance.name
    end
  end

  def self.new_from_filename (filename_data)
    data = filename_data.split(".")
    file_type = data[1]
    song_data = data[0].split(" - ")
    Song.new_by_name_mp3(song_data[0], song_data[1])
  end

  def self.create_from_filename (filename_data)
    data = filename_data.split(".")
    file_type = data[1]
    song_data = data[0].split(" - ")
    Song.create_by_name_mp3(song_data[0], song_data[1])
  end

  def self.destroy_all
    @@all.clear
  end

  def save
    self.class.all << self
  end
  # binding.pry
end


