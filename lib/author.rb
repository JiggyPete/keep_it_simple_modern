class Author
	def initialize( inspiration )
		@inspiration = inspiration
	end

	def new_best_seller_from( key_pair )
		@inspiration.split.length >= 3 ? @inspiration : ""
	end
end