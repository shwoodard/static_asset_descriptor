class ViewGenerator < Rails::Generators::NamedBase
  source_root File.expand_path("../templates", __FILE__)
  class_option :haml, :type => :boolean, :default => false
  
  def create_view
    if options.haml?
      template 'view.html.haml', "app/views/#{file_path}.html.haml"
    else
      template 'view.html.erb', "app/views/#{file_path}.html.erb"
    end
    
    template 'stylesheet.yml.erb', "static/stylesheets/views/#{file_path}.yml" 
    template 'javascript.yml.erb', "static/javascripts/views/#{file_path}.yml"
    copy_file 'view.css.erb', "public/stylesheets/views/#{file_path}.css"
    copy_file 'view.js.erb', "public/javascripts/views/#{file_path}.js"
  end
end
