 class Order

  attr_reader :base_price, :num_workers, :category

  def initialize(base_price, num_workers, category="")
    @base_price = base_price.to_f
    @num_workers = num_workers
    @category = category
    check_for_errors
  end

  private

  def check_for_errors
    unless (base_price.is_a? Integer) || (base_price.is_a? Float)
      raise ArgumentError, "Base Price must be a number"
    end
    raise ArgumentError, 'Base price must be > 0' unless base_price > 0.0
    raise ArgumentError, 'Number of workers cannot be less than 1' unless num_workers > 0
  end

end






