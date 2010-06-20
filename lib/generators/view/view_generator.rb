class ViewGenerator < Rails::Generators::NamedBase
  source_root File.expand_path("../templates", __FILE__)
  
  def create_view
    base_path, file_name = get_base_path_and_file_name(file_path)
    directory "app/#{base_path}"
    directory "public/stylesheets/#{base_path}"
    directory "public/javascripts/#{base_path}"
    directory "static/stylesheets/#{base_path}"
    directory "static/javascripts/#{base_path}"
    template 'view.html.erb', "app/views/#{file_path}.html.erb"
    template 'stylesheet.yml.erb', "static/stylesheets/views/#{file_path}.yml" 
    template 'javascript.yml.erb', "static/javascripts/views/#{file_path}.yml"
    file 'view.css.erb', "public/stylesheets/views/#{file_path}.css"
    file 'view.js.erb', "public/javascripts/views/#{file_path}.js"
  end
  
  def get_base_path_and_file_name(file_path)
    ["views/#{file_path}".split('/')[0...-1].join('/'), "views/#{file_path}".split('/')[-1]]
  end
end
