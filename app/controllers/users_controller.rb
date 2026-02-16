class UsersController < ApplicationController
  def show
    @user = User.find(params[:id] || User.first&.id)
  end
end
