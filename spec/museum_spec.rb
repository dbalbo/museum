require('spec_helper')

describe(Museum) do
  describe('#==') do
    it('is the same museum if it has the same name') do
      museum1 = Museum.new({:name => 'The Guggenheim', :id => nil})
      museum2 = Museum.new({:name => 'The Guggenheim', :id => nil})
      expect(museum1).to(eq(museum2))
    end
  end
end
  describe('.all') do
    it('is empty at first') do
      expect(Museum.all).to(eq([]))
    end
  end

  describe('#save') do
    it('lets you save museums to the database') do
      test_museum = Museum.new({:name =>'The Guggenheim', :id => nil})
      test_museum.save()
      expect(Museum.all()).to(eq([test_museum]))
      end
    end


  describe('.find') do
    it('returns a museum by its id') do
      test_museum = Museum.new({:name => "The Guggenheim", :id => nil})
      test_museum.save
      test_museum2 = Museum.new({:name => "The Met", :id => nil})
      test_museum2.save
      expect(Museum.find(test_museum2.id)).to(eq(test_museum2))
    end
  end

  describe('#artworks') do
    it('returns an array of artworks for the museum') do
      test_museum = Museum.new({:name => "The Guggenheim", :id => nil})
      test_museum.save
      test_artwork = Artwork.new({:description => "Sunflowers", :museum_id => test_museum.id})
      test_artwork.save
      test_artwork2 = Artwork.new({:description => "Circles", museum_id => test_museum.id})
      test_artwork2.save
      expect(test_museum.artworks).to(eq([test_artwork, test_artwork2]))
    end
  end

  describe('#update') do
    it('lets you update a museum in the database') do
      museum = Museum.new({:name => "The Guggenheim", :id => nil})
      museum.save
      museum.update({:name => 'The Other Guggenheim'})
      expect(museum.name).to(eq('The Other Guggenheim'))
    end
  end

  describe('#delete') do
    it('lets you delete a museum from the database') do
      museum = Museum.new({:name => "The Guggenheim", :id => nil})
      museum.save
      museum2 = Museum.new(:name => "The Met", :id => nil)
      museum2.save
      museum.delete
      expect(Museum.all).to(eq([]))
    end

    it('deletes a museum\'s artwork from the database') do
      museum = Museum.new(:name => "The Guggenheim", :id => nil)
      museum.save
      artwork = Artwork.new(:description => 'sunflowers', :museum_id => museum.id)
      artwork.save
      artwork2 = Artwork.new(:description => 'circles', :museum_id => museum.id)
      artwork2.save
      museum.delete
      expect(Artwork.all).to(eq([]))
    end
  end
