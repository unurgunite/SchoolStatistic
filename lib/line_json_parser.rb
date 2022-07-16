class LineJsonParser < JsonParser
  ABBREVIATION = {
    'math': 'mathematics',
    'rus': 'russian_language',
    'phys': 'physics'
  }.freeze

  def parse  
    students = @data.map do |line|
      name = line['name']

      evaluations = ABBREVIATION.each_with_object({}) do |(abb, full), h| 
        h[full] = line[abb.to_s]
      end
      Student.new(name, evaluations)
    end

    return students
  end
end
