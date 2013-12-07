require_relative '../lib/item.rb'

describe "An instance of", Item do
	before :each do
		@item = Item.new("Shoe", 10.00)
	end
	it "should be properly initialized" do
		expect(@item).to be_a(Item)
	end

	it "has an item price" do
		expect(@item.price).to eq(10.00)
	end
end