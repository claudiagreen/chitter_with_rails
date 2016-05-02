require 'rails_helper'

feature 'peeps' do

  context 'no peeps have been added' do
    scenario 'should display a prompt to add a peep' do
      visit '/peeps'
      expect(page).to have_content 'No peeps yet'
      expect(page).to have_link 'Add a peep'
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
end
