require "sinatra"

module ProductsController
  
  get '/' do
    haml :index
  end

  get '/products' do
    @products = Product.all
    haml :'/products/index'
  end

end