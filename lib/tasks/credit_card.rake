namespace :credit_card do
  desc "TODO"
  task :check => :environment do
    number = ENV["number"]
    if number.to_s.split('').last == check_digit(number.to_s.chop.to_i).to_s
      puts "The number is possibly valid"
    else
      puts "The number is invalid"
    end     
  end

  desc "Return original number of number inputed"
  task :export => :environment do
    number = ENV["number"]  
    puts number.to_s + check_digit(number).to_s 
  end
  
  def check_digit(number)    
    sum = 0
    place = 0
    number.to_s.split("").reverse_each do |e|  
      place = place + 1    
      e_i = e.to_i
      if place % 2 == 1
               
        if e_i * 2 > 9          
          sum = sum + (e_i*2).to_s.split('').first.to_i + (e_i*2).to_s.split('').last.to_i
        else
          sum = sum + e_i * 2
        end             
      else
        sum = sum + e_i
      end       
    end
    return 10 - sum.to_s.split('').last.to_i    
  end

end
