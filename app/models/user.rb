class User < ActiveRecord::Base
  has_many :karma_points
  validates :first_name, :presence => true
  validates :last_name, :presence => true

  validates :username,
            :presence => true,
            :length => {:minimum => 2, :maximum => 32},
            :format => {:with => /^\w+$/},
            :uniqueness => {:case_sensitive => false}

  validates :email,
            :presence => true,
            :format => {:with => /^[\w+\-.]+@[a-z\d\-.]+\.[a-z]+$/i},
            :uniqueness => {:case_sensitive => false}
  attr_accessible :first_name, :last_name, :email, :username


  def self.by_karma
    self.order('karma_points_sum DESC')
  end

  def self.page(page_num )
     return self.limit(1000).offset(1000 * (page_num  - 1)) if page_num  > 0
     return self.limit(1000)
  end

  def total_karma
    self.karma_points.sum(:value)
  end

  def full_name
    "#{first_name} #{last_name}"
  end
end
