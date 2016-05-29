class AddressesController < ApplicationController
  before_action :find_address, only: [:edit, :update, :destroy]

  def index
    if params[:group_id]
      @group = Group.find(params[:group_id])
      @addresses = @group.addresses.paginate(page: params[:page], per_page: 10)
    else
      @addresses = Address.paginate(page: params[:page], per_page: 10)
    end 
  end

  def new
  	@address = Address.new
  end

  def create
  	@address = Address.new(address_params)
  	if @address.save
  		flash[:success] = "Successfully created new contact"
  		redirect_to addresses_path
  	else
  		render 'new'
  	end
  end
  
  def edit
    # @address = Address.find(params[:id])
    # debugger
  end	

  def update
    # @address = Address.find(params[:id])
    if @address.update(address_params)
      flash[:success] = "Successfully updated the contact deatils"
      redirect_to addresses_path
    else
      render 'edit'
    end
  end

  def destroy
    # @address = Address.find(params[:id])
    @address.destroy
    flash[:success] = "Successfully deleted contact"
    redirect_to addresses_path
  end
      

  private 

  def find_address
    @address = Address.find(params[:id])
  end

  def address_params
  	params.require(:address).permit(:name, :email, :company, :address, :phone, :avatar, :group_id)
  end
end
