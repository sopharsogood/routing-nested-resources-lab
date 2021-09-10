class Song < ActiveRecord::Base
  belongs_to :artist

  def artist_name
    self.try(:artist).try(:name)
  end

  def artist_name=(name)
    artist = Artist.find_or_create_by(name: name) if !name.blank?
    self.artist = artist
  end

  def self.all_by_artist_id(artist_id)
    Song.where(artist_id: artist_id)
  end
end
