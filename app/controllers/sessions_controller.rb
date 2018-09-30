class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      # ユーザーログイン後にユーザー情報のページにリダイレクトする
      log_in user
      params[:session][:remember_me] == '1' ? remember(user) : forget(user)
      redirect_back_or user
      #log_in method is pronounced in sessionhelper.
      #redirect_to user= user_url(user)
    else
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new'
      #flsh.NOW を使用することで、Render後に同じエラーメッセージを表示させない。（RedirectならFlashだけでOK）
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_url
  end
end
