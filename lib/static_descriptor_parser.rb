module Static
  class Asset
    # Configurations
    cattr_accessor :base_path
    
    cattr_reader :descriptor
    
    
    class << self
      def descriptor
        @descriptor = begin
          if !@descriptor or @descriptor.empty?
            build_assets(base_path)
          else
            @descriptor
          end
        end
      end      
      
      def base_path
        @base_path ||= File.join(RAILS_ROOT, "static")
      end
      
      private
      def build_assets(path, assets = {})
        Dir[File.join(path, '*')].each do |file|
          if File.directory?(file)
            build_assets(file, assets) 
          else
            curr_descriptor = YAML::load(File.open(file))
            assets[curr_descriptor.keys.first] = get_file_list(curr_descriptor)
          end
        end
        assets
      end
        
      def get_file_list(hash)
        file_list = []
        descriptor_contents = hash[hash.keys.first]
        paths = descriptor_contents.is_a?(Array) ? descriptor_contents :  get_paths_by_environment(descriptor_contents)
        paths.each do |path|
          file_list << if descriptor_file?(path)
            get_file_list(YAML::load(File.open(File.join(base_path, "#{path[1..-1]}.yml")))) 
          else
            path
          end
        end
        file_list.flatten
      end
      
      def descriptor_file?(path)
        path[0,1] == '*'
      end
      
      def get_paths_by_environment(descriptor_contents)
        descriptor_contents.delete(descriptor_contents.has_key?(Rails.env) ? Rails.env : 'production' )
      end
    end # End class << self
  end # End Asset
end # End Static
