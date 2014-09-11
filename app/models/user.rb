
class User < ActiveRecord::Base
  extend ::Geocoder::Model::ActiveRecord

  validates :name, presence: true
  validates :role, inclusion: { in: %w(employer seeker) }
  validates :address, presence: true

  geocoded_by :address
  after_validation :geocode, if: :address_changed?
end
