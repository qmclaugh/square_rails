require 'square_rails'
require 'rails'
module RakePlugin
  class Railtie < Rails::Railtie
    railtie_name :rake_plugin

    rake_tasks do
      load "lib/tasks/rake_plugin.rake"
    end
  end
end