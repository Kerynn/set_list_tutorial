class Artist < ApplicationRecord
  has_many :songs

  def average_song_length
    self.songs.average(:length).round(2)
  end
  
  def song_count 
    self.songs.length 
  end 
end 