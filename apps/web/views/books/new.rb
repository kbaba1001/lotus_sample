module Web::Views::Books
  class New
    include Web::View

    def form
      form_for :book, routes.books_path do
        div class: 'input' do
          label :title
          text_field :title
        end
        div class: 'input' do
          label :author
          text_field :author
        end
        div class: 'controls' do
          submit 'Create'
        end
      end
    end
  end
end
