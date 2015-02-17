require 'bundler'
Bundler.require

# set the pathname for the root of the app
require 'pathname'
APP_ROOT = Pathname.new(File.expand_path('../../', __FILE__))

# require the controller(s)
Dir[APP_ROOT.join('app', 'controllers', '*.rb')].each { |file| require file }

# require the model(s)
Dir[APP_ROOT.join('app', 'models', '*.rb')].each { |file| require file }

# configure SkillInventoryApp settings
class SkillInventoryApp < Sinatra::Base
  set :method_override, true
  set :root, APP_ROOT.to_path
  set :views, File.join(SkillInventoryApp.root, "app", "views")
  set :public_folder, File.join(SkillInventoryApp.root, "app", "public")


 configure :test do
    set :database, File.join(SkillInventoryApp.root, "db", "skill_inventory_test.sqlite3")
    set :environment, :test
  end

  configure :development do
    set :database, File.join(SkillInventoryApp.root, "db", "skill_inventory.sqlite3")
    set :environment, :development
  end
end