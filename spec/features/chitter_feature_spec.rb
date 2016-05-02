require 'rails_helper'

feature 'peeps' do
  context 'no peeps have been added' do
    scenario 'should display a prompt to add a peep' do
      visit '/peeps'
      expect(page).to have_content 'No peeps yet'
      expect(page).to have_link 'Add a peep'
    end
  end
end
