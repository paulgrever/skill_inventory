require_relative '../test_helper'

class UserCreatesSkillTest < FeatureTest
  def test_user_creates_a_task
    visit '/'
    click_link_or_button('New Skill')
    assert_equal '/skills/new', current_path
    fill_in 'skill[title]', with: "Filler"
    fill_in 'skill[description]', with: "longer filler"
    click_link_or_button('submit')
    assert_equal '/skills', current_path
    within ('#skill_list') do 
      assert page.has_content?("Filler") 
    end

  end
end