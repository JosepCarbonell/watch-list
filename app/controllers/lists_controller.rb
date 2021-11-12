class ListsController < ApplicationController
  before_action :set_list, only: %i[show]
  def new
    @list = List.new
  end

  def index
    @lists = List.all
  end

  def show
  end

  def create
    @list = List.new(lists_params)
    if @list.save
      redirect_to list_path(@list)
    else
      render :new
    end
  end

  private

  def set_list
    @list = List.find(params[:id])
  end

  def lists_params
    params.require(:list).permit(:name)
  end
end
