module Merb::Generators
  
  class MerbPluginGenerator < ApplicationGenerator

    def self.source_root
      File.join(super, 'merb_plugin')
    end
    
    option :testing_framework, :default => :rspec, :desc => 'Testing framework to use (one of: spec, test_unit)'
    option :orm, :default => :none, :desc => 'Object-Relation Mapper to use (one of: none, activerecord, datamapper, sequel)'
    
    desc <<-DESC
      Merb plugin generator: lets you kick start your Merb plugin.
    DESC
    
    glob!
    
    first_argument :name, :required => true, :desc => "Plugin name"
    
    def base_name
      self.name.snake_case
    end
    
    def destination_root
      File.join(@destination_root, base_name)
    end
    
  end
  
  add :plugin, MerbPluginGenerator
  
end