
describe "How to create objects which are enumerable" do

  context "does not have an #each method" do
    it "is not a collection"
  end
 
  context "when an #each method has been defined" do
    it "has an each method"
  end
 
  context "includes Enumerable module" do
    it "responds to methods defined in the Enumerable module"
  end
end

