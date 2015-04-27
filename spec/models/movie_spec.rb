require 'rails_helper'
require 'enceladus'

RSpec.describe Movie, type: :model do
  context "in its class methods" do
    it "should validate movie names and return true/false in response to a query"
    it "should be able to determine a valid movie title"
  end
  context "in its instance methods" do
    it "should store two arrays of cast members, 5 and 10 members"
    it "should store a reference the movie poster related to the valid query"
    it "should store an array of actor portraits, 5 in total"
    it "should not make any database writes"
    it "should not write anything to disk"
    it "should be ephemeral"
  end

end
