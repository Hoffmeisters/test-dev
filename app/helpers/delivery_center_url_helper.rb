module DeliveryCenterUrlHelper
  def self.url
    if ENV["DELIVERY_CENTER_URL"].present?
      ENV["BACKOFFICE_URL"]
    elsif Rails.env.production?
      'https://delivery-center-recruitment-ap.herokuapp.com/'
    else
      'https://delivery-center-recruitment-ap.herokuapp.com/'
    end
  end
end
