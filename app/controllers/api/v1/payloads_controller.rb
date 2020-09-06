class Api::V1::PayloadsController < ApplicationController
skip_before_action :verify_authenticity_token

  def create

    if params[:id].present?
      payload = Payload.where(id: params[:id].to_i)
    end    
    unless payload.present?
      payload = Payload.new(payload_params)
    end

    payload.update_attributes(payload_params)
    payload.payments = params[:payments]
    payload.order_items = params[:order_items] 

    if payload.save
      parsed_payload = PayloadParserService.new.parse_payload_data(payload)

      response = DeliveryCenterApiService.new.perform(parsed_payload)
      if response.code == 200
        render json: {status: 'SUCCESS', message: "Delivery completed, confirmation code: #{response}", data: parsed_payload}, status: :ok
      else
        render json: {status: 'ERROR', message:'Error to process delivery', data: response}, status: :unprocessable_entity
      end
    else
      render json: {status: 'ERROR', message:'Error to save delivery', data: response}, status: :unprocessable_entity
    end
  end

  private

  def payload_params
    params.permit(:id, :store_id, :date_created, :date_closed, :last_updated, :total_amount, :total_shipping, 
    :total_amount_with_shipping, :paid_amount, :expiration_date, :total_shipping, :status, :payments, :order_items, shipping: {}, buyer: {})
  end

end
