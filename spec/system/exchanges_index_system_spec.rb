require 'rails_helper'

RSpec.describe "Exchange Currency Process", :type => :system, js:true do
    it "show exchanged value" do
        visit '/'
        within("#exchange_form") do
            select('BRL', from:'source_currency')
            select('USD', from: 'target_currency')
            fill_in 'amount', with: '10'
        end
        click_button 'converter'

        #save_and_open_page
        expect(page).to have_content("value")
        #expect(find_field('result').value).not_to be_nil
    end

end
