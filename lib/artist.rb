require 'pry'

class Artist
  include evironment::InstanceMethod

  attr_accessor :name
  attr_reader :songs


  def initialize
    @@artists << self
    @songs = []
  end

  def self.find_by_name(name)
    self.all.detect{|a| a.name == name}
  end

  def add_song(song)
    @songs << song
    song.artist = self
  end

  def add_songs(songs)
    songs.each { |song| add_song(song) }
  end

  def to_param
    name.downcase.gsub(' ', '-')
  end
end
