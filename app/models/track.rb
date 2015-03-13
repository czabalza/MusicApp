class Track < ActiveRecord::Base
  validates :name, :album_id, :track_type, :lyrics, presence: true

  belongs_to :album, dependent: :destroy
end
