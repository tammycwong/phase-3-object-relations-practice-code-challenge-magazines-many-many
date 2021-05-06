class Reader < ActiveRecord::Base
    has_many :subscriptions
    has_many :magazines, through: :subscriptions

    def subscribe(magazine, price)
        Subscription.create(magazine_id: magazine.id, reader_id: self.id, price: price )
    end
    #Reader.first.subscribe(Magazine.first, 100)
    
    def total_subscription_price
        self.subscriptions.sum(:price)
        #Reader.first.total_subscription_price
    end

    def cancel_subscription(magazine)
    #    cancel_sub = subscription.find_by(magazine_id: magazine.id, reader_id: self.id)
    #     cancel_sub.destroy
        self.subscriptions.find_by(magazine_id: magazine.id).destroy
        #r1 = Reader.find(3)
        #m1 = Magazine.find(2)
        #r1 = cancel_subscription(m1)
        #Subscription.first
    end
end