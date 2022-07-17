# frozen_string_literal: true

class JsonParser # :nodoc:
  def initialize(path)
    @data = JSON.parse(File.read(path))
  end
end
