require "credit_check"

describe CreditCheckRecheck do

  before { @credit_check = CreditCheckRecheck.new }

  describe ".validate" do
    context "given a valid number as string or integer" do
      it "returns true" do
        expect(@credit_check.validate("5541808923795240")).to be_truthy
        expect(@credit_check.validate(5541808923795240)).to be_truthy
      end
    end
    context "given an invalid number as string or integer" do
      it "returns false" do
        expect(@credit_check.validate("5541801923795240")).to be_falsey
        expect(@credit_check.validate(5541801923795240)).to be_falsey
      end
    end
    context "given a valid number string" do
      it "returns true" do
        expect(@credit_check.validate("5541808923795240")).to be_truthy
        expect(@credit_check.validate(5541808923795240)).to be_truthy
        expect(@credit_check.validate("4024007136512380")).to be_truthy
        expect(@credit_check.validate("6011797668867828")).to be_truthy
      end
    end
    context "given an invalid number" do
      it "returns false" do
        expect(@credit_check.validate("5541801923795240")).to be_falsey
        expect(@credit_check.validate("4024007106512380")).to be_falsey
        expect(@credit_check.validate("6011797668868728")).to be_falsey
      end
    end
    context "given a valid AmEx number" do
      it "returns true" do
        expect(@credit_check.validate("342804633855673")).to be_truthy
      end
    end
    context "given an invalid AmEx number" do
      it "returns false" do
        expect(@credit_check.validate("342801633855673")).to be_falsey
      end
    end
  end

  describe ".stringify_number" do
    context "given an Integer" do
      it "returns a string" do
        expect(@credit_check.stringify_number(123)).to eql("123")
      end
    end
  end

  describe ".reverse_number" do
    context "given a number string" do
      it "returns the string reversed" do
        expect(@credit_check.reverse_number("123")).to eql("321")
      end
    end
  end

  describe ".string_to_array_of_numbers" do
    context "given string containing numbers" do
      it "returns an array containing individual numbers" do
        expect(@credit_check.string_to_array_of_numbers("321")).to eql([3,2,1])
      end
    end
  end

  describe ".double_even_places" do
    context "given an array of numbers" do
      it "returns the number with every other digit doubled" do
        expect(@credit_check.double_even_places([3,2,1])).to eql([3,4,1])
      end
    end
  end

  describe ".add_large_numbers" do
    context "given a number" do
      it "returns two digit numbers with their digits added together" do
        expect(@credit_check.add_large_numbers(1)).to eql(1)
        expect(@credit_check.add_large_numbers(13)).to eql(4)
      end
    end
  end

  describe ".collect_final_numbers" do
    context "given array of numbers" do
      it "returns an array with the big ones doubled" do
        expect(@credit_check.collect_final_numbers([3,14,1,16])).to eql([3,5,1,7])
      end
    end
  end
end
