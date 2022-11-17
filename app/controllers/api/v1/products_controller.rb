class Api::V1::ProductsController < ApplicationController




  def index

    @record= Product.all

    render json: @record, status:200
  end

  def show

    @product=Product.find_by( params[:id])
    if @product 
      render json: @product, status:200
    else
      render json: {error:"Product not found "}
    end

  end

  def create

    @product=Product.new(
      prod_params
      
    )

    if @product.save
      render json: @product, status:200
    else
      render json: {error:"Product not created"}
    end

  end

  def update
    @product=Product.find_by( params[:id])

    if @product
      @product.update(prod_params)
      render json: @product, status:200
    else
      render json: {error:"Product is not able to update"}
    end

  end

  def destroy
    @product = Product.find(params[:id])
    
    @product.destroy

    render json: "Element deleted", ststus:200

     
  end


  private
  def prod_params

    params.require(:product).permit([
      :name, :brand, :price]
      )
  end

  
end
