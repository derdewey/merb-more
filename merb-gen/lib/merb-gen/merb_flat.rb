module Merb::Generators
  
  class MerbFlatGenerator < ApplicationGenerator
    
    def self.source_root
      File.join(super, 'merb_flat')
    end
    
    desc <<-DESC
      This generates a flat merb application: all code but config files and
      templates fits in one application. This is something in between Sinatra
      and "regular" Merb application.
    DESC
    
    first_argument :name, :required => true, :desc => "Application name"
    
    glob!

    def app_name
      self.name.snake_case
    end
    
    def destination_root
      File.join(@destination_root, app_name)
    end
    
  end
  
  add_private :app_flat, MerbFlatGenerator
  
end