class Api::V1::CompaniesController < ApplicationController
  before_action :set_company, only: [:show, :update, :destroy]

  def index
    @companies=Company.all
    render json: { companies: @companies }, except: [:id, :created_at, :updated_at]
  end

  def show
    render json: @company
  end

  def create
    @company = Company.new(company_params)
    if @company.save
      render json: @company.as_json, status: :created
    else
      render json: {user: @company.errors, status: :no_content}
    end
  end

  def update
    if @company.update(company_params)
      render json: @company
    else
      render json: @company.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @company.destroy

  end
  private
  def delete_company
    @company.update(deleted: true)
  end

  def mark_deleted #destroy
    # company = Company.find(params[:company_id]) # 1-й вариант маршрута
    company = Company.find(params[:id])

    if company.deleted
      puts "deleted: "
      render json: { deleted_company: [],
                     deleted_already: :not_modified,
      }
    else
      company.delete_company	# model method
      render json: { deleted_company: @company,
                     code: 200,
                     status: :success,
      }, except: [:created_at, :updated_at]
    end
  end

  def set_company
    @company = Company.find(params[:id])
  end

  def company_params
    params.permit(:name, :location, :deleted)
  end
end
