class Reward < ActiveRecord::Base
	belongs_to :project
	has_many :pledges

  has_many :pledges
end
