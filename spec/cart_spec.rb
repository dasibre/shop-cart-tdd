require_relative '../lib/cart.rb'
require_relative '../lib/item.rb'


RSpec::Matchers.define :have_total_value do |total|
	match do |cart|
		cart.total_value == total
	end
end

describe "An instance of", Cart do
	before :each do
		@cart = Cart.new
	end
	it "should be properly initialized" do
		expect(@cart).to be_a(Cart)
	end
	context "when new" do
		it "contains no items" do
			expect(@cart).to be_empty
		end

		it "has a total value of $0.0" do
			expect(@cart).to have_total_value(0.0)
		end

		
	end	
	describe "#add_item" do
		it "should add item to cart" do
				expect do
					@cart.add_item_to_cart("item")
				end.to change{@cart.count}.by(1)
		end

		context "when item added" do
			before :each do
				@item = Item.new("shoe", 10.00)
			end
			it "is not empty" do
				@cart.add_item_to_cart(@item)
				expect(@cart).to_not be_empty
			end

			it "has total value of items in cart" do
				@cart.add_item_to_cart(@item)
				expect(@cart).to have_total_value(10.00)
			end

			it "should not change total items in Cart when item quantity is increased" do
				@cart.add_item_to_cart(@item)
				@cart.add_item_to_cart(@item)
				expect(@cart.count).to eq(1)
			end

			
		end
		
	end


end