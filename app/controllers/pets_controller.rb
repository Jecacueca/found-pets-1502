class PetsController < ApplicationController
  # before action to call set pet for specifc actions
  before_action :set_pet, only: [:show, :destroy, :edit, :update]
  def index
    @pets = Pet.all
  end

  def show
    # set_pet called in before action
  end

  def new
    @pet = Pet.new
  end

  def create
    @pet = Pet.new(pet_params)
    if @pet.save
      redirect_to pet_path(@pet)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    # set_pet called in before action
  end

  def update
    # set_pet tcalled in before action
    @pet.update(pet_params)
    redirect_to pet_path(@pet)
  end

  def destroy
    # set_pet called in before action
    @pet.destroy
    redirect_to pets_path
  end

  private

  # define set_pet private method so we don't repeat Pet.find(id) so much
  # This is called in the before_action as needed
  def set_pet
    @pet = Pet.find(params[:id])
  end

  def pet_params
    params.require(:pet).permit(:name, :address, :found_on, :species)
  end
end
