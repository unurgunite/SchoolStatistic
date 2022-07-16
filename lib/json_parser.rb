class JsonParser
  def initialize(path)
    @data = JSON.parse(File.read(path))
  end
end
