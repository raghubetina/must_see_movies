class Movie < ApplicationRecord
  # Direct associations

  has_many   :roles,
             :dependent => :destroy

  belongs_to :director

  # Indirect associations

  # Validations

  validates :title, :presence => true

end
