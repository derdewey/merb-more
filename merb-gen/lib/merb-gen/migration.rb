module Merb::Generators
  
  class MigrationGenerator < ComponentGenerator

    def self.source_root
      File.join(super, 'migration')
    end
    
    desc <<-DESC
      This is a migration generator
    DESC
    
    option :orm, :desc => 'Object-Relation Mapper to use (one of: none, activerecord, datamapper, sequel)'
    option :model, :as => :boolean, :desc => 'Specify this option to generate a migration which creates a table for the provided model'
    
    first_argument :name, :required => true
    second_argument :attributes, :as => :hash, :default => {}
    
    template :migration_activerecord, :orm => :activerecord do
      source('activerecord/schema/migrations/%file_name%.rb')
      destination("schema/migrations/#{file_name}.rb")
    end
    
    template :migration_datamapper, :orm => :datamapper do
      source('datamapper/schema/migrations/%file_name%.rb')
      destination("schema/migrations/#{file_name}.rb")
    end
    
    template :migration_sequel, :orm => :sequel do
      source('sequel/schema/migrations/%file_name%.rb')
      destination("schema/migrations/#{file_name}.rb")
    end
    
    def table_name
      self.name.snake_case.pluralize
    end
    
    def class_name
      self.name.camel_case
    end
    
    def file_name
      "#{version}_#{self.name.snake_case}"
    end
    
    def version
      # TODO: handle ActiveRecord timestamped migrations
      format("%03d", current_migration_nr + 1)
    end

    protected
    
    def destination_directory
      File.join(destination_root, 'schema', 'migrations')
    end
    
    def current_migration_nr
      current_migration_number = Dir["#{destination_directory}/*"].map{|f| File.basename(f).match(/^(\d+)/)[0].to_i  }.max.to_i
    end
    
  end
  
  add :migration, MigrationGenerator
  
end