require './lib/models/product'

5.times {|i|
  Product.create(:name => "product #{i}", :price => rand(10)+1)
}