class Author
	def initialize( inspiration )
		@inspiration = inspiration
	end

	def new_best_seller_from( key_pair )
		return "" if @inspiration.split.length < 3
		remaining_text = @inspiration.split(key_pair)[1]
	 	"#{key_pair}#{remaining_text}"
	end
end