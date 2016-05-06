class Account < ActiveRecord::Base
    belongs_to :user
    
    validates :bank_name ,presence: true
    validates :start_balance,numericality: true
    validates :account_number,presence: true,length: {maximum: 34}
    validates :account_type,inclusion: { in: %w(checking saving card cash),message: "%{value} is not selected" } #%{value} is the value of selection
    validate :check_valid?
    
    
    def check_valid?
        if IBANTools::IBAN.valid?(account_number)
            true
        else
            false
            errors.add(:account_number, "is not valid.")
        end 
    end
 end    
  