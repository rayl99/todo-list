# frozen_string_literal: true

class TasksFinder
  def initialize(params)
    @params = params
  end

  def execute
    items = init_collection

    items = by_title(items)
    items = by_priority(items)
    by_date(items)
  end

  private

  attr_reader :params

  def init_collection
    Task.all
  end

  def by_title(items)
    return items unless params[:title]
    items.where("title LIKE ?", "%#{params[:title]}%")
  end

  def by_priority(items)
    return items unless params[:priority]
    items.where(priority: ::Task.priorities[params[:priority]])
  end

  def by_date(items)
    return items unless params[:date]
    items.where("due_date < ?", params[:date])
  end
end
