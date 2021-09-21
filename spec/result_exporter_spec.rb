require "spec_helper"

describe SimpleCovTextFormatter::ResultExporter do
  let(:coverage_file_path) { "./tmp/coverage.txt" }
  let(:errors_list) do
    %w{
      error1
      error2
    }
  end

  def coverage_file_content
    described_class.new(errors_list).export
    File.open(coverage_file_path).read
  end

  def delete_coverage_file
    FileUtils.rm(coverage_file_path)
  rescue Errno::ENOENT
    nil
  end

  before do
    delete_coverage_file
    allow(SimpleCov).to receive(:coverage_path).and_return("./tmp")
  end

  after { delete_coverage_file }

  it { expect(coverage_file_content).to eq("error1\nerror2") }
end
