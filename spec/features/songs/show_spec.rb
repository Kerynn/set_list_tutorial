require 'rails_helper'

RSpec.describe 'the songs show page' do 
# As a visitor
# When I visit /songs/1 (where 1 is the id of a song in my database)
# Then I see that song's title, and artist
# And I do not see any of the other songs in my database

  it 'displays the song title' do
    artist = Artist.create!(name: "Carly Rae Jepsen")
    song = artist.songs.create!(title: "I Really Like You", length: 208, play_count: 245)
    song_2 = artist.songs.create!(title: "Call Me Maybe", length: 206, play_count: 2678)

    visit "/songs/#{song.id}"
    
    expect(page).to have_content(song.title)
    expect(page).to_not have_content(song_2.title)
  end
  
  describe 'As a user' do 
    describe 'When I visit a song show page' do 
      it 'shows the songs title, length, and play count' do 
        carly = Artist.create!(name: "Carly Rae Jepsen")
        song_1 = Song.create!(title: "I Really Like You", length: 208, play_count: 245, artist: carly)
        song_2 = Song.create!(title: "Call Me Maybe", length: 206, play_count: 2678, artist: carly)

        visit "/songs/#{song_1.id}"

        expect(page).to have_content(song_1.title)
        expect(page).to have_content("Play Count: #{song_1.play_count}")
        expect(page).to have_content("Length: #{song_1.length}")
        expect(page).to_not have_content(song_2.title)
        expect(page).to_not have_content("Play Count: #{song_2.play_count}")
        expect(page).to_not have_content("Length: #{song_2.length}")
      end 
    end 
  end 

  describe 'As a user' do 
    describe 'When I visit a Song show page' do 
      it 'shows a link back to the songs index page' do 
        carly = Artist.create!(name: "Carly Rae Jepsen")
        song_1 = Song.create!(title: "I Really Like You", length: 208, play_count: 245, artist: carly)
        song_2 = Song.create!(title: "Call Me Maybe", length: 206, play_count: 2678, artist: carly)

        visit "/songs/#{song_1.id}"
        # save_and_open_page
        expect(page).to have_link('Return to Songs Index')

        visit "/songs/#{song_2.id}"
        # save_and_open_page
        expect(page).to have_link('Return to Songs Index')
      end 
    end 

    describe 'When I click the return to song index link' do   
      it 'goes to the songs index' do 
        carly = Artist.create!(name: "Carly Rae Jepsen")
        song_1 = Song.create!(title: "I Really Like You", length: 208, play_count: 245, artist: carly)
        song_2 = Song.create!(title: "Call Me Maybe", length: 206, play_count: 2678, artist: carly)

        visit "/songs/#{song_1.id}"
        click_on "Return to Songs Index"
        expect(current_path).to eq('/songs')
      end 
    end 
  end 

  it 'displays the name of the artist for the song' do 
    artist = Artist.create!(name: "Carly Rae Jepsen")
    song = artist.songs.create!(title: "I Really Like You", length: 208, play_count: 245)
    song_2 = artist.songs.create!(title: "Call Me Maybe", length: 206, play_count: 2678)

    visit "/songs/#{song.id}"
    save_and_open_page
    expect(page).to have_content(artist.name)
  end 
end 