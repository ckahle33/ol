class Api::V1::BusinessesController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, :with => :not_found

  def index
    page_number = params[:page_number].to_i || 1
    businesses = {
      :businesses => Business.page( page_number || 1).per(50),
      :next_url => api_v1_businesses_path(:page_number => (page_number + 1))
    }
    if businesses
      render :json => businesses
    else
      render :json => {:errors => "Couldn't render businesses"}, :status => 404
    end
  end

  def show
    business = Business.find(params[:id])
    render :json => business.to_json
  end

  def not_found
    render :json => {:error => "A record with that ID doesn't exist."}, :status => 404
  end

end
