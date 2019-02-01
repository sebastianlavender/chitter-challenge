require 'timecop'

feature 'index' do
  scenario 'it should initiliaze with a welcome page' do
    visit('/')
    expect(page).to have_content('Welcome to Chitter')
  end
end

feature 'add peep' do

  before do
    Timecop.freeze(Time.now)
  end

  after do
    Timecop.return
  end

  scenario 'I want to add a new peep' do
    visit('/')
    fill_in('message', with: 'rspec_test')
    click_button('Submit')
    expect(page).to have_content('rspec_test')
  end

  scenario 'I want the peep to say the time it was created' do
    visit('/')
    fill_in('message', with: 'rspec_test')
    click_button('Submit')
    expect(page).to have_content("#{Time.now.strftime("%F %T")}")
  end
end
