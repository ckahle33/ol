require 'test_helper'
require 'csv'

class BusinessTest < ActiveSupport::TestCase

  test "should properly handle error when csv file is not found" do
    import  = Business.import("/not/a/real/path")
    assert_nil import
  end

  test "should properly create records if a csv file is found" do
    CSV.foreach("/var/www/public/ol/test/fixtures/businesses.csv", headers: true) do |row|
      business = Business.create!(row.to_hash)
    end

    assert Business.find(1)
  end
end
