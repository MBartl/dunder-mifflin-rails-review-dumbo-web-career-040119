class EmployeesController < ApplicationController

  def index
    @employees = Employee.all
  end

  def show
    find_employee
  end

  def new
    @employee = Employee.new
  end

  def create
    if @employee = Employee.create(employee_params)
      redirect_to @employee
    else
      render :new
    end
  end

  def edit
    find_employee
  end

  def update
    if find_employee.update(employee_params)
      redirect_to @employee
    else
      render :edit
    end
  end

  private
  def find_employee
    @employee = Employee.find(params[:id])
  end

  def employee_params
    params.require(:employee).permit(:first_name, :last_name, :alias, :title, :office, :img_url, :dog_id)
  end

end
