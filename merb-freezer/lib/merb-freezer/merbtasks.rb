<<<<<<< HEAD:merb-freezer/lib/merb-freezer/merbtasks.rb
namespace :merb_freezer do
  desc "Do something for merb-freezer"
  task :default do
    puts "merb-freezer doesn't do anything"
=======
require File.dirname(__FILE__) + "/../merb-freezer"

task :freeze => Freezer.components.keys.map { |component| "freeze:#{component}" }
namespace :freeze do
  Freezer.components.each do |component, git_repository|
    desc "Freeze merb-#{component} from #{git_repository} or rubygems - use UPDATE=true to update a frozen component. By default this task uses git submodules. To freeze the latest gems versions use MODE=rubygems"
    task component do
      Freezer.freeze(component, ENV["UPDATE"], ENV["MODE"])
    end
>>>>>>> new_merb_gen:merb-freezer/lib/merb-freezer/merbtasks.rb
  end
<<<<<<< HEAD:merb-freezer/lib/merb-freezer/merbtasks.rb
end
=======
end

namespace :freeze do
  
  desc "freeze a gem locally. Usage: rake freeze:gem GEM=git://github.com/myobie/merb_paginate.git "
  task :gem do
    raise "Please specify the gem you want to freeze using GEM=git://github.com/myobie/merb_paginate.git or GEM=merbful_authentication" unless ENV["GEM"]
    Freezer.freeze(ENV["GEM"], ENV["UPDATE"], ENV["MODE"])
  end
  
  desc "freeze all merb components (core, more, plugins) - use MODE=rubgygems and UPDATE=true as in regular freezing tasks"
  task :all do
    ['core', 'more', 'plugins'].each do |component|
      Freezer.freeze(component, ENV["UPDATE"], ENV["MODE"])
    end
  end
  
end
>>>>>>> new_merb_gen:merb-freezer/lib/merb-freezer/merbtasks.rb
