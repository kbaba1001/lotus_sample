require_relative '../../../../apps/web/controllers/books/create'

describe Web::Controllers::Books::Create do
  let(:action) { described_class.new }

  after do
    BookRepository.clear
  end

  describe 'with valid params' do
    let(:params) { {book: {title: 'Confident Ruby', author: 'Avdi Grimm'}} }

    it 'creates a new book' do
      action.call(params)
      expect(action.book.id).not_to be_nil
    end

    it 'redirects the user to the books listing' do
      response = action.call(params)

      expect(response[0]).to eq(302)
      expect(response[1]['Location']).to eq('/books')
    end
  end

  describe 'with invalid params' do
    let(:params) { {book: {}} }

    it 're-renders the books#new view' do
      response = action.call(params)
      expect(response[0]).to eq(200)
    end
  end
end
