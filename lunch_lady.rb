#lunch lady assignment 
require "pry"
require "colorize"

class Menu
  def menu 
    puts "1) Create your meal"
    puts "2) "
    puts "3) Exit" 
  end 
end

class Food 
  attr_accessor :main, :side

  def initialize
    @main = ["Steak", "Salmon"]
    @side = ["Vegatables", "Mash Potatoes", "French Fries"]
    
  end 
end 

class Customer 

  attr_accessor :meal
  def initialize
    @meal = [] 
  end 
end 

class Lunch_lady < Food 
  def initialize
    @food = Food.new 
    @customer = Customer.new 
    puts "Welcome to Lunch_Lady"
    order 
  end 

  def create_meal
    puts "Select a Main Dish"
    @food.main.each_with_index { |food, index|
      puts "#{index + 1}) #{food}" }
    
    selection = gets.to_i 

    case selection 
      when 1 
        @customer.meal << @food.main[selection - 1]
        side_dish
      when 2
        @customer.meal << @food.main[selection - 1]
        side_dish
      else
        puts "invalid option"
        create_meal
    end 
  end

  def side_dish
    puts "Select 2 side dishes"
    @food.side.each_with_index { |food, index|
    puts "#{index + 1}) #{food}" }

    @second = gets.to_i 

    case @second 
      when 1 
        @customer.meal << @food.side[@second - 1]
        @food.side.delete_at(@second - 1)
        second_choice
      when 2
        @customer.meal << @food.side[@second - 1]
        @food.side.delete_at(@second - 1)
        second_choice
      when 3
        @customer.meal << @food.side[@second - 1]
        @food.side.delete_at(@second - 1)
        second_choice
      else
        puts "invalid option"
        side_dish 
    end 

  end

  def second_choice 
    puts "Please select another option"
    @food.side.each_with_index { |food, index|
    puts "#{index + 1}) #{food}" }

    second_choice = gets.to_i 

    case second_choice
      when 1
        @customer.meal << @food.side[second_choice - 1]
        total
      when 2
        @customer.meal << @food.side[second_choice - 1]
        total
      else 
        puts "Invalid Choice"
      end 
  end 

  def total
    @customer.meal.each do |lunch|
      puts "You will be having.. #{lunch}" 
    end
      puts "A total of... #{@customer.meal.length} items"
  end 

  def order
    menu = Menu.new 
    menu.menu 

    choice = gets.to_i 

    case choice 
      when 1 
        create_meal
      else 
        exit
      end
  end
end 

Lunch_lady.new 