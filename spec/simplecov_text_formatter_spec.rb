require "spec_helper"

describe SimplecovTextFormatter do
  before do
    helper_example
  end

  it "has a version number" do
    expect(SimplecovTextFormatter::VERSION).not_to be nil
  end

  it "does something useful" do
    expect(false).to eq(true)
  end
end
