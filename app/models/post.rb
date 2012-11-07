class Post < ActiveRecord::Base
  # include Mongoid::Document
  # field :name, type: String
  # field :title, type: String
  # field :content, type: String
  # field :user_id, type: Integer

    attr_accessible :name, :content, :title, :tag_list
    acts_as_ordered_taggable

    before_save :init_yue , :init_permalink

    def init_yue
    		self.content.gsub!(/jaw crusher/,"<a href='' title=''>jaw crusher</a>")
    end

    def to_param
       permalink
    end

    def init_permalink
       self.permalink = self.name.parameterize
    end
end
