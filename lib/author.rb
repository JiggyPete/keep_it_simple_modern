class Author
	def initialize( inspiration )
		@inspiration = inspiration
	end

	def new_best_seller_from( key_pair )
		return "" if @inspiration.split.length < 3

		phrases = @inspiration.split(key_pair)
		phrases.shift
		phrases.shift Kernel.rand(phrases.length)
		remaining_text = phrases.join(key_pair)
		"#{key_pair}#{remaining_text}"
	end
end