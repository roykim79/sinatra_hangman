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

  it 'shows the an underscore for each letter in the word in play view' do
    fill_in 'word', :with => 'super'
    click_button 'Play'
    expect(page).to have_content('_____')
  end

  it 'replaces the underscores with correctly guessed letters' do
    fill_in 'word', :with => 'super'
    click_button 'Play'
    fill_in 'letter', :with => 's'
    click_button 'Guess'
    expect(page).to have_content('s____')
  end
end
