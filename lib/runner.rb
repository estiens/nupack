require_relative "order.rb"
require_relative "order_parser.rb"
require_relative "calculator.rb"

class Runner
  INPUT_FILE_STRING = "./data/input_test.csv"
  attr_accessor :orders, :output_array 

  def initialize
    @output_array=[]
  end

  def run
    @orders=OrderParser.new(INPUT_FILE_STRING).parse_data
    @orders.each_with_index do |order, index|
      calc=Calculator.new(order)
      @output_array << "Output #{index}: $#{calc.total_with_markup}"
    end
    puts @output_array
  end
end

Runner.new.run
