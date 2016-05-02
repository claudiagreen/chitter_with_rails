require 'rails_helper'

feature 'peeps' do

  context 'no peeps have been added' do
    scenario 'should display a prompt to add a peep' do
      visit '/peeps'
      expect(page).to have_content 'No peeps yet'
      expect(page).to have_link 'Write peep'
    end
  end

  context 'peeps have been added' do
    before do
      Peep.create(message: "Hello this is a peep")
    end

    scenario 'display peeps' do
      visit '/peeps'
      expect(page).to have_content("Hello this is a peep")
      expect(page).not_to have_content("No peeps yet")
    end
  end

  context 'creating peeps' do
    scenario 'prompts user to fill out form, then displays new peep' do
      visit '/peeps'
      click_link 'Write peep'
      fill_in 'Message', with: 'Hello this is a peep'
      click_button 'Create Peep'
      expect(page).to have_content 'Hello this is a peep'
      expect(current_path).to eq '/peeps'
    end
  end


end
