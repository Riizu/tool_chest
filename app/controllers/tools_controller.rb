class ToolsController < ApplicationController

  def index
    @tools = Tool.all
    @recent = most_recent_tool
  end

  def show
    @tool = Tool.find(params[:id])
  end

  def new
    @categories = Category.all
    @tool = current_user.tools.new
  end

  def create
    @tool = Tool.new(tool_params)
    @tool.user = current_user
    @categories = Category.all
    if @tool.save
      redirect_to user_tool_path(current_user, @tool)
    else
      render :new
    end
  end

  def edit
    @tool = Tool.find(params[:id])
    @categories = Category.all
  end

  def update
    @tool = Tool.find(params[:id])
    if @tool.update(tool_params)
      redirect_to user_tool_path(current_user, @tool)
    else
      render :edit
    end
  end

  def destroy
   @tool = Tool.find(params[:id])
   @user = User.find_by(id: params[:user_id].to_i)
   @tool.destroy
   redirect_to user_tools_path
  end

  private

  def tool_params
    params.require(:tool).permit(:name, :price, :quantity, :category_id)
  end
end
