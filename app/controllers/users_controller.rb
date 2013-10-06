class UsersController < ApplicationController
  def followers
    user = params[:id]
    followers = Twitter.followers(user).all

    respond_to do |format|
      format.json do
        render json: followers.map {|follower| {:name => follower.name}}
      end
      format.html{render :file => "#{Rails.root}/public/404", :layout => false, :status => :not_found}
    end
  end
end


