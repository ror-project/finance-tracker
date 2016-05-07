require 'test_helper'

class ExpenseTrackersControllerTest < ActionController::TestCase
  setup do
    @expense_tracker = expense_trackers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:expense_trackers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create expense_tracker" do
    assert_difference('ExpenseTracker.count') do
      post :create, expense_tracker: { gas: @expense_tracker.gas, grocery: @expense_tracker.grocery, income: @expense_tracker.income, month: @expense_tracker.month, mortgage: @expense_tracker.mortgage, notes: @expense_tracker.notes, other: @expense_tracker.other, restaurant: @expense_tracker.restaurant, shopping: @expense_tracker.shopping, utilities: @expense_tracker.utilities, year: @expense_tracker.year }
    end

    assert_redirected_to expense_tracker_path(assigns(:expense_tracker))
  end

  test "should show expense_tracker" do
    get :show, id: @expense_tracker
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @expense_tracker
    assert_response :success
  end

  test "should update expense_tracker" do
    patch :update, id: @expense_tracker, expense_tracker: { gas: @expense_tracker.gas, grocery: @expense_tracker.grocery, income: @expense_tracker.income, month: @expense_tracker.month, mortgage: @expense_tracker.mortgage, notes: @expense_tracker.notes, other: @expense_tracker.other, restaurant: @expense_tracker.restaurant, shopping: @expense_tracker.shopping, utilities: @expense_tracker.utilities, year: @expense_tracker.year }
    assert_redirected_to expense_tracker_path(assigns(:expense_tracker))
  end

  test "should destroy expense_tracker" do
    assert_difference('ExpenseTracker.count', -1) do
      delete :destroy, id: @expense_tracker
    end

    assert_redirected_to expense_trackers_path
  end
end
