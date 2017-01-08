class Director < ApplicationRecord
  mount_uploader :photo, PhotoUploader

  # Direct associations

  has_many   :filmography,
             :class_name => "Movie",
             :dependent => :destroy

  # Indirect associations

  # Validations

  validates :name, :presence => true

end
