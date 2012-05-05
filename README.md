# Sinatra-HART
### A Sinatra Haml, Activerecord, RSpec and Twitter bootstrap boilerplate

Get started:

    $ git clone git@github.com:florinpatrascu/Sinatra-HART.git
    $ cd Sinatra-HART
    $ gem install bundler #if you don't have it already?!
    $ bundle install
    $ bundle --binstubs
    $ rake db:migrate
    $ rake db:seed
    $ shotgun -O config.ru -p 3000

Or browser to <http://localhost:3000> by hand.

To create a new migration and then run the migration:

    $ rake db:new_migration name=my_migration
    $ rake db:migrate

## Testing
Do not forget to create and migrate the testing database before:

    $ rake db:test:load
Visit this [Preparing your Application for Testing][1] for more details.
  
Run tests once
  
    $ rspec spec
  
Testing coverage is generated with _SimpleCov_ flavor
    
    $ open coverage/index.html

## Playing  
And if you're missing the rails c(onsole), don't worry, run: 

    $ cd Sinatra-HART
    $ racksh
    Rack::Shell v0.9.11 started in development environment.
    [1] pry(main)> products = Product.all
    => [#<Product id: 1, name: "Product 0", price: #<BigDecimal:100c57a5 ...
    ...
    [2] pry(main)> 
  

for some rack console awesomess.

Have fun!


[1]: http://guides.rubyonrails.org/testing.html#preparing-your-application-for-testing
