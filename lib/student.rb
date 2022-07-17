# frozen_string_literal: true

class Student # :nodoc:
  attr_reader :name, :evaluations

  def initialize(name, evaluations)
    @name = name
    @evaluations = evaluations
  end

  def bad_student?
    @evaluations.values.any? { |estimation| estimation <= 3 }
  end
end
