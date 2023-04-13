class Public::CustomersController < ApplicationController

  def show
    @customer = Customer.find(params[:id])
    @questions = Question.where(customer_id: @customer.id)
  end


end
