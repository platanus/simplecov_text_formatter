require "spec_helper"

describe SimpleCovTextFormatter::SourceFileFormatter do
  let(:line) do
    instance_double(
      "SimpleCov::SourceFile::Line",
      coverage: 0,
      line_number: 1
    )
  end

  let(:lines) do
    [
      line
    ]
  end

  let(:source_file) do
    instance_double(
      "SimpleCov::SourceFile",
      filename: "file.rb",
      lines: lines
    )
  end

  def format
    described_class.new(source_file).format
  end

  let(:expected_lines) do
    [
      "file.rb:1:1: Not covered lines: 1"
    ]
  end

  it { expect(format).to eq(expected_lines) }

  context "with no lines" do
    let(:lines) do
      []
    end

    let(:expected_lines) do
      []
    end

    it { expect(format).to eq(expected_lines) }
  end

  context "with two consecutive lines" do
    let(:line2) do
      instance_double(
        "SimpleCov::SourceFile::Line",
        coverage: 0,
        line_number: 2
      )
    end

    let(:lines) do
      [
        line,
        line2
      ]
    end

    let(:expected_lines) do
      [
        "file.rb:1:1: Not covered lines: 1 and 2"
      ]
    end

    it { expect(format).to eq(expected_lines) }
  end

  context "with two not consecutive lines" do
    let(:line2) do
      instance_double(
        "SimpleCov::SourceFile::Line",
        coverage: 0,
        line_number: 4
      )
    end

    let(:lines) do
      [
        line,
        line2
      ]
    end

    let(:expected_lines) do
      [
        "file.rb:1:1: Not covered lines: 1",
        "file.rb:4:1: Not covered lines: 4"
      ]
    end

    it { expect(format).to eq(expected_lines) }
  end

  context "with two near not consecutive lines" do
    let(:line2) do
      instance_double(
        "SimpleCov::SourceFile::Line",
        coverage: 0,
        line_number: 3
      )
    end

    let(:lines) do
      [
        line,
        line2
      ]
    end

    let(:expected_lines) do
      [
        "file.rb:1:1: Not covered lines: 1 and 3"
      ]
    end

    it { expect(format).to eq(expected_lines) }
  end

  context "with more than two consecutive lines" do
    let(:line2) do
      instance_double(
        "SimpleCov::SourceFile::Line",
        coverage: 0,
        line_number: 2
      )
    end

    let(:line3) do
      instance_double(
        "SimpleCov::SourceFile::Line",
        coverage: 0,
        line_number: 3
      )
    end

    let(:lines) do
      [
        line,
        line2,
        line3
      ]
    end

    let(:expected_lines) do
      [
        "file.rb:1:1: Not covered lines: 1 to 3"
      ]
    end

    it { expect(format).to eq(expected_lines) }
  end
end
