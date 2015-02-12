require 'bundler'
Bundler.require

ENV["SKILL_INVENTORY_ENVIRONMENT"] == "test"

require File.expand_path("../../config/environment", __FILE__)
require 'minitest/autorun'

class ModelTest < Minitest::Test 
  def teardown
    SkillInventory.delete_all
  end
end