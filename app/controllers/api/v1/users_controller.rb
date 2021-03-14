class Api::V1::UsersController < Api::V1::ApiController
  before_action :get_user, only: [:show, :update] 

  def show
    serialize()
  end

  def update
    @user.attributes = user_params
    save_user
  end

  private

  def get_user
    p params
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :email)
  end

  def save_user
    serialize() if @user.save
  end

  def serialize()
    render json: UserSerializer.new(@user, params: { current_user: current_user }).serializable_hash
  end

end
