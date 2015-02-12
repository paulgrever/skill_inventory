equire_relative '../test_helper'

class FrontPageTest < FeatureTest

  def test_user_sees_greeting
    visit '/'
    assert page.has_content?("Skills Dashboard")
  end
end