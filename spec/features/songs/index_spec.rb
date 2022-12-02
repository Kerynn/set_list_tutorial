require 'rails_helper'

RSpec.describe "songs index page", type: :feature do 

# As a user,
# when I visit '/songs'
# I see each song's title and play count

  # describe "As as a user" do 
  #   describe "When I visit /songs" do 
  #     it "I see each song's title and play count" do 
  #       line of user story I should test!
  #     end 
  #   end
  # end 

  it 'shows each of the song titles and play count' do 
    hello = Artist.create!(name: "Hello")
    song_1 = Song.create!(title: "Hello Peril", length: 234, play_count: 34485, artist: hello)
    song_2 = Song.create!(title: "hi yes hello", length: 345, play_count: 2537, artist: hello)

    visit "/songs"

    expect(page).to have_content(song_1.title)
    expect(page).to have_content("Play Count: #{song_1.play_count}")
    expect(page).to have_content(song_2.title)
    expect(page).to have_content("Play Count: #{song_2.play_count}")
  end 

end 