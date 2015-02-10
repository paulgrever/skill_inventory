class Skill
  attr_reader :id, :title, :description

  def initialize(params)
    @id = params["id"]
    @title = params["title"]
    @description = params["description"]
  end
end
