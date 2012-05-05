require "sinatra"
require "haml"
require "yaml"
require 'active_record'
  
Settings = {}
YAML.load_file('settings.yml').each {|k,v|
  Settings[k] = v
}

ActiveRecord::Base.configurations = YAML::load(IO.read("db/config.yml"))
ActiveRecord::Base.establish_connection(ENV['RACK_ENV'])
ActiveRecord::Base.logger = Logger.new(File.open("log/#{ENV['RACK_ENV']}.log", "a")) #or STDOUT

if defined? Encoding
  Encoding.default_external = Encoding::UTF_8
end

def load_all_libs_relative_to( fname, dir = nil )
  dir ||= ::File.basename(fname, '.*')
  search_me = ::File.expand_path(
      ::File.join(::File.dirname(fname), dir, '**', '*.rb'))
  Dir.glob(search_me).sort.each {|rb| load rb}
end

# register ... Sintra:: stuff
configure do
  load_all_libs_relative_to(__FILE__, 'lib/helpers' )
  load_all_libs_relative_to(__FILE__, 'lib/controllers' )
  load_all_libs_relative_to(__FILE__, 'lib/models' )
  require File.join(File.dirname(__FILE__), %w[lib before_filters.rb])
end

case ENV['RACK_ENV']
  when 'development'
    set :environment, :development  
  when 'production'
    set :environment, :production
    set :logging, false
end  

use Rack::Session::Cookie, :key => 'rack.session',
                           :domain => Settings['domain'],
                           :path => '/',
                           :expire_after => Settings['session_expire'], #  These are seconds
                           :secret => 'svTejq7FMd6u3X1KUhUA09sh82ieAHEAIZ0f'
                           
app_dir = File.dirname(File.expand_path(__FILE__))  
set :views,  "#{app_dir}/views"

if Sinatra::Base.respond_to? :public_folder
  set :public_folder, "#{app_dir}/public"
else
  set :public, "#{app_dir}/public"
end

set :static, true

# 'system' calls
get '/stats' do
  haml :stats, :layout => false
end
  
