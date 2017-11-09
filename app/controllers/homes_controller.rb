class HomesController < ApplicationController
  before_action :redirect_to_dashboard_if_sign_in 
  def show
      render
  end
end
