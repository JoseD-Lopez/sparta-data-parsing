require 'spec_helper'

describe 'Testing the exchange rates' do

    before(:all) do
      @exchange_rates = ParseJson.new('json_exchange_rates.json')
    end

    it 'Should be a Hash' do
      expect(@exchange_rates.json_file).to be_a Hash
    end

    it 'should contain the base as EUR' do
      expect(@exchange_rates.get_base_value).to eq 'EUR'       #SAME AS EACH OTHER
      # expect(@exchange_rates.json_file).to include 'base' => 'EUR'
    end

    it "Should have a date string" do
      expect(@exchange_rates.get_date_value).to be(String)
      # expect(@exchange_rates.json_file).to include 'date'
    end


    it "should countain 31 rates" do
      expect(@exchange_rates.number_of_rate_keys).to eq 31

      # @key_num = 0
      # @value_num = 0
      # @exchange_rates.json_file["rates"].each do |k, v|
      # @key_num += 1
      # @value_num += 1
    end

    it "should all rates should be Floats" do
      @exchange_rates.get_rates.each do |k, v| #k is a place holder
        expect(v).to be_a(Float)
    end

  end

end