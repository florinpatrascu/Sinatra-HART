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
    $ shotgun -O config.ru -p 3000 # or rackup config.ru -p 3000

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

## Contributing

  * Fork it
  * Create your feature branch (``git checkout -b my-new-feature``)
  * Add some tests and please make sure they pass
  * Commit your changes (``git commit -am 'Added some feature'``)
  * Push to the branch (``git push origin my-new-feature``)
  * Create new Pull Request

## License
Copyright (c) 2012 Florin T.Pătraşcu

MIT License

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
"Software"), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.


[1]: http://guides.rubyonrails.org/testing.html#preparing-your-application-for-testing
