# class ProductsController < ApplicationController
#   allow_unauthenticated_access only: %i[ index show ]
#   before_action :set_product, only: %i[ show edit update destroy ]

#   def index
#     @products = Product.all
#   end

#   def show
#   end

#   def new
#     @product = Product.new
#   end

#   def create
#     @product = Product.new(product_params)
#     if @product.save
#       redirect_to @product
#     else
#       render :new, status: :unprocessable_entity
#     end
#   end

#   def edit
#   end

#   def update
#     if @product.update(product_params)
#       redirect_to @product
#     else
#       render :edit, status: :unprocessable_entity
#     end
#   end

#   def destroy
#     @product.destroy
#     redirect_to products_path
#   end

#   private
#     def set_product
#       @product = Product.find(params[:id])
#     end

#     # def product_params
#     #   params.expect(product: [ :name, :description, :featured_image, :inventory_count ])
#     # end
#     def product_params
#       params.require(:product).permit(:name, :description, :featured_image, :inventory_count)
#     end
# end
class ProductsController < ApplicationController
  # Nếu có phương thức allow_unauthenticated_access, thì giữ lại. Nếu không thì xóa dòng này.
  allow_unauthenticated_access only: %i[ index show ] 
  
  before_action :set_product, only: %i[ show edit update destroy ]

  def index
    @products = Product.all
  end

  def show
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to @product, notice: 'Product was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @product.update(product_params)
      redirect_to @product, notice: 'Product was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @product.destroy
    redirect_to products_path, notice: 'Product was successfully deleted.'
  end

  private

  # Phương thức để lấy sản phẩm cần chỉnh sửa hoặc cập nhật
  def set_product
    @product = Product.find(params[:id])
  end

  # Phương thức để chỉ định các parameter cần thiết
  def product_params
    # Thêm các trường cần permit ở đây
    params.require(:product).permit(:name, :description, :inventory_count, :featured_image)
  end
end
