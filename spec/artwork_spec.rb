require('spec_helper')


describe(Artwork) do
  describe('#==') do
    it('is the same artwork if it has the same description and artwork_id') do
      test_artwork = Artwork.new({:description => 'sunflowers', :artwork_id => 1})
      test_artwork2 = Artwork.new({:description =>'sunflowers', :artwork_id => 1})
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
      test_artwork = Artwork.new({:description => 'circles', :artwork_id => 1})
      test_artwork.save()
      expect(Artwork.all()).to(eq([test_artwork]))
    end
  end

  describe('#artwork_id') do
    it('lets you read the artwork id out') do
      test_artwork = Artwork.new({:description => 'circles', :artwork_id => 1})
      expect(test_artwork.artwork_id()).to(eq(1))
    end
  end

  describe('#description') do
    it('lets you read the description out') do
      test_artwork = Artwork.new({:description => 'cathartic spleen', :artwork_id => 1})
    end
  end

  describe('#update') do
    it('lets you update a artwork in the database') do
      artwork = Artwork.new({:name => "Sunflowers", :id => nil})
      artwork.save
      artwork.update({:name => 'Circles'})
      expect(artwork.name).to(eq('Circles'))
    end
  end

    it('deletes an artwork from the database') do
      artwork = Artwork.new({:description => 'Sunflowers', :museum_id => museum.id})
      artwork.save
      artwork2 = Artwork.new({:description => 'Circles', :museum_id => museum.id})
      artwork2.save
      artwork.delete
      expect(Artwork.all).to(eq([]))
    end
  end
