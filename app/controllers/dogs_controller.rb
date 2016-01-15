class DogsController < ApplicationController
  before_action :set_dog, only: [:show, :edit, :update, :destroy]

  # POST /dogs
  # POST /dogs.json
  def create
    @dog = Dog.new(dog_params)

    respond_to do |format|
      if @dog.save
        format.html { redirect_to root_path, notice: 'Dog was successfully created.' }
        format.json { render :show, status: :created, location: @dog }
      else
        format.html { render :new }
        format.json { render json: @dog.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @user = current_user
    if @user.has_role? :admin
      @dog.destroy
      respond_to do |format|
        format.html { redirect_to root_url, notice: 'Dog was successfully destroyed.' }
        format.json { head :no_content }
      end
    else
      redirect_to :back
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_dog
      @dog = Dog.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def dog_params
      params.require(:dog).permit(:image)
    end
end
