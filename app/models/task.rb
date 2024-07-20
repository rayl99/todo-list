class Task < ApplicationRecord

  enum priority: {
    high: 1,
    medium: 2,
    low: 3
  }

  before_destroy :check_if_completed, prepend: true

  private

  def check_if_completed
    unless completed?
      errors.add(:base, "Cannot destroy a task that is not completed")
      throw(:abort)
    end
  end
end
