class ViewGenerator < Rails::Generator::NamedBase
  def manifest
    record do |m|
      base_path, file_name = get_base_path_and_file_name(file_path)
      m.directory "app/#{base_path}"
      m.directory "public/stylesheets/#{base_path}"
      m.directory "public/javascripts/#{base_path}"
      m.directory "static/stylesheets/#{base_path}"
      m.directory "static/javascripts/#{base_path}"
      m.template 'view.html.erb', "app/views/#{file_path}.html.erb"
      m.template 'stylesheet.yml.erb', "static/stylesheets/views/#{file_path}.yml" 
      m.template 'javascript.yml.erb', "static/javascripts/views/#{file_path}.yml"
      m.file 'view.css.erb', "public/stylesheets/views/#{file_path}.css"
      m.file 'view.js.erb', "public/javascripts/views/#{file_path}.js"
    end
  end
  def get_base_path_and_file_name(file_path)
    ["views/#{file_path}".split('/')[0...-1].join('/'), "views/#{file_path}".split('/')[-1]]
  end
end
