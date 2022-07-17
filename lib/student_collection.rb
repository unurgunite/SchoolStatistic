# frozen_string_literal: false

class StudentCollection # :nodoc:
  def initialize(array_students)
    @data = array_students
  end

  def percent_bad_students
    percent = (@data.count(&:bad_student?).to_f / @data.count) * 100
    percent.round(1)
  end

  def print_avg_scores
    average_scores.reduce('') { |str, (k, v)| str << "#{k}: #{v}, " }.delete_suffix(', ')
  end

  private

  def subjects
    @data.each_with_object([]) do |student, arr|
      arr << student.evaluations.keys
    end.uniq.flatten
  end

  def average_scores
    subjects.each_with_object({}) do |subject, hash|
      total_scores = @data.inject(0) { |sum, student| sum + student.evaluations[subject].to_i }
      avg_scores = (total_scores.to_f / @data.size).round(1)
      hash[subject] = avg_scores
    end
  end
end
