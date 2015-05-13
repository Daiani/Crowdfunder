class Project < ActiveRecord::Base
	has_many :rewards
	accepts_nested_attributes_for :rewards 
	# :reject_if :all_blank, allow_destroy: true
end


class Reward < ActiveRecord::Base
	belongs_to :Project
end

