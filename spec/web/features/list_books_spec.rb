require 'features_helper'

describe 'List books' do
  before do
    BookRepository.clear

    BookRepository.create(Book.new(title: 'PoEEA', author: 'Martin Fowler'))
    BookRepository.create(Book.new(title: 'TDD', author: 'Kent Beck'))
  end

  it 'shows a book element for each book' do
    visit '/books'

    expect(page.has_css?('.book', count: 2)).to be(true)
  end
end
