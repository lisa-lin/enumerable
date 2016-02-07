require_relative 'spec_helper'

describe Enumerable do
    let(:test_arr) { [] }
  
    before :each do
        @array = [1, 2, 3, 4]
    end

    describe "#my_each" do
        context "without block" do
            it "returns self" do
                expect(@array.my_each).to eq(@array)
            end
        end
        
        context "with block" do
            it "passes each element to the given block" do
                @array.my_each { |e| test_arr << e * 2 }
                expect(test_arr).to eq([2, 4, 6, 8])
            end
        end
        
        context "with empty array" do
            it "returns empty array" do
                test_arr = [].my_each
                expect(test_arr).to eq([])
            end
        end
    end
    
    describe "my_select" do
        context "with block" do
            it "passes each element to the given block" do
                test_arr = @array.my_select { |e| true }
                expect(test_arr).to eq(@array)
            end
            it "returns elements that satisfy condition in block" do
                test_arr = @array.my_select { |e| e % 2 == 0 }
                expect(test_arr).to eq([2, 4])
            end
        end
        
        context "without block" do
            it "returns self" do
                expect(@array.my_select).to eq(@array)
            end
        end
    end
    
    describe "my_map" do
        context "with block" do 
            it "passes elements into block and returns a new array with changes" do
                expect(@array.my_map { |e| e + 1 }).to eq([2, 3, 4, 5])
            end
        end
    end
end