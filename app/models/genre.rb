class Genre < ActiveRecord::Base

has_many :song_genres
has_many :songs, through: :song_genres
has_many :artists, through: :songs

  def slug
    genre_name = self.name.gsub(/[!@?.$*]/, "")
    genre_name.gsub(/[" "]/, "-").downcase
  end

  def self.find_by_slug(slug_input)
    self.all.find do |genre|
      genre.slug == slug_input
    end
  end
end
