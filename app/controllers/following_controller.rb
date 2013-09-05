class FollowingController < ApplicationController
  def index
    @followings = Twitter.following.all

    respond_to do |format|
      format.html
      format.json do
        render :json => @followings.map{|following| {:name => following.name, :screen_name => following.screen_name} }
      end
    end
  end
end
