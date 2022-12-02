require 'rails_helper'

RSpec.describe "artist show page", type: :feature do 

  describe 'As a user' do 
    describe 'When I visit an Artists show page' do 
      it 'shows the artist name' do 
        prince = Artist.create!(name: 'Prince')
        carly = Artist.create!(name: 'Carly')
        purple = prince.songs.create!(title: 'Purple Rain', length: 845, play_count: 7737)
        beret = prince.songs.create!(title: 'Raspberry Beret', length: 664, play_count: 7362)
        other_song = prince.songs.create!(title: 'Another Prince Song', length: 1, play_count: 7362)

        visit "/artists/#{prince.id}"

        expect(page).to have_content(prince.name)
        expect(page).to_not have_content(carly.name)
      end 

      it 'shows the Artists average song length' do 
        prince = Artist.create!(name: 'Prince')
        carly = Artist.create!(name: 'Carly')
        purple = prince.songs.create!(title: 'Purple Rain', length: 845, play_count: 7737)
        beret = prince.songs.create!(title: 'Raspberry Beret', length: 664, play_count: 7362)
        other_song = prince.songs.create!(title: 'Another Prince Song', length: 1, play_count: 7362)

        visit "/artists/#{prince.id}"

        expect(page).to have_content(prince.name)
        expect(page).to_not have_content(carly.name)
        expect(page).to have_content("Average Song Length: #{prince.average_song_length}")
      end 

      it 'shows the Artists total song count' do 
        prince = Artist.create!(name: 'Prince')
        carly = Artist.create!(name: 'Carly')
        purple = prince.songs.create!(title: 'Purple Rain', length: 845, play_count: 7737)
        beret = prince.songs.create!(title: 'Raspberry Beret', length: 664, play_count: 7362)
        other_song = prince.songs.create!(title: 'Another Prince Song', length: 1, play_count: 7362)

        visit "/artists/#{prince.id}"

        expect(page).to have_content(prince.name)
        expect(page).to_not have_content(carly.name)
        expect(page).to have_content("Total Song Count: #{prince.song_count}")
      end 
    end 
  end 
end 