feature 'index' do
  scenario 'it should initiliaze with a welcome page' do
    visit('/')
    expect(page).to have_content('Welcome to Chitter')
  end
end

feature 'add peep' do
  scenario 'I want to add a new peep' do
    visit('/')
    fill_in('message', with: 'rspec_test')
    click_button('Submit')
    expect(page).to have_content('rspec_test')
  end
end
