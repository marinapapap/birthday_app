require 'sinatra/base'
require 'sinatra/reloader'


class Application < Sinatra::Base

  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    erb(:homepage)
  end

  post '/bday_info' do
    months = {
      "January" => 1,
      "February" => 2,
      "March" => 3,
      "April" => 4,
      "May" => 5,
      "June" => 6,
      "July" => 7,
      "August" => 8,
      "September" => 9,
      "October" => 10,
      "November" => 11,
      "December" => 12
    }

    time = Time.new
    @name = params[:name]

    @day = params[:day]
    @month_text = params[:month]
    @month = months[params[:month]]

    if @day.to_i == time.day && @month == time.month
      erb(:today)
    else
      erb(:name)
    end
  end

end