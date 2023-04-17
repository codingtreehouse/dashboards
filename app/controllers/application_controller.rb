class ApplicationController < ActionController::Base
require "open-uri"
require "json"

def convert

  @start_currency = params.fetch("start_currency")
  @end_currency = params.fetch("end_currency")

  @convert = URI.open("https://api.exchangerate.host/convert?from=#{@start_currency}&to=#{@end_currency}")



  render({:template => "layouts/forex.html.erb"})

end


end
