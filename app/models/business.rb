require 'csv'

class Business < ActiveRecord::Base
  def self.import(path = "/var/www/public/ol/db/csv/engineering_project_businesses.csv")
    if File.exist?(path)
      CSV.foreach(path, headers: true) do |row|
          # I tried using row.to_hash, but issues arose
          Business.create({
            :uuid => row['uuid'],
            :name => row['name'],
            :address => row['address'],
            :address2 => row['address2'],
            :city => row['city'],
            :state => row['state'],
            :zip => row['zip'],
            :country => row['country'],
            :phone => row['phone'],
            :website => row['website'],
            :created_at => row['created_at']
          })
      end
      elsif
        p "File does not exist."
      end
  end
end
