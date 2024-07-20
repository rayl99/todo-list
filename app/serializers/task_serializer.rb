class TaskSerializer < ActiveModel::Serializer
  attributes :id, :title, :subtitle, :due_date, :priority, :completed, :created_at, :updated_at
end
