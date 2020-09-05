# frozen_string_literal: true

require 'rails_helper'
require 'spec_helper'

RSpec.describe DeliveryCenterApiWorker do
  describe 'when api is called' do
    it 'responds with 200' do
      #Note that im validating with the json file itself just to make sure the input is correct
      file = File.read('storage/payload.json')
      order_body = JSON.parse(file)  
      parse_payload = PayloadParserService.new
      parsed_payload = parse_payload.parse_payload_data(order_body)
      response = DeliveryCenterApiWorker.new.perform(parsed_payload)
      expect(response.code).to(eq(200))
    end
  end
end