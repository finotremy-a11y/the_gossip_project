class StaticPagesController < ApplicationController
  def welcome
    @first_name = params[:first_name]
  end

  def team
  end

  def contact
  end
end
