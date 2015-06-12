require('spec_helper')



describe(Museum) do
  describe('.all') do
    it('is empty at first') do
      expect(Museum.all).to(eq([]))
    end
  end

  describe("#name") do
    it("tells you its name") do
      museum = Museum.new({:name => "The Guggenheim", :id => nil})
      expect(museum.name()).to(eq("The Guggenheim"))
    end
  end

  # describe('#save') do
  #   it('lets you save museums to the database') do
  #     test_museum = Museum.new({:name => 'The Guggenheim', :id => nil})
  #     test_museum.save()
  #     expect(Museum.all()).to(eq([test_museum]))
  #   end
  # end
  #
  # describe('#save') do
  #   it('lets you save lists to the database') do
  #     test_list = List.new({:name => 'Epicodus stuff', :id => 1})
  #     test_list.save()
  #     expect(List.all()).to(eq([test_list]))
  # describe('#==') do
  #   it('is the same museum if it has the same name') do
  #     museum1 = Museum.new({:name => 'The Guggenheim', :id => nil})
  #     museum2 = Museum.new({:name => 'The Guggenheim', :id => nil})
  #     expect(museum1).to(eq(museum2))
  #   end
  # end
end
