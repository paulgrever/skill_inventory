require_relative '../test_helper'

class UserUpdatesSkillTest < FeatureTest
  def test_user_updates_a_task
    SkillInventory.create({ :title => "a title", 
                          :description => "a descrip",
                          :id => 1})
    visit '/skills/1/edit'
    fill_in'skill[title]', with: "paul"
    fill_in 'skill[description]', with: "grever"
    click_link_or_button("Make Changes")
    assert_equal '/skills/1', current_path
    within("#uniq_skill") do 
      assert page.has_content?("paul")
    end
  end
end