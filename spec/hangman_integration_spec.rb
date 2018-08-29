require 'capybara/rspec'
require './app'
Capybara.app = Sinatra::Application
set :show_exceptions, false

describe 'the game path', :type => :feature do
  before :each do
    visit '/'
  end

  it 'starts at a page where the user can enter a word' do
    expect(page).to have_css('form#new-game')
    expect(page).to have_css('input.word')
  end

  it 'sends the user to play the game after submitting a word' do
    fill_in 'word', :with => 'super'
    click_button 'Play'
    expect(page).to have_css('form#guess')
  end

  it 'shows the number of guesses remaining while playing' do
    fill_in 'word', :with => 'super'
    click_button 'Play'
    expect(page).to have_content('Guesses left: 5')
  end
end
