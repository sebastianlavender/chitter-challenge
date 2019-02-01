require 'data_mapper'
require 'pg'

def database_setup
  if ENV['ENVIRONMENT'] == 'test'
    DataMapper.setup(:default, 'postgres://sebastianlavender@/chitter_test')
  else
    DataMapper.setup(:default, 'postgres://sebastianlavender@/chitter')
  end
end

def setup_test_database
  p "Setting up test database..."
  DataMapper.setup(:default, 'postgres://sebastianlavender@/chitter_test')
  DataMapper.auto_migrate!
end
