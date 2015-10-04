class SessionsController < ApplicationController
  def new
    @login_form = LoginForm.new(remember_me: true)
  end

  def create
    @login_form = LoginForm.new(params[:login_form])

    if user = @login_form.authenticate
      start_session(user)
      redirect_to bills_url
    else
      flash.now[:notice] = t('flash.login.failed')
      render :new
    end
  end

  def destroy
    destroy_session
    redirect_to login_path
  end
end
