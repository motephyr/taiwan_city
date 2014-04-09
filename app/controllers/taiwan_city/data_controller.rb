require_dependency "china_city/application_controller"

module TaiwanCity
  class DataController < ApplicationController
    def show
      data = TaiwanCity.list(params[:id])
      render json: data, layout: nil
    end

    def index
    end
  end
end
