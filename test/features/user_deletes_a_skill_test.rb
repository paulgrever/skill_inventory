require_relative '../test_helper'

class UserDeletesSkillTest < FeatureTest

  def test_user_deletes_a_skill
    SkillInventory.create({ :title => "a title", 
                          :description => "a descrip",
                          :id => 1})

    visit '/skills'
    assert_equal 1, SkillInventory.all.count
    click_link_or_button('delete')
    assert_equal '/skills', current_path
    assert_equal 0, SkillInventory.all.count
  end
  
  def create_three_skills
    id_num = 1
    3.times do |skill|
      SkillInventory.create({:title       => "a title #{id_num}", 
                         :description => "a description #{id_num}"
                          })
      id_num += 1
    end
  end
end
