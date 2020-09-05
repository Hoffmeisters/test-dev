class DeliveryCenterApiWorker
  include Sidekiq::Worker

  def perform(order_body)
    begin
      response = RestClient.post(
        DelieveryCenterUrlHelper.url,
        order_body,
        content_type: :json
      )
      response.code == 200
      response.code
    rescue RestClient::ExceptionWithResponse => e
      e.response
    end
  end
end