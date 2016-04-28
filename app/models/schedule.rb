class Schedule < ActiveRecord::Base

  belongs_to :user

  validates :title, presence: true
  
 


def default_values
    self.completed ||= false
    nil                           # required so that TX will not rollback!!!
  end
end