class Magazine < ActiveRecord::Base
  has_many :subscriptions 
  has_many :readers, through: :subscriptions

  def email_list
    self.readers.map { |reader| reader.email }.join(";")
    #Magazine.first.email_list
  end

  def self.most_popular
    self.all.max_by { |magazine| magazine.subscriptions.count }
    # self.all.sort { |a,b| a.subscriptions.length <=> b.subscriptions.length }.last
    #Magazine.most_popular
  end
end