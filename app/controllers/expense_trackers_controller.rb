class ExpenseTrackersController < ApplicationController
  before_action :set_expense_tracker, only: [:show, :edit, :update, :destroy]

  # GET /expense_trackers
  # GET /expense_trackers.json
  def index
    @expense_trackers = ExpenseTracker.all
    
    #Create a hash to keep track of total expenses per month
    #Keys for this hash will be "Month- value specified from form"
    @total_expense = Hash.new
    @savings = Hash.new
    
    #Loop through each row in expense tracker (per month)
    @expense_trackers.each do |expense_tracker|
      @total_expense[expense_tracker.month] = 0
      if(expense_tracker.grocery != NIL)
        @total_expense[expense_tracker.month] += expense_tracker.grocery
      end
      if(expense_tracker.mortgage != NIL)
        @total_expense[expense_tracker.month] += expense_tracker.mortgage
      end
      if(expense_tracker.gas != NIL)
        @total_expense[expense_tracker.month] += expense_tracker.gas
      end
      if(expense_tracker.shopping != NIL)
        @total_expense[expense_tracker.month] += expense_tracker.shopping
      end
      if(expense_tracker.restaurant != NIL)
        @total_expense[expense_tracker.month] += expense_tracker.restaurant
      end
      if(expense_tracker.utilities != NIL)
        @total_expense[expense_tracker.month] += expense_tracker.utilities
      end
      if(expense_tracker.other != NIL)
        @total_expense[expense_tracker.month] += expense_tracker.other
      end
      @savings[expense_tracker.month] = expense_tracker.income - @total_expense[expense_tracker.month]
    end
    
  end

  # GET /expense_trackers/1
  # GET /expense_trackers/1.json
  def show
  end

  # GET /expense_trackers/new
  def new
    @expense_tracker = ExpenseTracker.new
  end

  # GET /expense_trackers/1/edit
  def edit
  end

  # POST /expense_trackers
  # POST /expense_trackers.json
  def create
    @expense_tracker = ExpenseTracker.new(expense_tracker_params)

    respond_to do |format|
      if @expense_tracker.save
        format.html { redirect_to @expense_tracker, notice: 'Expense tracker was successfully created.' }
        format.json { render :show, status: :created, location: @expense_tracker }
      else
        format.html { render :new }
        format.json { render json: @expense_tracker.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /expense_trackers/1
  # PATCH/PUT /expense_trackers/1.json
  def update
    respond_to do |format|
      if @expense_tracker.update(expense_tracker_params)
        format.html { redirect_to @expense_tracker, notice: 'Expense tracker was successfully updated.' }
        format.json { render :show, status: :ok, location: @expense_tracker }
      else
        format.html { render :edit }
        format.json { render json: @expense_tracker.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /expense_trackers/1
  # DELETE /expense_trackers/1.json
  def destroy
    @expense_tracker.destroy
    respond_to do |format|
      format.html { redirect_to expense_trackers_url, notice: 'Expense tracker was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_expense_tracker
      @expense_tracker = ExpenseTracker.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def expense_tracker_params
      params.require(:expense_tracker).permit(:year, :month, :income, :grocery, :mortgage, :gas, :shopping, :restaurant, :utilities, :other, :notes)
    end
end
