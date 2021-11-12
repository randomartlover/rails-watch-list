class ListsController < ApplicationController
  before_action :set_list, only: [:show]
  def index
    @lists = List.all
  end

  def new
    @list = List.new
  end

  def create
    @list = List.create(list_params)
    if @list.save
      redirect_to list_path(@list)
    else
      render :new
    end
  end

  def show
    @banner_name = @list.name
  end

  def list_params
    params.require(:list).permit(:name, :image_url)
  end

  def set_list
    @list = List.find(params[:id])
  end
end
