class ConvertsController < ApplicationController

  def index
    @unix_time = UnixTime.new
  end

  def result
    unix_time = params.require(:unix_time).permit(:unix_time_value)
    @unix_time = UnixTime.new(unix_time)
  end

end
