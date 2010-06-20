# encoding: UTF-8
require File.expand_path(File.dirname(__FILE__) + '/../spec_helper.rb')

describe "get_base_path_and_file_name" do
  def file_list
    Dir.glob(File.join(fake_rails_root, "*"))
  end
  
  def fake_rails_root
    File.join(File.dirname(__FILE__), 'rails_root')
  end

  before(:each) do
    FileUtils.mkdir_p(fake_rails_root)
    @original_files = file_list
  end
  
  it "should work" do
    run_generator("view", [], [])
    new_file = (file_list - @original_files).first
    File.basename(new_file).should == "foo"
  end
end
