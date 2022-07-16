class StudentCollection
  def initialize(array_students)
    @data = array_students
  end

  def percent_bad_students
    percent = (@data.count(&:bad_student?).to_f / @data.count) * 100
    percent.round(1)
  end

  def average_scores
    result = String.new

    self.subjects.map do |subject|
      total_scores = @data.inject(0) { |sum, student| sum + student.evaluations[subject].to_i }
      avg_scores = (total_scores.to_f / @data.size).round(1)
      result << "#{subject}: #{avg_scores}, "
    end

    result.delete_suffix(', ')
  end

  private

  def subjects
    @data.each_with_object([]) do |student, arr|
      arr << student.evaluations.keys
    end.uniq.flatten
  end
end
