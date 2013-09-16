class TweetsController < ApplicationController
  def index
    search = params[:search]
    puts params[:search]
    @results_array = []
    Twitter.search(search, :result_type => "recent").results.map do |status|
      @results_array << "#{status.from_user}: #{status.text}"
    end
    respond_to do |format|
      format.html
      format.json do
        render json: @results_array.map {|result| result}
      end
    end
  end
end