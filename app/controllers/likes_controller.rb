class LikesController < ApplicationController
  before_action :require_login

  def create
    @gossip = Gossip.find(params[:gossip_id])
    @gossip.likes.create(user: current_user)
    redirect_to gossip_path(@gossip)
  end

  def destroy
    @gossip = Gossip.find(params[:gossip_id])
    like = @gossip.likes.find(params[:id])
    like.destroy
    redirect_to gossip_path(@gossip)
  end
end
