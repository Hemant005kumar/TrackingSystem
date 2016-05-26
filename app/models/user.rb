class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,
         :recoverable, :rememberable, :trackable, :validatable
	has_many :projects

  include Groups::Permission

	def self.get_all_user()		
	option = {}
    User.all.each do |user|
      option[user.user_name] = user.id
    end
    option
	end

  def role_hash
    Permission.get_permissions[role_name] || {}
  end

  def role
    self.role_name
  end
	
end
