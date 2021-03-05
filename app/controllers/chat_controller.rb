class ChatController < ApplicationController
  def show
    @user = User.find_by(id: params[:user_id])
    @chat = Chat.new
  end
end

