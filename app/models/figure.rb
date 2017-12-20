class Figure < ActiveRecord::Base
  has_many :figure_titles
  has_many :titles, through: :figure_titles
  has_many :landmarks

  def slug
    if self.name
      self.name.downcase.gsub(/[ .]/, "-")
    end
  end

  def self.find_by_slug(name)
    self.all.detect do |object|
      object.slug == name
    end
  end
end
