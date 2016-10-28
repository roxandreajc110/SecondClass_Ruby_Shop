@products = nil
@products_characteristics = nil
@shopping_car = nil
user_character = nil

def init
  @products = ["Negan",
    "Glen Eating Pizza",
    "Glen eye out of his head",
    "Abraham",
    "Homero Jay Simpson",
    "Maggie Simpson",
    "Moe",
    "Angry Moe",
    "Jhon Snow",
    "Tyrion",
    "Eleven",
    "El Chavo",
    "Don Ramon",
    "Chompiraz"
  ]
@products_characteristics = {}
  @products.each_with_index do | p , i |
    @products_characteristics[p] = {
      cost: 10,
      color: "undefined",
      index_product: i
    }
  end
  @shopping_car = {}
end

def print_welcome_msj
  puts "Costume Store #########################"
  puts '#######################################'
  puts '#######################################'
  puts "Please, type the name of your character"
  gets.chomp.downcase
end

def find_costumes
  index = 0
  matched_index = []
  until index >= @products.length
    if @products[index].downcase.include? @user_character
      puts "your costume is! cha chan!!! : # #{index}. #{@products[index]}"
      matched_index << index
    end
    index += 1
  end
  matched_index
end

def check_an_as (param)
  if param.include? @user_character
    puts "you choose : #{@products[@user_character]}"
    puts "do you want to buy it. It cost #{@products_characteristics[@products[@user_character]][:cost]} lukas perro ?? (yes/no)"
    if gets.chomp.downcase == "yes"
      @shopping_car[@products[@user_character]] = "purchased"
    end
  else
    puts "That costume does not exist !!"
  end
end

def select_your_order (matched_index)
  if matched_index.any?
    @user_character = -1
    until matched_index.include? @user_character
      puts "please select your costume! "
      @user_character = gets.chomp.to_i
      check_an_as matched_index
    end
  else
    puts "We did not find you costume, Sooorryyy! :("
  end
end

def print_shopping_car
  puts "Your Shopping car: " if @shopping_car.any?
  puts @shopping_car if @shopping_car.any?
end

init
while @user_character != "exit"
  @user_character = print_welcome_msj
  break if @user_character == "exit"
  matched_index = find_costumes
  select_your_order matched_index
  print_shopping_car
end
