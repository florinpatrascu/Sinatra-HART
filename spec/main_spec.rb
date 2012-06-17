require 'spec_helper'
require_relative '../app.rb'
require 'rack/test'

set :environment, :test

def app
  @app ||= Sinatra::Application
end

describe 'My-Store (demo)' do
  include Rack::Test::Methods

  before(:all) do
    Product.delete_all
    @prod = Product.create(:name => "crayon", :price => 1.2)
  end

  ["/", "/products"].each do |url|
    it "should render page #{url}" do
      get url
      last_response.should be_ok
    end
  end

  it "should find some products" do
    get '/products'
    last_response.should be_ok
    # last_response.body.should =~ /There are no products/m
    last_response.body.should contain 'crayon'
  end

end