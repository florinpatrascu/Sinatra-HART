#!/usr/bin/env ruby
require 'logger'

require File.join(File.dirname(__FILE__), 'app')

use Rack::ShowExceptions
run Sinatra::Application
