class CategoriesController < ApplicationController

  before_action :find_root_categories, only: [:new, :create, :edit, :update]
  before_action :find_category, only: [:edit, :update, :destroy]

  def index
    if params[:id].blank?
      @categories = Category.roots
    else
      @category = Category.find(params[:id])
      @categories = @category.children
    end

    @categories = @categories.order(id: "desc")
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(categories_params)

    if @category.save
      flash[:notice] = "保存成功"
      redirect_to categories_path
    else
      render action: :new
    end
  end

  def edit

  end

  def update

    if @category.update(categories_params)
      flash[:notice] = "修改成功"
      redirect_to categories_path
    else
      render action: :edit
    end
  end

  def destroy
    if @category.destroy
      flash[:notice] = "删除成功"
      redirect_to categories_path
    else
      flash[:notice] = "删除失败"
      redirect_to :back
    end
  end

  private

  def find_root_categories
    @parent_categories = Category.all.each { |c| c.ancestry = c.ancestry.to_s + (c.ancestry != nil ? "/" : '') + c.id.to_s
      }.sort {|x,y| x.ancestry <=> y.ancestry
      }.map{ |c| ["-" * (c.depth - 1) + c.name,c.id]
      }.unshift(["-- none --", nil])
  end

  def find_category
    @category = Category.find(params[:id])
  end

  def categories_params
    params.require(:category).permit!
  end

end
