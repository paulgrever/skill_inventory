require_relative '../test_helper'

class FrontPageTest < FeatureTest

  def test_user_sees_title
    visit '/'
    assert page.has_content?("Skills Dashboard")
  end

  def test_user_sees_links
    visit '/'
    within('#list_item') do 
      assert page.has_content?("Skill Index")
      assert find_link("New Skill").visible?
    end
  end

end