module ActionView
  module Helpers
    def path_to_javascript_with_override(source)
      unless is_uri?(source)
        path_to_javascript_without_override(source)
      else
        source
      end
    end
    alias_method_chain :path_to_javascript, :override
    
    def path_to_stylesheet_with_override(source)
      unless is_uri?(source)
        path_to_stylesheet_without_override(source)
      else
        source
      end
    end
    alias_method_chain :path_to_stylesheet, :override
    
    def static_asset_javascript(key, cache_path)
      static_asset_include(key, cache_path, :javascripts)
    end
    
    def static_asset_stylesheet(key, cache_path)
      static_asset_include(key, cache_path, :stylesheets)
    end
    
    private
    def is_uri?(path)
      path =~ %r{^[-a-z]+://}
    end
    
    def static_asset_include(key, cache_path, type)
      includes = Static::Asset.descriptor[key]
      uri_includes = []
      script_tags = ''

      includes.each do |incl|
        if is_uri?(incl)
          uri_includes << includes.delete(incl)
        end
      end

      uri_includes.each do |uri_incl|
        if type == :javascripts
          script_tags << "#{javascript_include_tag uri_incl}\n"
        else
          script_tags << "#{stylesheet_link_tag uri_incl}\n"
        end
      end
      
      if type == :javascripts
        script_tags << "#{javascript_include_tag includes, :cache => cache_path}\n"
      else
        script_tags << "#{stylesheet_link_tag includes, :cache => cache_path}\n"
      end

      script_tags
    end
  end
end