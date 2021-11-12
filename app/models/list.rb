class List < ApplicationRecord
  has_many :bookmarks, dependent: :destroy
  has_many :movies, through: :bookmarks
  validates :name, presence: true, uniqueness: true
  has_one_attached :photo
  validate :image_type

  private

  def image_type
    unless photo.content_type.in?(%('image/jpeg image/png image/gif'))
      errors.add(:photo, 'needs to be a jpeg, gif or png!')
    end
  end
end
