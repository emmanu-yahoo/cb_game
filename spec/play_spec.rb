require 'spec_helper'
require_relative '../play'


RSpec.describe "get_bulls_cows" do
  context "when the guess has all correct digits" do
    it "returns [4, 0]" do
      expect(get_bulls_cows(SECRET_NUMBER, 5362)).to eq([4, 0])
    end
  end

  context "when the guess has all correct digits but in a different order" do
    it "returns [0, 4]" do
      expect(get_bulls_cows(SECRET_NUMBER, 3265)).to eq([1, 3])
    end
  end

  context "when the guess has one correct digit in the correct position and three correct digits in the wrong position" do
    it "returns [1, 3]" do
      expect(get_bulls_cows(SECRET_NUMBER, 5623)).to eq([1, 3])
    end
  end

  context "when the guess has one correct digit in the correct position and no other correct digits" do
    it "returns [1, 0]" do
      expect(get_bulls_cows(SECRET_NUMBER, 5000)).to eq([1, 0])
    end
  end

  context "when the guess has two correct digits in the correct position and one correct digit in the wrong position" do
    it "returns [2, 1]" do
      expect(get_bulls_cows(SECRET_NUMBER, 5316)).to eq([2, 1])
    end
  end

  context "when the guess has no correct digits" do
    it "returns [0, 0]" do
      expect(get_bulls_cows(SECRET_NUMBER, 1234)).to eq([0, 2])
    end
  end
end
