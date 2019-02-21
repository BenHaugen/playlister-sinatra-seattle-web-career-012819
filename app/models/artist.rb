class Artist < ActiveRecord::Base
has_many :songs
has_many :genres, through: :songs

  def slug
    artist_name = self.name.gsub(/[!@?.$*]/, "")
    artist_name.gsub(/[" "]/, "-").downcase
  end

  def self.find_by_slug(slug_input)
    self.all.find do |artist|
      artist.slug == slug_input
    end
  end
end
