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
    @vehicle.user = current_user
    if @vehicle.save
      redirect_to vehicle_path(@vehicle), notice: "Vehicle correctly created!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @booking = Booking.new
  end

  def edit
  end

  def update
    if @vehicle.update(vehicle_params)
      redirect_to vehicle_path(@vehicle), notice: "Vehicle correctly updated!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    if @vehicle.destroy
      redirect_to root_path, notice: "Vehicle correctly deleted!"
    end
  end

  private

  def set_vehicle
    @vehicle = Vehicle.find(params[:id])
  end

  def vehicle_params
    params.require(:vehicle).permit(:name, :brand, :category, :passenger, :price, :photo)
  end
end
