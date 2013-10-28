require 'CSV'

class OrderParser

  attr_reader :file_string
  attr_accessor :order_array
  
  def initialize(file_string)    
    @order_array = []
    @file_string = file_string
  end

  def parse_data
    data=CSV.open file_string, :headers => true
    
    data.each do |row|
      base_price = parse_price(row[1])
      num_workers = parse_workers(row[2])
      category = row[3]
      @order_array << Order.new(base_price,num_workers,category)
    end
    @order_array
  end

  private

  def parse_price(string)
    string.gsub("$","").gsub(",","")
  end

  def parse_workers(string)
    string[0,string.index(" ")].to_i
  end

end