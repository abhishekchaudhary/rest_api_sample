class User < ActiveRecord::Base
	
	validates :phone, presence: true
	validates :username, presence: true
end
