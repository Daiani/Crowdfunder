class Project < ActiveRecord::Base
	has_many :rewards
  has_many :pledges, through: :rewards
  belongs_to :user
	accepts_nested_attributes_for :rewards 
	# :reject_if :all_blank, allow_destroy: true
def amount_raised
amount_raised=pledges.where(project_id: id)
total_amount=amount_raised.sum(:pledge_amount)
end

def days_remaining
  current_time=Time.now
  #days_remaining=((end_date-current_time)/86400).to_i
  (end_date.to_date-current_time.to_date).to_i
end

end
