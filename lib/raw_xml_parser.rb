# frozen_string_literal: true

class RawXmlParser # :nodoc:
  include REXML

  ABBREVIATION = {
    math: 'mathematics',
    rus: 'russian_language',
    phys: 'physics'
  }.freeze

  def initialize(path)
    @data = Document.new(File.open(path))
  end

  def parse
    students = []
    @data.each_element('//row') do |student|
      name = student.elements.find('//name').first.text

      scores = {}
      student.each_element('grades') do |grade|
        subject = grade.elements['subject'].text
        full_subject = ABBREVIATION[subject.to_sym]

        score = grade.elements['score'].text

        scores.merge!({ full_subject: score.to_i })
      end

      students << Student.new(name, scores)
    end

    students
  end
end
