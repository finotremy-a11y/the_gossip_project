class PrivateMessagesController < ApplicationController
  before_action :require_login

  def new
    @message = PrivateMessage.new
    @users = User.all
  end

  def create
    @message = PrivateMessage.new(content: params[:private_message][:content])
    @message.sender = current_user

    if @message.save
      # Ajouter les destinataires
      params[:recipients].each do |recipient_id|
        MessageRecipient.create(
          private_message: @message,
          recipient_id: recipient_id
        )
      end

      redirect_to private_message_path(@message), notice: "Message envoyé"
    else
      flash.now[:danger] = "Impossible d'envoyer le message"
      render :new
    end
  end

  def show
    @message = PrivateMessage.find(params[:id])
  end

  private

  def require_login
    unless logged_in?
      redirect_to new_session_path, alert: "Tu dois être connecté pour envoyer un message"
    end
  end
end
