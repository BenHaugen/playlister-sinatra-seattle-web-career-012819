class Artist
has_many :songs
has_many :song_genres, through: :songs

end
