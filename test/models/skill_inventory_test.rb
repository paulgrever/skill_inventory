require_relative '../test_helper'
class SkillInventoryTest < ModelTest
  def test_it_creates_a_skill
    SkillInventory.create({ :title       => "a title", 
                         :description => "a description",
                         :id          => 1 })
    skill = SkillInventory.find(1)
    assert_equal "a title", skill.title
    assert_equal "a description", skill.description
    assert_equal 1, skill.id
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

  def test_it_finds_a_task
    create_three_skills
    skill = SkillInventory.find(2)
    assert_equal "a title 2", skill.title
    assert_equal "a description 2", skill.description
    assert_equal 2, skill.id
  end

  def test_it_displays_all_skills
    create_three_skills
    skill = SkillInventory.all
    assert_equal 3, skill.count
    assert_equal "a title 3", skill.last.title
  end

  def test_it_updates_a_skill
    create_three_skills
    skill = SkillInventory
    assert_equal "a title 2", skill.all[1].title
    skill.update(2, {:title => "RUBY", 
                      :description => "RUBYYYY"})
    assert_equal "RUBY", skill.all[1].title
  end

  def test_it_deletes_a_skill
  end
end

