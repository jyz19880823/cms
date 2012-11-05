class Post < ActiveRecord::Base
  # include Mongoid::Document
  # field :name, type: String
  # field :title, type: String
  # field :content, type: String
  # field :user_id, type: Integer

    attr_accessible :name, :content, :title
end
