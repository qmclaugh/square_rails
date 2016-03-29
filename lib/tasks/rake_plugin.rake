namespace :square_rails do
  desc "Prep initializer for square_rails."
  task :init do
    print "Copy the default square_rails_init.rb to the application config/initializers folder?(y/n): "
    option = STDIN.gets.strip

    case option
       when /[^Yy]/
         abort_message
    end

    gem_root = Gem.loaded_specs['square_rails'].full_gem_path
    gem_lib = File.join(gem_root, 'lib/tasks')

    puts "Copying..."
    cp gem_lib + '/square_rails_init.rb', Rails.root.to_s + '/config/initializers', verbose: false 
    puts "Done."
  end
end