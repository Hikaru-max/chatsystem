class MedicalusersController < ApplicationController
  def index
    @users = MedicalUser.order(id: :desc).page(params[:page]).per(25)
  end

  def show
    @user = MedicalUser.find(params[:id])
  end

  def new
  end

  def create
  end
end
