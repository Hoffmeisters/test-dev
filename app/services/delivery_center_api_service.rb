class DeliveryCenterApiService

  def perform(params)
    begin
      response = RestClient.post(
        DeliveryCenterUrlHelper.url,
        params.to_json,
        content_type: :json
      )
      response.code == 200
      response
    rescue RestClient::ExceptionWithResponse => e
      e.response
    end
  end
end