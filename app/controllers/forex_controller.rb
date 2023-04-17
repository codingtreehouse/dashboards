class ForexController < ApplicationController
require "open-uri"
require "json"

def first_currency
  
  currency_url = "https://api.exchangerate.host/symbols"
  currency_read = URI.open(currency_url).read
  currency_parse = JSON.parse(currency_read)
  @currencies = currency_parse.fetch("symbols").keys

  render({:template => "layouts/step_one.html.erb"})
end

def second_currency
  @currency = params.fetch("currency")
  
  currency_url = "https://api.exchangerate.host/symbols"
  currency_read = URI.open(currency_url).read
  currency_parse = JSON.parse(currency_read)
  @currencies = currency_parse.fetch("symbols").keys

  render({:template => "layouts/step_two.html.erb"})
end

def convert

  @start_currency = params.fetch("start_currency")
  @end_currency = params.fetch("end_currency")

  fx_url = "https://api.exchangerate.host/convert?from=#{@start_currency}&to=#{@end_currency}"

  fx_read = URI.open(fx_url).read

  fx_parse = JSON.parse(fx_read)

  @fx_rate = fx_parse.fetch("info").fetch("rate")

  render({:template => "layouts/forex_results.html.erb"})

end
end
