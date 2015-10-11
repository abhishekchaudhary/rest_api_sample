# Consumer class
=begin
	If api service is separated from client service,
	we can use her gem to directly call api as resource.
=end
class Consumer < ActiveRecord::Base

	validates :phone, presence: true
	validates :username, presence: true
	validates :phone, uniqueness: true
	validates :username, uniqueness: true
end
