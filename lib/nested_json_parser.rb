class NestedJsonParser < JsonParser
  def parse
    students = Hash.new { |h, k| h[k] = {} }

    @data.each do |subject, info|
      info.each do |line|
        students[line['student']].merge!({ "#{subject}" => line['grade'] })
      end
    end

    result = students.map { |arr| Student.new(arr[0], arr[1])}
  end
end
