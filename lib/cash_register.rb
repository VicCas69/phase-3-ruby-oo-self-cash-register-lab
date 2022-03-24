require 'pry'
class CashRegister
    attr_accessor :total, :discount, :listItems, :title, :price
    #attr_reader :discount
    #@listItems= []

    def initialize(discount = 0)
        @total= 0
        @discount= discount
        @title= []
        @price=[]
    end

    def add_item title, price, qty = 1
        #oldTotal= @total
        #@price = price.to_f
        @price= @price << price
        qty.times{@title << title}
        @total= @total + (price*qty)         
    end
    

    def apply_discount
        if(@discount > 0)
            discAmount = @total/100 * @discount
            @total= @total - discAmount
            "After the discount, the total comes to $#{@total}."
        elsif @discount = 0
            "There is no discount to apply."
        end
    end
    
    def items
        @title
    end

    def void_last_transaction
        if @price.size == 1
            @total= 0.0
        elsif @price.size > 1
            @total= @total-@price[-1]
        end
    end

end

#binding.pry
cashier = CashRegister.new(20)
