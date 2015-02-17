class SkillInventory

  def self.database
    if ENV["SKILL_INVENTORY_ENVIRONMENT"] == "test"
      @database ||= Sequel.sqlite('db/skill_inventory_test.sqlite3')
    else
      @database ||= Sequel.sqlite('db/skill_inventory.sqlite3')
    end
  end

  def self.create(skill)
    dataset.insert({ :title => skill[:title], :description => skill[:description]})
    # database.transaction do
    #   database[:skills] ||= []
    #   database[:total] ||= 0
    #   database['total'] += 1
    #   database['skills'] << { "id" => database['total'], "title" => skill[:title], "description" => skill[:description] }
    # end
  end

  def self.dataset
    database[:skills]
  end

  def self.raw_skills
    dataset.to_a
    # database.transaction do
    #   database["skills"] || []
    # end
  end


  def self.all
    raw_skills.map{ |data| Skill.new(data)}
    # raw_skills.map { |data| Skill.new(data) }
  end


  def self.raw_skill(id)
    raw_skills.find { |skill| skill[:id] == id }
  end

  def self.find(id)
    Skill.new(raw_skill(id))
  end

  def self.update(id, skill)
    row = dataset.where(:id => id)
    row.update({:title => skill[:title], :description => skill[:description]})
    # database.transaction do
    #   target = database['skills'].find { |data| data["id"] == id }
    #   target["title"] = skill[:title]
    #   target["description"] = skill[:description]
    # end
  end

  def self.delete(id)
    dataset.where(:id => id).delete
    # database.transaction do
    #   database['skills'].delete_if { |skill| skill["id"] == id }
    # end
  end

  def self.delete_all
    dataset.delete
    # database.transaction do
    #   database['skills'] = []
    #   database['total'] = 0
    # end
  end
end
