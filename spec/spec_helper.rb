# encoding: UTF-8
$LOAD_PATH.unshift File.expand_path(File.dirname(__FILE__) + '/..')
$LOAD_PATH.unshift File.expand_path(File.dirname(__FILE__) + '/../lib')

gem 'rails'
gem 'rubigen'

require 'rails_generator'
require 'rails_generator/scripts/generate'
require 'rubigen'
require 'rubigen/helpers/generator_test_helper'

include RubiGen::GeneratorTestHelper
