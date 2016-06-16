class Admin::ToolsController < ApplicationController

  def index
    @tools = Tool.all
    @recent = most_recent_tool
  end

  def show
    @tool = Tool.find(params[:id])
  end

  def new
    @categories = Category.all
    @users = User.all
    @tool = Tool.new
  end

  def create
    @tool = Tool.new(tool_params)
    @categories = Category.all
    @users = User.all
    if @tool.save
      redirect_to admin_tool_path(@tool)
    else
      render :new
    end
  end

  def edit
    @tool = Tool.find(params[:id])
    @categories = Category.all
    @users = User.all
  end

  def update
    @tool = Tool.find(params[:id])
    if @tool.update(tool_params)
      redirect_to admin_tool_path(@tool)
    else
      render :edit
    end
  end

  def destroy
   @tool = Tool.find(params[:id])
   @tool.destroy
   redirect_to admin_tools_path
  end

  private

  def tool_params
    params.require(:tool).permit(:name, :price, :quantity, :category_id, :user_id)
  end
end
