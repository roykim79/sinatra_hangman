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
end
