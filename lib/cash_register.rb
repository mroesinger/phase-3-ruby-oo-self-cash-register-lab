require 'pry'

class CashRegister
    attr_accessor :discount, :total, :last_price
    attr_reader :items

    def initialize(discount = 0)
        @discount = discount
        @total = 0
        @items = []
    end

    def add_item (title, price, quantity = 1)
        @last_price = price*quantity
        @total += price*quantity
        quantity.times {@items << title}
    end

    def apply_discount
        if self.discount != 0
            @total = @total - (@total * @discount) / 100
            "After the discount, the total comes to $#{@total.to_i}."
            else
            "There is no discount to apply."
        end
    end

    def void_last_transaction
        @total -= @last_price
    end
end