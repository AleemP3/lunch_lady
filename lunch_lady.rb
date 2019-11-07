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
  def initialize
    @main = ["Steak", "Salmon"]
    @side = ["Vegatables", "Mash Potatoes", "French Fries"]
    @meal = [] 
  end 
end 

class Lunch_lady < Food 
  def initialize 
    puts "Welcome to Lunch_Lady, What would you like?"
    order 
  end 

  def main_dish

  end

  def side_dish

  end

  def order
    menu = Menu.new 
    menu.menu 

    choice = gets.to_i 

    case choice 
      when 1 
        main_dish
        puts "Please select 2"
      else 
        exit
      end
  end

end

Lunch_lady.new 