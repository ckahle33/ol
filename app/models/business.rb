require 'csv'

class Business < ActiveRecord::Base
  def self.import path
    CSV.foreach(path, headers: true) do |row|
      # puts row['id']
      # id, uuid, name, address, address2, city,
      # state, zip, country, phone, website, created_at = row

      Business.create({
        # :id => id,
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
        :entry_created_at => row['created_at']
      })

    end
  end
end
