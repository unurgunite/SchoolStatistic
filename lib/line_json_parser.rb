# frozen_string_literal: true

class LineJsonParser < JsonParser # :nodoc:
  ABBREVIATION = {
    math: 'mathematics',
    rus: 'russian_language',
    phys: 'physics'
  }.freeze

  def parse
    @data.map do |line|
      name = line['name']

      evaluations = ABBREVIATION.each_with_object({}) do |(abb, full), h|
        h[full] = line[abb.to_s]
      end
      Student.new(name, evaluations)
    end
  end
end
