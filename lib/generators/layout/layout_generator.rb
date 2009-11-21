class LayoutGenerator < Rails::Generator::NamedBase
  def manifest
    record do |m|
      m.directory "app/views/layouts"
      m.directory "public/stylesheets/common"
      m.directory "public/javascripts/common"
      m.directory "static/stylesheets/common"
      m.directory "static/javascripts/common"
      m.template 'layout.html.erb', "app/views/layouts/application.html.erb"
      m.file 'global_stylesheet.yml.erb', "static/stylesheets/common/global.yml" 
      m.file 'global_javascript.yml.erb', "static/javascripts/common/global.yml"
      m.file 'application.css.erb', "public/stylesheets/common/application.css"
      m.file 'application.js.erb', "public/javascripts/common/application.js"
    end
  end
end
