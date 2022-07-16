require_relative './lib/parser'


array_students = Dir["#{__dir__}/data/*"].select { |f| File.file? f }.map { |e| Parser.parse e }

collection = StudentCollection.new(array_students.flatten)

puts "Average Scores:"
puts collection.average_scores
puts
puts "Bad-learning students percentage: #{collection.percent_bad_students}%"
