require_relative "spec_helper"

describe Order do 
  let (:order1) {Order.new(1000,3,"food")}
  let (:order2) {Order.new(2000,4)}
  
  it "should have a base price" do
    expect(order1.base_price).to eq(1000)
    expect(order2.base_price).to eq(2000)
  end

  it "should have a number of workers associated with it" do
    expect(order1.num_workers).to eq(3)
    expect(order2.num_workers).to eq(4)
  end

  it "should have a category" do
    expect(order1.category).to eq("food")
    expect(order2.category).to eq("")
  end

  it "should raise an error with an invalid price" do
    expect{ Order.new("foo",3) }.to raise_error
  end

  it "should raise an error with an invalid number of workers" do
    expect { Order.new(1,0) }.to raise_error
  end

  it "should not raise an error if a category is not passed in" do
    expect { Order.new(1,1)}.to_not raise_error  
  end

end 

describe Calculator do
  let (:calcx) {Calculator.new(Order.new(1000.00,2,"food"))   }
  let (:calc1) {Calculator.new(Order.new(1299.99,3,"food"))   }
  let (:calc2) {Calculator.new(Order.new(5432.00,1,"drugs"))  }
  let (:calc3) {Calculator.new(Order.new(12456.95,4,"books")) }

  it "calculates total markup for input 1" do
    expect(calc1.total_with_markup).to eq(1591.58)
  end

  it "calculates total markup for order 2" do
    expect(calc2.total_with_markup).to eq(6199.81)
  end

  it "calculates total markup for order 3" do
    expect(calc3.total_with_markup).to eq(13707.63)
  end

 # tests cover private methods, now tested through our public method
  
  # it "calculates the first (base) markup of our order" do
  #   expect(calcx.base_markup).to eq(1050.00)
  # end

  # it "calculates the worker markup of our order (already marked up with base markup)" do
  #   expect(calcx.worker_markup).to eq(25.2)
  # end

  # it "calculates the category markup of our order" do
  #   expect(calcx.category_markup).to eq(136.5)
  # end

end

describe OrderParser do
  let (:parser) {OrderParser.new("./data/input_test.csv")}

  it "should create the proper number of orders" do
    parser.parse_data
    expect(parser.order_array.count).to eq(3)
  end

  it "should get the proper price" do
    parser.parse_data
    expect(parser.order_array[0].base_price).to eq(1299.99)
  end

  it "should get the proper number of workers" do
    parser.parse_data
    expect(parser.order_array[0].num_workers).to eq(3)
  end

  it "should get the category" do
    parser.parse_data
    expect(parser.order_array[0].category).to eq("food")
  end


end