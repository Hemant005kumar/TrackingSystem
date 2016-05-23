class User < ActiveRecord::Base
	has_many :projects
	
	def self.get_all_user()		
	option = {}
    User.all.each do |user|
      option[user.user_name] = user.id
    end
    option
	end
	
end
