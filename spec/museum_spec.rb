require('spec_helper')



describe(Museum) do
  describe('.all') do
    it('is empty at first') do
      expect(Museum.all).to(eq([]))
    end
  end
end
