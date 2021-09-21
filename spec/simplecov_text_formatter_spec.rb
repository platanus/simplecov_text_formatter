require "spec_helper"

describe SimpleCov::Formatter::TextFormatter do
  let(:result) do
    double(
      command_name: "X",
      covered_lines: 1,
      total_lines: 10,
      covered_percent: 10
    )
  end

  let(:result_formatter) do
    double(format: true)
  end

  let(:result_exporter) do
    double(export: true)
  end

  def format
    described_class.new.format(result)
  end

  before do
    allow(SimpleCovTextFormatter::ResultFormatter)
      .to receive(:new).and_return(result_formatter)

    allow(SimpleCovTextFormatter::ResultExporter)
      .to receive(:new).and_return(result_exporter)
  end

  it { expect(format).to eq(nil) }
end
