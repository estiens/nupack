class Calculator
  
  attr_reader :order

  BASE_MARKUP_PERCENT = 0.05
  MARKUP_PER_WORKER = 0.012

  CATEGORIES = Hash.new(0)
  CATEGORIES.merge!('drugs' => 0.075, 'food' => 0.13, 'electronics' => 0.02)

  def initialize(order)
    @order = order
  end

  def total_with_markup
    (base_markup + worker_markup + category_markup).round(2)
  end

  private
  
  def base_markup
    @order.base_price + (@order.base_price * BASE_MARKUP_PERCENT)
  end

  def worker_markup
    (@order.num_workers * MARKUP_PER_WORKER) * base_markup
  end

  def category_markup
    ((CATEGORIES[@order.category]) * base_markup)
  end

end