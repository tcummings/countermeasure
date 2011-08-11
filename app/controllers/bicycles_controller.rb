class BicyclesController < ApplicationController
  before_filter :authenticate, :only => [:create, :destroy]

  def create
    @bicycle = current_user.bicycles.build(params[:bicycle])
    if @bicycle.save
      flash[:success] = "Bicycle created!"
      redirect_to root_path
    else
      render 'pages/home'
    end
  end

  def destroy
  end
end
