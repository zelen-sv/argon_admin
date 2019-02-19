class Admin::UsersController < Admin::BaseAdminController
  before_action :set_user, only: [:edit, :update, :destroy]

  def new
    @user = User.new
  end

  def index
    @users = User.order(created_at: :desc).page(params[:page]).per(6)
  end

  def edit
  end

  def update
    return redirect_to admin_users_path if @user.update(user_params)
    flash.now[:error] = 'Failed to update user!'
    render 'edit'
  end

  def create
    @user = User.new(user_params)

    return redirect_to admin_users_path if @user.save
    flash.now[:error] = 'Failed to create user!'
    render 'new'
  end

  def destroy
    @user.destroy
    flash[:error] = 'User destroyed'
    redirect_to admin_users_path
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
