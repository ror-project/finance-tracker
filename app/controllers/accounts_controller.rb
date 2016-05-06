class AccountsController < ApplicationController
  
  attr_accessor :account_array
  

  def new
   @account=Account.new
   @accounts=Account.where user_id: current_user     #This will fetch only the records of current user from Account Table
  end  
  

  def create
    @account=Account.create(account_params)            #Raisl 4 doesnt support params[:account]
    if @account.save 
      flash[:success]="Account : #{@account.account_number} is Added "
      redirect_to new_account_path 
    else
      render :partial => 'shared/error_messages', :formats => [:html]
   end  
  end
  
    def account_params
      params.require(:account).permit(:bank_name,:account_number, :account_type,:user_id,:start_balance)
    end
   

end
