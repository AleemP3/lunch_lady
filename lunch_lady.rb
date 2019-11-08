#lunch lady assignment 
require "pry"
require "colorize"

class Menu
  def menu 
    puts "1) Enter Money"
    puts "2) View Wallet"
    puts "3) Create your meal"
    puts "4) Exit" 
  end 
end


class Food 
  attr_accessor :main, :side

  def initialize
    @main = [
      { name:"Steak", cost: 100 }, 
      { name:"Salmon", cost: 150 }
    ]
    @side = [ 
     { name:"Vegatables", cost: 25 }, 
     { name:"Mash Potatoes", cost: 50 },
     { name:"French Fries", cost: 50 }
    ]
    
  end 
end 

class Customer 

  attr_accessor :meal, :cost 
  def initialize
    @meal = [] 
    @cost = []
  end 

end 

class Lunch_lady < Food 
  def initialize
    @food = Food.new 
    @customer = Customer.new 
    puts "Welcome to Lunch_Lady"
    order 
  end 

  def enter_money
    puts "enter how much money you have"
    money = gets.to_i
    if money < 100 
      puts "You too BROKE, GO GET A JOB"
    else 
      @customer.cost << money 
    end 
  end 

  def view_wallet
    @customer.cost.each do |cost|
      puts "You have $#{cost}"
    end 
  end

  def create_meal
    @total = []
    puts "Select a Main Dish"
    @food.main.each_with_index { |food, index|
      puts "#{index + 1}) #{food[:name]} #{food[:cost]}" }
    
    selection = gets.to_i 

    case selection 
      when 1 
        @customer.meal << @food.main[selection - 1]
        @total << @food.main[selection - 1][:cost]
        deduction(selection - 1)
        side_dish
      when 2
        @customer.meal << @food.main[selection - 1]
        @total << @food.main[selection - 1][:cost]
        deduction(selection - 1)
        side_dish
      else
        puts "invalid option"
        create_meal
      end 
  end

  def side_dish
    puts "Select 2 side dishes"
    @food.side.each_with_index { |food, index|
    puts "#{index + 1}) #{food[:name]} #{food[:cost]}" }

    second = gets.to_i 

    case second 
      when 1 
        @customer.meal << @food.side[second - 1]
        @total << @food.side[second - 1][:cost]
        deduction_side(second - 1)
        @food.side.delete_at(second - 1)
        second_choice
      when 2
        @customer.meal << @food.side[second - 1]
        @total << @food.side[second - 1][:cost]
        deduction_side(second - 1)
        @food.side.delete_at(second - 1)
        second_choice
      when 3
        @customer.meal << @food.side[second - 1]
        @total << @food.side[second - 1][:cost]
        deduction_side(second - 1)
        @food.side.delete_at(second - 1)
        second_choice
      else
        puts "invalid option"
        side_dish 
      end 

  end

  def second_choice 
    puts "Please select another option"
    @food.side.each_with_index { |food, index|
    puts "#{index + 1}) #{food[:name]} #{food[:cost]}" }

    second_choice = gets.to_i 

    case second_choice
      when 1
        @customer.meal << @food.side[second_choice - 1]
        @total << @food.side[second_choice - 1][:cost]
        deduction_side(second_choice - 1)
        total
      when 2
        @customer.meal << @food.side[second_choice - 1]
        @total << @food.side[second_choice - 1][:cost]
        deduction_side(second_choice - 1)
        total
      else 
        puts "Invalid Choice"
        second_choice
      end 
  end 

  def deduction(index)
    @customer.cost << @customer.cost.last - @food.main[index][:cost]
    puts "Your new total is.. #{@customer.cost.last}"
  end 

  def deduction_side(index)
    @customer.cost << @customer.cost.last - @food.side[index][:cost]
    puts "Your new total is.. #{@customer.cost.last}"
  end 

  def total
    @customer.meal.each do |lunch|
      puts "You will be having.. #{lunch[:name]}" 
    end
      puts "A total of... #{@customer.meal.length} items"
      puts "At the cost of... $#{@total.inject(:+)}"
  end 

  def order
    menu = Menu.new 
    menu.menu 

    choice = gets.to_i 

    case choice 
      when 1
        enter_money
        order 
      when 2
        view_wallet 
        order
      when 3 
        create_meal
      else 
        exit
      end
  end
end 
Lunch_lady.new 