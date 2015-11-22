require 'features_helper'

describe 'Books' do
  after do
    BookRepository.clear
  end

  it 'can create a new book' do
    visit '/books/new'

    within 'form#book-form' do
      fill_in 'Title', with: 'New book'
      fill_in 'Author', with: 'Some author'

      click_button 'Create'
    end

    # form によって作成されたデータが一覧で表示されることを確認
    expect(current_path).to eq('/books')
    expect(page.has_content?('New book')).to eq(true)
  end
end
