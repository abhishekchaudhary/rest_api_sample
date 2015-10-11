# Consumer controller
class ConsumersController < ApplicationController
  # GET /consumers
  def index
    @consumers = Consumer.all
  end

  # GET Add consumers from api
  def add
  	uri = "#{APP_CONFIG[:API_BASE_URL]}/users.json"
  	response = RestClient.get uri
  	users = JSON.parse(response, symbolize_names: true)
  	begin
		users.each do |user|
			Consumer.create(username:user[:username], phone: user[:phone])
		end
		redirect_to consumers_url, status: :ok, notice: 'Consumers are successfully added from api.'
  	rescue Exception => e
  		redirect_to consumers_url, status: :unprocessable_entity, notice: "#{e.message}"
  	end
  end

  # DELETE /consumers/1
  def destroy
    @consumer = Consumer.find(params[:id])
      if @consumer.destroy
      	redirect_to consumers_url, notice: 'Consumer was successfully destroyed.' 
      end
  end
end
