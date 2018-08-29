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

  it 'reduces the guesses left by 1 with an incorrect guess' do
    fill_in 'word', :with => 'super'
    click_button 'Play'
    fill_in 'letter', :with => 'a'
    click_button 'Guess'
    expect(page).to have_content('Guesses left: 4')
  end

  it 'congratulates user when fully guessing the word' do
    fill_in 'word', :with => 'super'
    click_button 'Play'
    fill_in 'letter', :with => 's'
    click_button 'Guess'
    fill_in 'letter', :with => 'u'
    click_button 'Guess'
    fill_in 'letter', :with => 'p'
    click_button 'Guess'
    fill_in 'letter', :with => 'e'
    click_button 'Guess'
    fill_in 'letter', :with => 'r'
    click_button 'Guess'
    expect(page).to have_content('Congratulations')
  end

  it 'shows a failure page when the user runs out of guesses before solving word' do
    fill_in 'word', :with => 'super'
    click_button 'Play'
    fill_in 'letter', :with => 'a'
    click_button 'Guess'
    fill_in 'letter', :with => 'b'
    click_button 'Guess'
    fill_in 'letter', :with => 'c'
    click_button 'Guess'
    fill_in 'letter', :with => 'd'
    click_button 'Guess'
    fill_in 'letter', :with => 'f'
    click_button 'Guess'
    expect(page).to have_content('You have failed')
  end

end
