class User < ActiveRecord::Base
  authenticates_with_sorcery!
  validates :password, length: {minimum: 3}
  validates :password, confirmation: true
  validates :password_confirmation, presence: true
  validates :email, uniqueness: true

  has_many :owned_projects, class_name: 'Project'
  has_many :pledges
  has_many :rewards, through: :pledges
  has_many :backed_projects, class_name: 'Project', through: :pledges, source: :project
  mount_uploader :avatar, AvatarUploader


  def total_amount_pledged
    pledges.sum(:pledge_amount)
  end
end
