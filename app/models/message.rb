class Message < ActiveRecord::Base
  validates :body, presence: true 

  attr_accessible :body
end
