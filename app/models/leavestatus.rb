class Leavestatus < ActiveRecord::Base

	self.per_page = 5

	has_many :leaves, dependent: :restrict_with_error
	
	validates :name,:presence => true, :uniqueness =>true

	def self.as_csv
		CSV.generate do |csv|
			csv << column_names
			all.each do |item|
				csv << item.attributes.values_at(*column_names)
			end
		end
	end
end
