require 'simplecov_text_formatter/version'
require 'simplecov_text_formatter/source_file_formatter'
require 'simplecov_text_formatter/result_formatter'
require 'simplecov_text_formatter/result_exporter'

module SimpleCov
  module Formatter
    class TextFormatter
      def format(result)
        formatted_result = format_result(result)
        export_formatted_result(formatted_result)
        puts(output_message(result))
      end

      private

      def format_result(result)
        SimpleCovTextFormatter::ResultFormatter.new(result).format
      end

      def export_formatted_result(formatted_result)
        SimpleCovTextFormatter::ResultExporter.new(formatted_result).export
      end

      def output_message(result)
        <<~MSG
          Text Coverage report generated for #{result.command_name} to #{SimpleCov.coverage_path}.
          #{result.covered_lines} / #{result.total_lines} LOC (#{result.covered_percent.round(2)}%) covered.
        MSG
      end
    end
  end
end
