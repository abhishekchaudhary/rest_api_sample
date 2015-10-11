=begin
Currently using application controller, if there will be several crud 
controllers we can use a base controller to reuse common crud **/
=end
#  Users controller for api version 1
class Api::V1::UsersController < ApplicationController

  # GET /users
  def index
    users = User.all
    render json: users
  end

  # GET /users/1
  def show
    user = User.find(params[:id])
    render json: user
  end

  # POST /users
  def create
    user = User.new(user_params)
    if user.save
      render json: user, status: :created
    else
      render json: user.errors.full_messages , status: :unprocessable_entity 
    end
  end

  # PATCH/PUT /users/1
  def update
    user = User.find(params[:id])
    user.name = params[:user][:username] 
    user.status = params[:user][:phone] 
      if user.save
        render json: user, status: :ok
      else
        render json: user.errors.full_messages , status: :unprocessable_entity
      end
  end

  # DELETE /users/1
  def destroy
    user = User.find(params[:id])
    if user.destroy
      head :no_content
    else
      render json: "There was a problem removing the user"
    end
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:username, :phone)
    end
end
