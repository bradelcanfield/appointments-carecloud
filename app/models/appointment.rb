class Appointment < ActiveRecord::Base
  validates :first_name, presence: true
  validates :last_name, presence: true

  # has_many :start_time
  # has_many :end_time
  # has_many :patients

end
