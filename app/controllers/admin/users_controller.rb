class Admin::UsersController < ApplicationController
  before_filter :restrict_admin_access
  before_filter :restrict_access

  def index
    @users = User.all
  end

  def destroy
    @user = User.find(params[:id])
    UserMailer.deleted_user_email(@user).deliver_now

    @user.destroy
    redirect_to admin_users_path
  end
  protected

  def user_params
    params.require(:user).permit(:email, :firstname, :lastname, :password, :password_confirmation)
  end
end
