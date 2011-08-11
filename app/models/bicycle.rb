class Bicycle < ActiveRecord::Base
  attr_accessible :avatar
  attr_accessible :serial_number
  attr_accessible :color
  attr_accessible :make
  attr_accessible :model

  belongs_to :user

  validates :serial_number, :presence => true, :length => { :maximum => 100 }
  validates :model,         :presence => true, :length => { :maximum => 100 }
  validates :make,          :presence => true, :length => { :maximum => 100 }
  validates :user_id,       :presence => true

  default_scope :order => 'bicycles.make ASC'
end
