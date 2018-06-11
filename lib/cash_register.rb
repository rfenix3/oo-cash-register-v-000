require 'pry'

class CashRegister
  attr_accessor :total, :discount,  :items, :last_item, :last_qty, :last_price
  
  
  def initialize(discount = 0)
    @total = 0
    @discount = discount
    @items = []
  end
  
  def add_item(item, price, qty = 1)
    @last_item = item
    @last_price = price
    @last_qty = qty
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
    self.items.pop
    @total = @total - @last_price
  end
  
end