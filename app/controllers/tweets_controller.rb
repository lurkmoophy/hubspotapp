class TweetsController < ApplicationController

  before_action :set_tweet, only: [:show, :edit, :update, :destroy]

  # GET /tweets
  # GET /tweets.json
  def raw
    
    @per_page = params[:per_page] || Tweet.per_page || 20
    if @per_page == "ALL"
      @tweets = Tweet.paginate( :per_page => Tweet.count, :page => params[:page])
    elsif %w(10 20 30 40 50 75 100).any?
      @tweets = Tweet.paginate( :per_page => @per_page, :page => params[:page])
    else
      @tweets = Tweet.paginate( :per_page => 20, :page => params[:page])
    end
  end

  def eu

    @tweets = Tweet.where(eu: 'Y')

    @per_page = params[:per_page] || Tweet.per_page || 20
      if @per_page == "ALL"
        @eutweets = @tweets.paginate( :per_page => @tweets.count, :page => params[:page])
      elsif %w(10 20 30 40 50 75 100).any?
        @eutweets = @tweets.paginate( :per_page => @per_page, :page => params[:page])
      else
        @eutweets = @tweets.paginate( :per_page => 20, :page => params[:page])
      end
    
  end

  def us

    @tweets = Tweet.where(us: 'Y')

    @per_page = params[:per_page] || Tweet.per_page || 20
      if @per_page == "ALL"
        @ustweets = @tweets.paginate( :per_page => @tweets.count, :page => params[:page])
      elsif %w(10 20 30 40 50 75 100).any?
        @ustweets = @tweets.paginate( :per_page => @per_page, :page => params[:page])
      else
        @ustweets = @tweets.paginate( :per_page => 20, :page => params[:page])
      end
    
  end

  def index

    @tweets = Tweet.where(uk: 'Y')

    respond_to do |format|
      format.html do
        @per_page = params[:per_page] || Tweet.per_page || 20
        if @per_page == "ALL"
          @uktweets = @tweets.paginate( :per_page => @tweets.count, :page => params[:page])     
        end
        elsif %w(10 20 30 40 50 75 100).any?
          @uktweets = @tweets.paginate( :per_page => @per_page, :page => params[:page])     
        end
        else
          @uktweets = @tweets.paginate( :per_page => 20, :page => params[:page])

        end
      end
      format.csv do
        headers['Content-Disposition'] = "attachment; filename=\"tweet-list\""
        headers['Content-Type'] ||= 'text/csv'
      end
    end



    


  end

  # GET /tweets/1
  # GET /tweets/1.json
  def show
  end

  # GET /tweets/new
  def new
    @tweet = Tweet.new
  end

  # GET /tweets/1/edit
  def edit
  end

  # POST /tweets
  # POST /tweets.json
  def create
    @tweet = Tweet.new(tweet_params)

    respond_to do |format|
      if @tweet.save
        format.html { redirect_to @tweet, notice: 'Tweet was successfully created.' }
        format.json { render :show, status: :created, location: @tweet }
      else
        format.html { render :new }
        format.json { render json: @tweet.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tweets/1
  # PATCH/PUT /tweets/1.json
  def update
    respond_to do |format|
      if @tweet.update(tweet_params)
        format.html { redirect_to @tweet, notice: 'Tweet was successfully updated.' }
        format.json { render :show, status: :ok, location: @tweet }
      else
        format.html { render :edit }
        format.json { render json: @tweet.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tweets/1
  # DELETE /tweets/1.json
  def destroy
    @tweet.destroy
    respond_to do |format|
      format.html { redirect_to tweets_url, notice: 'Tweet was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tweet
      @tweet = Tweet.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tweet_params
      params.require(:tweet).permit(:tweeturl, :handle, :name, :bio, :userlocation, :country)
    end
end
