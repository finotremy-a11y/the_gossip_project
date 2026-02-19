class CommentsController < ApplicationController
  before_action :require_login

  def create
    @gossip = Gossip.find(params[:gossip_id])
    @comment = @gossip.comments.build(comment_params)
    @comment.user = User.first  # utilisateur temporaire

    if @comment.save
      redirect_to gossip_path(@gossip)
    else
      redirect_to gossip_path(@gossip), alert: "Erreur lors de l'ajout du commentaire"
    end
  end

  def edit
    @gossip = Gossip.find(params[:gossip_id])
    @comment = Comment.find(params[:id])
  end

  def update
    @gossip = Gossip.find(params[:gossip_id])
    @comment = Comment.find(params[:id])

    if @comment.update(comment_params)
      redirect_to gossip_path(@gossip)
    else
      render :edit
    end
  end

  def destroy
    @gossip = Gossip.find(params[:gossip_id])
    @comment = Comment.find(params[:id])
    @comment.destroy

    redirect_to gossip_path(@gossip)
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end
