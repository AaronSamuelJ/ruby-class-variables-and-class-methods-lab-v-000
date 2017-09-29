require 'pry'
class Song
  attr_accessor :name, :artist, :genre
  @@count = 0
  @@artists, @@genres = [], []

  def initialize(name, artist, genre)
    @name = name
    @artist = artist
    @genre = genre
    @@genres << genre
    @@count +=1
    @@artists << artist
  end
  def self.count
    @@count
  end
  def self.artists
    @@artists.uniq
  end
  def self.genres
    @@genres.uniq
  end
  def self.genre_count
    pop_count, rap_count = 0, 0

    @@genres.each do |genre|
      case genre
      when "pop"
        pop_count += 1
      when "rap"
        rap_count += 1
      end
    end
    {"pop" => pop_count, "rap" => rap_count}
  end
  def self.artist_count
    hash = {}
    i = 0
    @@artists.each do |artist|
      hash["#{artist}"] ||= [i + 1]
      i += 1
    end
    hash
  end
end
