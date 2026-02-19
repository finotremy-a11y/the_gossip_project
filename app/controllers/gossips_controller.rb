class GossipsController < ApplicationController
  before_action :require_author, only: [:edit, :update, :destroy]

  def require_author
    @gossip = Gossip.find(params[:id])
    unless @gossip.user == current_user
      redirect_to gossip_path(@gossip), alert: "Tu n'as pas le droit de faire ça"
    end
  end

  def index
    @gossips = Gossip.all
  end

  def show
    @gossip = Gossip.find(params[:id])
  end

  def edit
    @gossip = Gossip.find(params[:id])
  end

  def update
    @gossip = Gossip.find(params[:id])

    if @gossip.update(gossip_params)
      redirect_to gossip_path(@gossip), notice: "Gossip mis à jour"
    else
      flash.now[:danger] = "Impossible de mettre à jour"
      render :edit
    end
  end

  def new
    @gossip = Gossip.new
  end

  def create
    @gossip = Gossip.new(gossip_params)
    @gossip.user = current_user

    if @gossip.save
      redirect_to root_path, notice: "Gossip créé avec succès"
    else
      flash.now[:danger] = "Impossible de créer le gossip"
      render :new
    end
    if params[:tags].present?
      tag_list = params[:tags].split(",").map(&:strip)

      tag_list.each do |tag_title|
        tag = Tag.find_or_create_by(title: tag_title)
        GossipTag.create(gossip: @gossip, tag: tag)
      end
    end
  end

  def destroy
    @gossip = Gossip.find(params[:id])
    @gossip.destroy
    redirect_to root_path, notice: "Gossip supprimé"
  end

  private

  def gossip_params
    params.require(:gossip).permit(:title, :content)
  end
end
