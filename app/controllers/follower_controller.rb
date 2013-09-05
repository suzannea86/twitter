class FollowerController < ApplicationController
  def index
    @followers = Twitter.followers.all

    respond_to do |format|
      format.json do
        render json: @followers.map{|follower| {:name => follower.name, :screen_name => follower.screen_name}}
      end
      format.html { render :file => "#{Rails.root}/public/404", :layout => false, :status => :not_found }
    end
  end
end
