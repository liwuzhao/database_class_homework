class PeopleController < ApplicationController

  before_action :find_person, only: [:edit, :update, :destroy]

  def index
    @people = Person.all.includes(:category).page params[:page]
    @all_people_count = Person.all.count
    # 按人员类别分类
    if params[:category].present?
      @category = Category.find(params[:category])
      @people = @people.where(:category => @category)
    end



    # 按 年龄/来院时间 排序
    @people = case params[:order]
      when "按年龄降序排序"
        @people.order("age DESC").page params[:page]
      when "按年龄升序排序"
        @people.order("age ASC").page params[:page]
      when "按来院时间降序排序"
        @people.order("come_university_time DESC")
      when "按年龄升序排序"
        @people.order("come_university_time ASC")
      else
        @people
    end

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

  def search
    @people = Person.where("number = ? OR name = ?", params[:search_message], params[:search_message]).page params[:page]

    render file: 'people/index'
  end

  private

  def find_person
    @person = Person.find_by_number(params[:id])
  end

  def person_params
    params.require(:person).permit!
  end



end
