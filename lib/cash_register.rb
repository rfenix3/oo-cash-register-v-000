require 'pry'

class CashRegister
  attr_accessor :total, :discount,  :items, :last_transaction
  
  
  def initialize(discount = 0)
    @total = 0
    @discount = discount
    @items = []
  end
  
  def add_item(item, price, qty = 1)
    @last_transaction = qty*price
    while qty > 0 do
      @total = @total + price
      @items << item
      qty = qty - 1
    end
  end
  
  def apply_discount
    if @discount != 0
      @total = @total*(1 - @discount.to_f/100)
      rounded = @total.round
      "After the discount, the total comes to $#{rounded}."
    else
      "There is no discount to apply."
    end
  end
  
  def items
    @items
  end
  
  def void_last_transaction
    @total = @total - @last_transaction
  end
  
end