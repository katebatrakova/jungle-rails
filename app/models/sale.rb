class Sale < ActiveRecord::Base

#Active Record scope
def self.active
  where("sales.starts_on<=? AND sales.ends_on>=?", Date.current, Date.current).any?
end

  def finished?
    self.ends_on < Date.current
  end

  def upcoming?
    starts_on > Date.current
  end

  def active?
    !upcoming? && !finished?
  end

end
