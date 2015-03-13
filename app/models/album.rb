class Album < ActiveRecord::Base
  validates :name, :band_id, :album_type, presence: true

  belongs_to :band, dependent: :destroy
  has_many :tracks
end
