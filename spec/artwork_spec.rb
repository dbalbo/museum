require('spec_helper')


describe(Artwork) do
  describe('#==') do
    it('is the same artwork if it has the same description and museum id') do
      artwork1 = Artwork.new({:description => 'Sunflowers', :museum_id => 1})
      artwork2 = Artwork.new({:description => 'Sunflowers', :museum_id => 1})
      expect(artwork1).to(eq(artwork2))
    end
  end

  describe('.all') do
    it('is empty at first') do
      expect(Artwork.all()).to(eq([]))
    end
  end
  describe('#save') do
    it('adds an artwork to the array of saved artworks') do
      test_artwork = Artwork.new({:description => 'Circles', :museum_id => 1})
      test_artwork.save()
      expect(Artwork.all()).to(eq([test_artwork]))
    end
  end

  describe('#museum_id') do
    it('lets you read the museum id out') do
      test_artwork = Artwork.new({:description => 'Circles', :museum_id => 1})
      expect(test_artwork.museum_id()).to(eq(1))
    end
  end

  describe('#description') do
    it('lets you read the description out') do
      test_artwork = Artwork.new({:description => 'Circles', :museum_id => 1})
      expect(test_artwork.description).to(eq('Circles'))
    end
  end

  describe('#update') do
    it('lets you update a artwork in the database') do
      artwork = Artwork.new({:description => "Sunflowers", :id => nil})
      artwork.save
      artwork.update({:description => 'Circles'})
      expect(artwork.name).to(eq('Circles'))
    end

    it('deletes  artwork from the database') do
      museum = Museum.new({:name => 'The Guggenheim', :id => nil})
      museum.save
      artwork = Artwork.new({:description => 'Sunflowers', :museum_id => nil})
      artwork.save
      artwork2 = Artwork.new({:description => 'Circles', :museum_id => nil})
      artwork2.save
      artwork.delete
      expect(Artwork.all).to(eq([]))
    end
  end
end
