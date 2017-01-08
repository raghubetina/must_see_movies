class Actor < ApplicationRecord
  # Direct associations

  has_many   :roles,
             :dependent => :destroy

  # Indirect associations

  # Validations

  validates :name, :presence => true

end
