# frozen_string_literal: true

class NestedJsonParser < JsonParser # :nodoc:
  def parse
    students = Hash.new { |h, k| h[k] = {} }

    @data.each do |subject, info|
      info.each do |line|
        students[line['student']].merge!({ subject.to_s => line['grade'] })
      end
    end

    students.map { |arr| Student.new(arr[0], arr[1]) }
  end
end
