require 'rails_helper'

RSpec.describe 'Homes' do
  before do # ここから追記
    driven_by :selenium_chrome_headless
    driven_by(:rack_test)
  end

  describe 'トップページの検証' do
    it 'Home#top という文字列が表示される' do
      visit '/'

      expect(page).to have_content('Home#top')
    end
  end
end
