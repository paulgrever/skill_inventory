require 'sequel'

test_database = Sequel.sqlite('db/skill_inventory_test.sqlite3')
dev_database = Sequel.sqlite('db/skill_inventory.sqlite3')

[test_database, dev_database].each do |database|
  database.create_table :skills do
    primary_key :id
    String :title
    Text :description
  end
end