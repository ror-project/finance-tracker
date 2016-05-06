require 'test_helper'

class AccountsControllerTest < ActionController::TestCase
  
 def setup
  @account=Account.new(bank_name:"",account_number:"DE44 5001 0517 5407 3249 31",account_type:"checking",start_balance:23456)
 end   
 
 test  "bank name should not be blank" do
   assert_not @account.valid?
 end   
end
