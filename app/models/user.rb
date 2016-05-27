class User < ActiveRecord::Base
  include Groups::Permission

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :projects

  scope :admin, -> { all }
  scope :analyst, -> { where(role_name: ['analyst', 'sales'])}
  scope :sales, -> { where(role_name: 'sales')}


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
