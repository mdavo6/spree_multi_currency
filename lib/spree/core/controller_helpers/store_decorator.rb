Spree::Core::ControllerHelpers::Store.class_eval do
  def current_currency
    # ensure session currency is supported
    #
    # This decorator has been added as when a user registers current_currency is called.
    if session.key?(:currency) && supported_currencies.map(&:iso_code).include?(session[:currency])
      session[:currency]
    else
      Spree::Config[:currency]
    end
  end
end
