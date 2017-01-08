class Movie < ApplicationRecord
  # Direct associations

  belongs_to :director

  # Indirect associations

  # Validations

  validates :title, :presence => true

end
