# frozen_string_literal: true

require 'json'
require 'active_support/core_ext/string/inflections'
require 'rexml/document'

require_relative 'json_parser'
require_relative 'line_json_parser'
require_relative 'nested_json_parser'
require_relative 'raw_xml_parser'
require_relative 'student'
require_relative 'student_collection'

class Parser # :nodoc:
  PARSERS = JSON.parse(File.read("#{__dir__}/../config/config.json"))
                .transform_values { |raw_class| "#{raw_class}_parser".camelize.constantize }

  def self.parse(path)
    file_name = File.basename path
    PARSERS[file_name].new(path).parse
  end
end
