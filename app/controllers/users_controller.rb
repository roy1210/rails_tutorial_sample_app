class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    #Strong parameterの使用前の引数は(params[:user])
    if @user.save
      log_in @user
      #登録後自動でログインされる
      flash[:success] = "Welcome to the Sample App!"
      redirect_to @user
      #= redirect_to user_url(@user) 送信に成功したらRenderではない。
    else
      render 'new'
    end
  end

  def show
    @user = User.find(params[:id])
    #debugger
    #a=params => puts a.to_yaml
  end

  private

  def user_params
    params.require(:user).permit(:name,:email,:password,:password_confirmation)
  end
end
