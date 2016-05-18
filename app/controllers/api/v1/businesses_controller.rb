class Api::V1::BusinessesController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, :with => :not_found

  def index
    page_number = params[:page_number]
    next_page_number = page_number ? page_number.to_i + 1 : 2
    businesses = {
      :businesses => Business.page( page_number ).per(50),
      :next_url => api_v1_businesses_path(:page_number => next_page_number)
    }
    if businesses
      render :json => businesses, :status => 200
    else
      render :json => {:error => "Couldn't render businesses"}, :status => 404
    end
  end

  def show
    business = Business.find(params[:id])
    render :json => business.to_json, :status => 200
  end

  def not_found
    render :json => {:error => "The page or business ID requested doesn't exist."}, :status => 404
  end

end
