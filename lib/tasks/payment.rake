namespace :payment do
  desc "TODO"
  task :update => :environment do
    service_id = ENV["service_id"]
    line_item_id = ENV["line_item_id"]
    body = ENV["body"]
    
    p = Payment.find_by_service_id_and_line_item_id(service_id, line_item_id)
    ## if the payment has not seen
    if p.nil?
      
      begin
        s = Service.find(service_id)
        p = Payment.new
        p.line_item_id = line_item_id
      
        ######### Old code ###########
        p.body = body      
        ##############################
            
        s.payments << p
      
        puts "A new payment with service_id = #{service_id} and line_item_id = #{line_item_id} has been created."

      rescue
        puts "No such service!"        
      end
      
    ## if the payment has already seen
    else
      ######### Old code ###########
      p.body = body    
      ##############################
            
      if p.changed?
        p.save! 
        puts "The payment with service_id = #{service_id} and line_item_id = #{line_item_id} has been updated."
      end                
    end
  end

end
