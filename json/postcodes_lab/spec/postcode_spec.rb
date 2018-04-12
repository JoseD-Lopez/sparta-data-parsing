require 'spec_helper'

describe Postcodesio do

  context 'requesting information on a single postcode works correctly' do

    before(:all) do
      @postcodesio = Postcodesio.new
      @response = @postcodesio.get_single_postcode('b691ja') #input a postcode
    end

    it "should respond with a status message of 200" do
      expect(@response['status']).to eq 200

    end

    it "should have a results hash" do
      expect(@response).to be_a Hash
    end

    it "should return a postcode between 5-7 in length"  do
      expect(@response['result']['postcode'].length).to be_between(5, 7)
    end

    it "should return an quality key integer between 1-9" do
      expect(@response['result']['quality']).to be_kind_of(Integer)
      expect(@response['result']['quality']).to be_between(1, 9)
    end

    it "should return an ordnance survey eastings value as integer" do
      expect(@response['result']['eastings']).to be_kind_of(Integer)
    end

    it "should return an ordnance survey northings value as integer" do
      expect(@response['result']['northings']).to be_kind_of(Integer)
    end

    it "should return a country which is one of the four constituent countries of the UK" do
      expect(@response['result']['country']).to eq 'England'
    end

    it "should return a string value for NHS authority " do
      expect(@response['result']['nhs_ha']).to be_a String
    end

    it "should return a longitude float value" do
      expect(@response['result']['longitude']).to be_kind_of Float
    end

    it "should return a latitude float value" do
      expect(@response['result']['latitude']).to be_kind_of Float
    end

    it "should return a parliamentary constituency string" do
      expect(@response['result']['parliamentary_constituency']).to be_a String
    end

    it "should return a european_electoral_region string" do
      expect(@response['result']['european_electoral_region']).to be_a String
    end

    it "should return a primary_care_trust string" do
      expect(@response['result']['primary_care_trust']).to be_a String
    end

    it "should return a region string" do
      expect(@response['result']['region']).to be_a String
    end

    it "should return a parish string" do
      expect(@response['result']['parish']).to be_a String
    end

    it "should return a lsoa string" do
      expect(@response['result']['lsoa']).to be_a String
    end

    it "should return a msoa string" do
      expect(@response['result']['msoa']).to be_a String
    end
    # admin ward and county are not documented however tested below

    it "should return a admin_district string" do
      expect(@response['result']['admin_district']).to be_a String
    end

    it "should return a incode string of three characters" do
      expect(@response['result']['incode']).to be_a String
    end

    it "should return a msoa string" do
      expect(@response['result']['msoa']).to be_a String
    end

    it "should return a incode string of 3-4 characters" do
      expect(@response['result']['incode']).to be_a String
      expect(@response['result']['incode'].length).to be_between(3, 4)
    end
  end

  context "multiple postcodes validation" do

    before(:all) do
      @postcodesio = Postcodesio.new
      @response = @postcodesio.get_multiple_postcodes(['B69 1JA', 'EN5 2RH'])
      @first_result = @response['result'][0]['result']
      @second_result = @response['result'][1]['result']
    end

    it "should respond with a status message of 200" do
      expect(@response['status']).to eq 200
      p @response
    end

    it "should return the first query as the first postcode in the response" do
      expect(@first_result['postcode']).to eq @response['result'][0]['query']
    end

    it "should return the second query as the second postcode in the response" do
      expect(@second_result['postcode']).to eq @response['result'][1]['query']
    end

    it "should have a results hash" do
      expect(@response).to be_a Hash
    end

    it "should return a postcode between 5-7 in length"  do
      expect(@response['result'][0]['result']['postcode'].length).to be_between(5, 7)
    end

    it "should return an quality key integer between 1-9" do
      expect(@response['result'][0]['result']['quality']).to be_kind_of(Integer)
      expect(@response['result'][0]['result']['quality']).to be_between(1, 9)
    end

    it "should return an ordnance survey eastings value as integer" do
      expect(@response['result'][0]['result']['eastings']).to be_kind_of(Integer)
    end

    it "should return an ordnance survey northings value as integer" do
      expect(@response['result'][0]['result']['northings']).to be_kind_of(Integer)
    end

    it "should return a country which is one of the four constituent countries of the UK" do
      expect(@response['result'][0]['result']['country']).to eq 'England'
    end

    it "should return a string value for NHS authority " do
      expect(@response['result'][0]['result']['nhs_ha']).to be_a String
    end

    it "should return a longitude float value" do
      expect(@response['result'][0]['result']['longitude']).to be_kind_of Float
    end

    it "should return a latitude float value" do
      expect(@response['result'][0]['result']['latitude']).to be_kind_of Float
    end

    it "should return a parliamentary constituency string" do
      expect(@response['result'][0]['result']['parliamentary_constituency']).to be_kind_of String
    end

    it "should return a european_electoral_region string" do
      expect(@response['result'][0]['result']['european_electoral_region']).to be_kind_of String
    end

    it "should return a primary_care_trust string" do
      expect(@response['result'][0]['result']['primary_care_trust']).to be_kind_of String
    end

    it "should return a region string" do
      expect(@response['result'][0]['result']['region']).to be_a String
    end

    it "should return a parish string" do
      expect(@response['result'][0]['result']['parish']).to be_a String
    end

    it "should return a lsoa string" do
      expect(@response['result'][0]['result']['lsoa']).to be_a String
    end

    it "should return a msoa string" do
      expect(@response['result'][0]['result']['msoa']).to be_a String
    end
    # admin ward and county are not documented however tested below

    it "should return a admin_district string" do
      expect(@response['result'][0]['result']['admin_district']).to be_a String
    end

    it "should return a incode string of three characters" do
      expect(@response['result'][0]['result']['incode']).to be_a String
    end

    it "should return a msoa string" do
      expect(@response['result'][0]['result']['msoa']).to be_a String
    end

    it "should return a incode string of 3-4 characters" do
      expect(@response['result'][0]['result']['incode']).to be_a String
      expect(@response['result'][0]['result']['incode'].length).to be_between(3, 4)
    end

    it "should have a results hash" do
      expect(@response).to be_a Hash
    end

    it "should return a postcode between 5-7 in length"  do
      expect(@response['result'][1]['result']['postcode'].length).to be_between(5, 7)
    end

    it "should return an quality key integer between 1-9" do
      expect(@response['result'][1]['result']['quality']).to be_kind_of(Integer)
      expect(@response['result'][1]['result']['quality']).to be_between(1, 9)
    end

    it "should return an ordnance survey eastings value as integer" do
      expect(@response['result'][1]['result']['eastings']).to be_kind_of(Integer)
    end

    it "should return an ordnance survey northings value as integer" do
      expect(@response['result'][1]['result']['northings']).to be_kind_of(Integer)
    end

    it "should return a country which is one of the four constituent countries of the UK" do
      expect(@response['result'][1]['result']['country']).to eq 'England'
    end

    it "should return a string value for NHS authority " do
      expect(@response['result'][1]['result']['nhs_ha']).to be_a String
    end

    it "should return a longitude float value" do
      expect(@response['result'][1]['result']['longitude']).to be_kind_of Float
    end

    it "should return a latitude float value" do
      expect(@response['result'][1]['result']['latitude']).to be_kind_of Float
    end

    it "should return a parliamentary constituency string" do
      expect(@response['result'][1]['result']['parliamentary_constituency']).to be_kind_of String
    end

    it "should return a european_electoral_region string" do
      expect(@response['result'][1]['result']['european_electoral_region']).to be_kind_of String
    end

    it "should return a primary_care_trust string" do
      expect(@response['result'][1]['result']['primary_care_trust']).to be_kind_of String
    end

    it "should return a region string" do
      expect(@response['result'][1]['result']['region']).to be_a String
    end

    it "should return a parish string" do
      expect(@response['result'][1]['result']['parish']).to be_a String
    end

    it "should return a lsoa string" do
      expect(@response['result'][1]['result']['lsoa']).to be_a String
    end

    it "should return a msoa string" do
      expect(@response['result'][1]['result']['msoa']).to be_a String
    end
    # admin ward and county are not documented however tested below

    it "should return a admin_district string" do
      expect(@response['result'][1]['result']['admin_district']).to be_a String
    end

    it "should return a incode string of three characters" do
      expect(@response['result'][1]['result']['incode']).to be_a String
    end

    it "should return a msoa string" do
      expect(@response['result'][1]['result']['msoa']).to be_a String
    end

    it "should return a incode string of 3-4 characters" do
      expect(@response['result'][1]['result']['incode']).to be_a String
      expect(@response['result'][1]['result']['incode'].length).to be_between(3, 4)
    end

  end


end
