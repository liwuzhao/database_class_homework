class PeopleController < ApplicationController

  before_action :find_person, only: [:edit, :update, :destroy]

  def index
    @people = Person.all
  end

  def edit

  end

  def update
    if @person.update(person_params)
      redirect_to people_path
      flash[:notice] = "成功更新人员信息"
    else
      render "edit"
    end
  end

  def new
    @person = Person.new
  end

  def create
    @person = Person.new(person_params)

    if @person.save
      redirect_to people_path
      flash[:notice] = "成功添加新人员"
    else
      render "new"
    end

  end

  def destroy
    @person.destroy
    redirect_to people_path
    flash[:alert] = "成功删除人员"
  end

  private

  def find_person
    @person = Person.find_by_number(params[:id])
  end

  def person_params
    params.require(:person).permit!
  end

end
