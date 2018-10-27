class Survivor < ApplicationRecord
   
    after_save  :check_abduction
	after_update :check_abduction
    
    def check_abduction
		reports = Survivor.find(self.id).abduction_reports
        survivor = Survivor.find(self.id)

        if reports >= 3 
        	survivor.update_column(:abducted, "true")          
		end		
    end
    
    def situation
		total_survivors = Survivor.count
		total_abducted = Survivor.where('abducted = true').count		
		total_non_abducted = total_survivors - total_abducted
		perc_abducted = (total_abducted*100)/total_survivors
		per_non_abducted = (total_non_abducted*100)/total_survivors
		puts "Percentage of non-abducted survivors: #{per_non_abducted}%"
		puts "Percentage of abducted survivors: #{perc_abducted}%"
	end
end
