require 'pry'
require_relative '../config/environment.rb'
class Artist 
  extend Concerns::Findable 

  attr_accessor :name, :songs, :genres

  @@all = []

  def initialize(name)
    @name = name 
    @songs = []
    @@all << self 
  end 

  def songs 
    @songs 
  end 

  def self.all 
    @@all
  end 

  def self.destroy_all #empties @@all array
    @@all.clear 
  end 

  def save 
    @@all << self 
    @@all.uniq!
  end 

  def self.create(name) #instantiates an instance using .new but also invokes #save on instance. Forces to persist.
    artist = Artist.new(name)
    artist.save 
    artist  
  end 

  def add_song(song)

      song.artist = self  unless song.artist 
    songs << song unless songs.include?(song)


  end 

  def genres 
    artist_songs = songs.collect {|song| song.genre}.uniq 
  artist_songs 
  end 

end  