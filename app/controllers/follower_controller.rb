class FollowerController < ApplicationController
  def index
    @followers = Twitter.followers.all
  end
end
