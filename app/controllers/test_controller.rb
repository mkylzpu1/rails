class TestController < ApplicationController

  def index
    @q = Post.ransack(params[:q])
    @users = @q.result.includes(:user, :favorites).order(created_at: :desc)

  end
end
