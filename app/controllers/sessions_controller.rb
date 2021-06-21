class SessionsController < ApplicationController
  def new #中に何も設定しない場合、デフォルトで"sessions/new"がrenderされる
  end

  def create
    idpass = params[:session][:idpass]
    password = params[:session][:password]
    if login(idpass, password)
      flash[:success] = 'ログインに成功しました。'
      redirect_to posts_url #redirectの場合、引数はurlで設定する
    else
      flash.now[:danger] = 'ログインに失敗しました。'
      render :new #renderの場合、引数はファイルパス "sessions/new"を省略したもの
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:success] = 'ログアウトしました。'
    redirect_to root_url
  end
  
  private
  
  def login(idpass, password)
    @user = MedicalUser.find_by(idpass: idpass)
    if @user && @user.authenticate(password)
      session[:user_id] = @user.id
      return true
    else
      return false
    end
  end
end
