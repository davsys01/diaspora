class Author
  include MongoMapper::Document

  key :service, String
  key :feed_url, String
  key :avatar_thumbnail, String
  key :username, String
  key :profile_url, String

  many :ostatus_posts, :class_name => 'OstatusPost', :foreign_key => :author_id
  

  def self.instantiate(opts)
    author = Author.first(:feed_url => opts[:feed_url])
    author ||= Author.create(opts)
  end
 end
