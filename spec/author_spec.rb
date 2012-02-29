require 'spec_helper'

describe Author do 
	
	it "suffers from writers block when given blank" do 	
		author = Author.new("")
		author.new_best_seller_from("").should == ''
	end

end