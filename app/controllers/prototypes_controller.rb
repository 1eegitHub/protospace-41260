class PrototypesController < ApplicationController

  before_action :set_prototype, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :edit, :create, :update, :destroy]

  def index
    @prototypes = Prototype.all
  end

  def new
    @prototype = Prototype.new
    @user = User.find(params[:user_id])
    @prototype = @user.prototypes.build
  end

  def show 
    @comment = Comment.new
    @comments = @prototype.comments.includes(:user)
    @prototype = Prototype.find(params[:id])
    @comments = @prototype.comments
  end

  def create
  
    @prototype = Prototype.new(prototype_params)

    if @prototype.save
      redirect_to root_path(@prototype)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    unless @prototype.user == current_user
      redirect_to action: :index
    end
  end

  def update
    if @prototype.update(prototype_params)
      redirect_to user_prototype_path(@prototype.user, @prototype)
    else
      render "prototypes/edit" , status: :unprocessable_entity
    end
  end

  def destroy
    prototype = Prototype.find(params[:id])
    prototype.destroy
    redirect_to root_path(prototype)
  end

  private
  def prototype_params
    params.require(:prototype).permit(:title, :catch_copy, :image, :concept).merge(user_id: current_user.id)
  end
  
  def set_prototype
    binding.pry
    @prototype = Prototype.find(params[:id])
  end

end
