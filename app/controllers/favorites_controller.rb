class FavoritesController < ApplicationController
  before_action :require_user_logged_in
  
  def create
    micropost = Micropost.find_by(id: params[:id])
    current_user.like_post(micropost)
    flash[:success] = 'お気に入り登録しました。'
    redirect_back(fallback_location: root_path)
  end

  def destroy
    micropost = Micropost.find_by(id: params[:id])
    current_user.unlike_post(micropost)
    flash[:success] = 'お気に入りを解除しました。'
   redirect_back(fallback_location: root_path)
  end
end