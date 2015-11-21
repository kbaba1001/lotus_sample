require 'features_helper'

describe 'List books' do
  it 'displays each book on the page' do
    visit '/books'

    within '#books' do
      expect(page.has_css?('.book', count: 2)).to 'Expected to find 2 books'
    end
  end
end
