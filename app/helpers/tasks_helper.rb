module TasksHelper
  def priority_label(priority)
    case priority
    when 1
      "High Priority"
    when 2
      "Medium Priority"
    when 3
      "Low Priority"
    else
      "Unknown Priority"
    end
  end

  def priority_class(priority)
    case priority
    when 1
      "high-priority"
    when 2
      "medium-priority"
    when 3
      "low-priority"
    else
      ""
    end
  end
end
