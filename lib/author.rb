class Author
	def initialize( inspiration )
		@inspiration = inspiration
	end

	def new_best_seller_from( key_pair )
		best_selling_key = "I wish"
		key_pair == best_selling_key ? @inspiration : ""
	end
end