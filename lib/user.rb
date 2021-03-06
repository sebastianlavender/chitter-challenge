require 'data_mapper'

class User
  include DataMapper::Resource

  property :id, Serial
  property :username, String
  property :password, String

  has n, :peeps

end

DataMapper.finalize
