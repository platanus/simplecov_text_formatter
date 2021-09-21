module SimpleCovTextFormatter
  class ResultExporter
    FILENAME = 'coverage.txt'

    def initialize(errors_list)
      @result = errors_list
    end

    def export
      File.open(export_path, 'w') do |file|
        file << @result.join("\n")
      end
    end

    private

    def export_path
      File.join(SimpleCov.coverage_path, FILENAME)
    end
  end
end
