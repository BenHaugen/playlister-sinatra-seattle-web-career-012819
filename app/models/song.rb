class Song < ActiveRecord::Base

belongs_to :artist
has_many :song_genres
has_many :genres, through: :song_genres


  def slug
    song_name = self.name.gsub(/[!@?.$*]/, "")
    song_name.gsub(/[" "]/, "-").downcase
  end

  def self.find_by_slug(slug_input)
    self.all.find do |song|
      song.slug == slug_input
    end
  end
end
