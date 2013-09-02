class KarmaPoint < ActiveRecord::Base
  attr_accessible :user_id, :label, :value
  belongs_to :user

  validates :user, :presence => true
  validates :value, :numericality => {:only_integer => true, :greater_than_or_equal_to => 0}
  validates :label, :presence => true

  after_save :populate_karma_points_col
  after_destroy :populate_karma_points_col

  def populate_karma_points_col
    self.user.update_attribute(:karma_points_sum, self.user.total_karma)
  end

end
