class Cart
	extend Forwardable
	def_delegators :@items, :empty?, :count

	def initialize
		@items = Hash.new(0)
	end

	def total_value
		total = 0
		each_cart_item(@items) { |item, quantity| total = item.price * quantity }
		total
	end

	def add_item_to_cart(item)
		@items[item] += 1
	end

	private

	def each_cart_item(items)
		items.each_pair  do |item, quantity|
			yield item, quantity
		end
	end

end