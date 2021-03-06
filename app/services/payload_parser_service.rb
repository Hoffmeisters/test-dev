class PayloadParserService
  def parse_payload_data(payload)
    {
      externalCode: payload['id'].to_s,
      storeId: payload['store_id'],
      subTotal: payload['total_amount'].to_s,
      deliveryFee: payload['total_shipping'].to_s,
      total_shipping: payload['total_shipping'].to_s,
      total: payload['total_amount_with_shipping'].to_s,
      country: payload['shipping']['receiver_address']['country']['id'],
      state: 'SP', #payload['shipping]['receiver_address']['state']['name'] -- should parse state fullname to state initials?
      city: payload['shipping']['receiver_address']['city']['name'],
      district: payload['shipping']['receiver_address']['neighborhood']['name'],
      street: payload['shipping']['receiver_address']['street_name'],
      complement: 'galpao', #maybe??? payload['shipping]['receiver_address']['comment'].present? ? payload['shipping]['receiver_address']['comment'] : 'galpao',
      latitude: payload['shipping']['receiver_address']['latitude'],
      longitude:  payload['shipping']['receiver_address']['longitude'],
      dtOrderCreate: payload['date_created'],
      postalCode: payload['shipping']['receiver_address']['zip_code'],
      number: payload['shipping']['receiver_address']['street_number'],
      customer: {
          externalCode: payload['buyer']['id'].to_s,
          name: payload['buyer']['nickname'],
          email: payload['buyer']['email'],
          contact: "#{payload['buyer']['phone']['area_code']}#{payload['buyer']['phone']['number']}"
      },
      items: parse_order_items(payload),
      payments: parse_payments(payload)
    }
  end

  private 

  def parse_payments(payload)
    payments_array = []
    payload['payments'].each do |single_payload|
      payments_array << 
      {
        type: single_payload['payment_type'],
        value: single_payload['total_paid_amount']
      }
    end
    payments_array
  end
  
  def parse_order_items(payload)
    order_items_array = []
    payload['order_items'].each do |single_payload|
      order_items_array << 
      {
        externalCode: single_payload['item']['id'],
        name: single_payload['item']['title'],
        price: single_payload['unit_price'],
        quantity: single_payload['quantity'],
        total: single_payload['full_unit_price'],
        subItems: []
      }
    end
    order_items_array
  end
end