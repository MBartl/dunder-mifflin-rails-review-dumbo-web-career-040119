class DogsController < ApplicationController

  def index
    @dogs = Dog.all
  end

  def show
    @dog = Dog.find(params[:id])
    @owners = Employee.all.select{|person| person.dog.id == @dog.id}
  end
end
