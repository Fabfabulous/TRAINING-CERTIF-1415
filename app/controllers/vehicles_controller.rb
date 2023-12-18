class VehiclesController < ApplicationController
  before_action :set_vehicle, only: %i[show edit destroy update]
  skip_before_action :authenticate_user!, only: :index

  def index
    @vehicles = Vehicle.all
  end

  def new
    @vehicle = Vehicle.new
  end

  def create
    @vehicle = Vehicle.new(vehicle_params)
  end

  def show

  end

  def edit

  end

  def update

  end

  def destroy

  end

  private

  def set_vehicle
    @vehicle = Vehicle.find(params[:id])
  end

  def vehicle_params
    params.require(:vehicle).permit(:name, :brand, :type, :passenger, :price)
  end
end
