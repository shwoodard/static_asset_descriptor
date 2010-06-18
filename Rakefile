begin
  require 'jeweler'
  Jeweler::Tasks.new do |gemspec|
    gemspec.name = "static_asset_descriptor"
    gemspec.summary = "Manages static includes in a rails app"
    gemspec.description = "You can include page specific static assets and global static assets.  Use the layout and view generators"
    gemspec.email = "sam.h.woodard@gmail.com"
    gemspec.homepage = "http://github.com/shwoodard/static_asset_descriptor"
    gemspec.authors = ["Sam Woodard"]
  end
rescue LoadError
  puts "Jeweler not available. Install it with: gem install jeweler"
end

require 'rake'
require 'rake/testtask'
require 'rake/rdoctask'

desc 'Default: run unit tests.'
task :default => :test

desc 'Test the static_asset_descriptor plugin.'
Rake::TestTask.new(:test) do |t|
  t.libs << 'lib'
  t.libs << 'test'
  t.pattern = 'test/**/*_test.rb'
  t.verbose = true
end

desc 'Generate documentation for the static_asset_descriptor plugin.'
Rake::RDocTask.new(:rdoc) do |rdoc|
  rdoc.rdoc_dir = 'rdoc'
  rdoc.title    = 'StaticAssetDescriptor'
  rdoc.options << '--line-numbers' << '--inline-source'
  rdoc.rdoc_files.include('README')
  rdoc.rdoc_files.include('lib/**/*.rb')
end
