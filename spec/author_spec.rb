require 'spec_helper'

describe Author do 

	it "suffers from writers block when given blank" do 	
		author = Author.new("")
		author.new_best_seller_from("").should == ''
	end

	it "suffers from writers block when given 1 word as inspiration" do 	
		author = Author.new("I")
		author.new_best_seller_from("").should == ''
	end

	it "suffers from writers block when given 2 words as inspiration" do 	
		author = Author.new("I wish")
		author.new_best_seller_from("").should == ''
	end



end