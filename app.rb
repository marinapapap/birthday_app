require 'sinatra/base'
require 'sinatra/reloader'
require_relative 'lib/convert_month_repo'


class Application < Sinatra::Base

  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    erb(:homepage)
  end

  post '/bday_info' do

    time = Time.new
    @name = params[:name]

    @day = params[:day].to_i
    @month_text = params[:month]

    @month = ConvertMonth.new(params[:month]).convert

    if @day == time.day && @month == time.month
      erb(:today)
    elsif @day != time.day && @month == time.month && (@day - time.day).positive?
      @day_dif = @day - time.day
      erb(:soon)
    else
      erb(:name)
    end
  end

end