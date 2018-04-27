class ProductsController < ApplicationController

  def index
    @products = Product.all.order(created_at: 'desc')
  end

  def new
    @product = Product.new
    @submit = '商品登録'
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to products_path
    else
      render 'new'
    end
  end

  def fload
    @product = Product.new
    @submit = '検索検索♪'
  end

  def search
    flg         = 0
    name        = params[:name]
    ordering    = params[:ordering]
    expiration  = params[:expiration]
    @datas       = Product.all

    if name.present?
      @datas     = Product.where("name like '%" + "#{name}" + "%'")
      flg       = 1
    end

    if ordering == 'true'
      if flg == 0
        @datas     = Product.where.not(ordering: nil)
        flg       = 1
      else
        @datas     = @datas.where.not(ordering: nil)
      end
    end

    if expiration == 'true'
      @today        =  Time.zone.today
      @ago2         =  @today.ago(2.days)
      @stringtoday  =  @today.strftime("%Y%m%d")
      @stringago2   =  @ago2.strftime("%Y%m%d")
      if flg == 0
        @datas      = Product.where("expiration" <= @stringtoday)
        flg         = 1
      else
        @datas      = Product.where(arrival: @stringago2..@stringtoday)
      end
    end

  end

  def calculation
    @now        = Time.zone.today
    @ago7       = @now.ago(7.days)
    @stringnow  = @now.strftime("%Y%m%d")
    @stringago7 = @ago7.strftime("%Y%m%d")
    @datas      = Product.where(arrival: @stringago7..@stringnow)
    @sums       = @datas.group(:name,:nameid).sum(:ordering)
  end


  private
    def product_params
      params.require(:product).permit(:name,:nameid,:ordering,:arrival,:expiration)
    end

    def fload_params
      params.require(:product).permit(:name)
    end

end
