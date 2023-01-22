class Users::ListsController < ApplicationController
  before_action :search

  def index
    #distinct: trueは重複したデータを除外
    @users = @q.result(distinct: true)
  end

  def search
    #params[:q]のqには検索フォームに入力した値が入る
    @q = User.ransack(params[:q])
  end

end
