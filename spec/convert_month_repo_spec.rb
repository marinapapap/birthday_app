require 'convert_month_repo'

describe ConvertMonth do

  it "converts month into int" do
    month = ConvertMonth.new("January")
    expect(month.convert).to eq(1)
  end

end

