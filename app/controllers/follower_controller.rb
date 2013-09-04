class FollowerController < ApplicationController
  def index
    @follower = []
    @follower = Twitter.followers.all
  end
end
