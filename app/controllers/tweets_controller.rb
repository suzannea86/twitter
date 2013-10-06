class TweetsController < ApplicationController
  def index
    search = params[:search]
    @results_array = []

    Twitter.search(search, :result_type => "recent", :lang => "en").results.map do |status|
      result_set_hash = {}
      result_set_hash["user"] = "#{status.from_user}"
      result_set_hash["tweet"] = "#{status.text}"
      @results_array << result_set_hash
    end

    respond_to do |format|
      format.html
      format.json do
        render json: @results_array 
      end
    end
  end
end