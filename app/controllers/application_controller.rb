class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :set_locale

  def set_locale
    I18n.locale = params[:locale] || extract_locale_from_accept_language_header
  end

  def default_url_options(options={})
    { locale: I18n.locale }
  end

  private

  def extract_locale_from_accept_language_header
    default_lang = :en

    lang_request = request.env['HTTP_ACCEPT_LANGUAGE']
    if lang_request.nil?
      default_lang
    else
      locale = lang_request.scan(/^[a-z]{2}/).first.to_sym
      (I18n.available_locales.include? locale) ? locale : default_lang
    end
  end

end
