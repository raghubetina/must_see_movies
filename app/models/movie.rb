class Movie < ApplicationRecord
  mount_uploader :cover, CoverUploader

  # Direct associations

  has_many   :bookmarks,
             :dependent => :destroy

  has_many   :roles,
             :dependent => :destroy

  belongs_to :director

  # Indirect associations

  has_many   :users,
             :through => :bookmarks,
             :source => :user

  has_many   :cast,
             :through => :roles,
             :source => :actor

  # Validations

  validates :title, :presence => true

end
