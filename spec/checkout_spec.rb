require 'checkout'

RSpec.describe Checkout do
  it "should return -1 if any non CAP letter is passed" do
    expect(subject.checkout('aBc')).to eq -1
  end

  it "should return the total of the cost if CAP letters are passed" do
    expect(subject.checkout('AA')).to eq 100
  end

  it "should return -1 for an integer" do
    expect(subject.checkout(18)).to eq -1
  end

  it "should return -1 if a string contains a number and/or non CAP letter" do
    expect(subject.checkout('-B8x')).to eq -1
  end

  it "should return the sum of different items" do
    expect(subject.checkout('ABCD')).to eq 115
  end

  it "should calculate the discounts for 3xA" do
    expect(subject.checkout("AAA")).to eq 130
  end

  it "should calculate the discounts for multiple 3xA" do
    expect(subject.checkout("AAAAAA")).to eq 260
  end

  it "should calculate the discounts for 2xB" do
    expect(subject.checkout("BB")).to eq 45
  end

  it "should return -1 for an integer in the string" do
    expect(subject.checkout('A8C')).to eq -1
  end
end
