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
    new_song = self.new
    new_song.save
    return new_song
  end

  def self.new_by_name(name)
    new_song = self.new
    new_song.name = name
    return new_song
  end

  def self.create_by_name(name)
    new_song = self.create
    new_song.name = name
    return new_song
  end

  def self.find_by_name(name)
    return self.all.find{|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    if self.find_by_name(name)
      return self.find_by_name(name)
    else
      self.create_by_name(name)
    end
  end

  def self.alphabetical
    return self.all.sort_by{|song| song.name}
  end

  def self.new_from_filename(filename)
    artist_name = filename.split(" - ")[0]
    song_name = filename.split(" - ")[1].split(".")[0]
    new_song = self.new_by_name(song_name)
    new_song.artist_name = artist_name
    return new_song
  end
  
  def self.create_from_filename(filename)
    artist_name = filename.split(" - ")[0]
    song_name = filename.split(" - ")[1].split(".")[0]
    new_song = self.find_or_create_by_name(song_name)
    new_song.artist_name = artist_name
    return new_song
  end
  
  def self.destroy_all
    @@all = []
  end

end
