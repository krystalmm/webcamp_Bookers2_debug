class RelationshipsController < ApplicationController
  before_action :set_user
  
  def create
    current_user.follow(@user)
    respond_to do |format|
      format.html { redirect_back(fallback_location: root_path) }
      format.js
    end
  end
  
  def destroy
    current_user.unfollow(@user)
    respond_to do |format|
      format.html { redirect_back(fallback_location: root_path) }
      format.js
    end
  end
  
  private
  
  def set_user
    @user = User.find(params[:followed_id])
  end
end
