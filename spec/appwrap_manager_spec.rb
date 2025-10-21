# frozen_string_literal: true

RSpec.describe AppwrapManager do
  it "has a version number" do
    expect(AppwrapManager::VERSION).not_to be nil
  end

  it "has the correct version" do
    expect(AppwrapManager::VERSION).to eq("0.1.0")
  end

  describe "module structure" do
    it "defines an Error class" do
      expect(AppwrapManager::Error).to be < StandardError
    end
  end
end

