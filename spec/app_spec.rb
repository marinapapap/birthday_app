require 'spec_helper'
require 'rack/test'
require_relative '../app'

RSpec.describe Application do

  include Rack::Test::Methods

  let(:app) { Application.new }

  context "GET /" do
    it "asks user for name and DOB" do
      response = get('/')

      expect(response.body).to include("<h1 class='header'>Hello there!</h1>")
    end
  end

  context "POST /" do
    it "wishes user happy birthday if their day and month match today" do
      response = post('/bday_info', name: "Marina", day: 30, month: "December")

      expect(response.body).to include("<h1> Happy Birthday Marina! </h1>")
    end
  end

end