module SimpleCovTextFormatter
  class SourceFileFormatter
    NOT_COVERED_LINE_CODE = 0
    VALID_MSG_PARTS_COUNT = 4
    FILE_COLUMN = 1

    def initialize(source_file)
      @source_file = source_file
    end

    def format
      not_covered_lines_in_batches.map do |batch|
        build_message(batch)
      end.reject(&:nil?)
    end

    private

    def build_message(batch)
      message_parts = build_message_parts(batch)
      return unless message_parts.count == VALID_MSG_PARTS_COUNT
      return if full_coverage?

      message_parts.join(":")
    end

    def build_message_parts(batch)
      [
        @source_file.filename,
        batch.first.to_s,
        FILE_COLUMN.to_s,
        " Not covered lines: #{build_error_text(batch)}"
      ].reject(&:nil?)
    end

    def build_error_text(batch)
      case batch.count
      when 1
        batch.first
      when 2
        "#{batch.first} and #{batch.last}"
      else
        "#{batch.first} to #{batch.last}"
      end
    end

    def not_covered_lines_in_batches
      line_numbers = not_covered_lines.map(&:line_number).sort
      batches = []
      current_batch = []

      line_numbers.each_with_index do |line_number, index|
        current_batch << line_number

        if !near_lines?(line_number, line_numbers[index + 1])
          batches << current_batch
          current_batch = []
        end
      end

      batches
    end

    def near_lines?(line, next_line)
      [*line..line + 2].include?(next_line)
    end

    def full_coverage?
      covered_percentage.to_i == 100
    end

    def covered_percentage
      @covered_percentage ||= (covered_lines.count.to_f / valid_lines.count * 100).round(2)
    end

    def covered_lines
      @covered_lines ||= lines.select { |l| l.coverage && l.coverage > NOT_COVERED_LINE_CODE }
    end

    def not_covered_lines
      @not_covered_lines ||= lines.select { |l| l.coverage == NOT_COVERED_LINE_CODE }
    end

    def valid_lines
      @valid_lines ||= lines.reject { |l| l.coverage.nil? }
    end

    def lines
      @lines ||= @source_file.lines
    end
  end
end
