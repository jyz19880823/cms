class Post
  include Mongoid::Document
  field :name, type: String
  field :title, type: String
  field :content, type: String
  field :user_id, type: Integer
end
