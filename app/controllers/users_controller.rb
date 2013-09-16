class UsersController < ApplicationController
  def followers
    user = params[:id]
    followers = Twitter.followers(user).all

    respond_to do |format|
      format.json do
        render json: followers.map {|follower| {:name => follower.name}}
      end
    end
  end
end


