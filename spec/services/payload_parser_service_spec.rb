# frozen_string_literal: true

require 'rails_helper'
require 'spec_helper'

RSpec.describe PayloadParserService do
  describe 'receive json' do
    it 'parse json for delivery center api' do
      payload_file = File.read('storage/payload.json')
      payload_body = JSON.parse(payload_file)  
      parse_payload = PayloadParserService.new
      parsed_payload = parse_payload.parse_payload_data(payload_body)

      processing_file = File.read('storage/processing.json')
      processing_body = JSON.parse(processing_file)  
      parsed_payload = JSON.parse(parsed_payload.to_json)
      
      expect(parsed_payload).to  eq(processing_body)
    end
  end
end
