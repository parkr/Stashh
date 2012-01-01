class CodeSnippet < ActiveRecord::Base
  validates_presence_of :name, :code, :lang
end
