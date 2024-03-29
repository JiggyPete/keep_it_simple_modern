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

	it "has just enough inspiration to plagarise the previous best seller" do
		author = Author.new("I wish I")
		author.new_best_seller_from("I wish").should == 'I wish I'		
	end

	it "can plagarise with a lot of inspiration" do
		author = Author.new("I wish I there was a nice set of test stories")
		author.new_best_seller_from("I wish").should == 'I wish I there was a nice set of test stories'		
	end

	it "can inventively plagarise from somewhere other than the start" do
		author = Author.new("I wish I there was a nice set of test stories")
		author.new_best_seller_from("wish I").should == 'wish I there was a nice set of test stories'		
	end

	context "two instances of pair" do

		it "inspiration chooses 'may'" do			
			author = Author.new("wish I may wish I might")			
			Kernel.stub(:rand).and_return(0)
			author.new_best_seller_from("wish I").should == 'wish I may wish I might'				
		end	

		it "inspiration chooses 'might'" do
			author = Author.new("wish I may wish I might")
			Kernel.stub(:rand).with(2).and_return(1)
			author.new_best_seller_from("wish I").should == 'wish I might'
		end			

	end

		context "using a leading key which is not the duplicate" do

			it "forces breaking things down into each word by choosing non duplicate pair" do
				author = Author.new("wish I may wish I might")
				Kernel.stub(:rand).and_return(0, 1)
				author.new_best_seller_from("may wish").should == 'may wish I might'
			end

			it "loops back round to first wish I" do
				author = Author.new("wish I may wish I might")
				Kernel.stub(:rand).and_return(0,0,0,0,1)
				author.new_best_seller_from("may wish").should == 'may wish I may wish I might'
			end			

		end

end