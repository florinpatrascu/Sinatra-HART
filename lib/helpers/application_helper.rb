require "sinatra"

module ApplicationHelper
  helpers do
    include Rack::Utils

    def current_section
      url_path request.path_info.sub('/','').split('/')[0].downcase
    end

    def current_page
      url_path request.path_info.sub('/','')
    end

    def url_path(*path_parts)
      [ path_prefix, path_parts ].join("/").squeeze('/')
    end

    alias_method :u, :url_path
    alias_method :h, :escape_html  
  end
end
