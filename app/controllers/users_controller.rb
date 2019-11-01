class UsersController < ApplicationController
  skip_before_action :authenticate!, only: [ :create, :sign_in ]

  def create
    @user = User.new(email: params[:email], password: params[:password], name: params[:name])

    if @user.save
      render json: @user
    else
      render json: { errors: @user.errors.full_messages }, status: 400
    end
  end

  def sign_in
    @user = User.find_by(email: params[:email])

    if @user && @user.authenticate(params[:password])
      render json: @user
    else
      render json: { errors: ['ログインに失敗しました'] }, status: 401
    end
  end

  def me
    render json: current_user
  end
end