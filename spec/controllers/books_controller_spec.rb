# spec/controllers/books_controller_spec.rb
require 'rails_helper'

RSpec.describe BooksController, type: :controller do
  describe '投稿のテスト' do
    let(:book) { create(:book) }  # FactoryBotを使用する場合

    describe 'トップ画面(root_path)のテスト' do
      before do
        get :index
      end
      it 'リクエストは200 OKとなること' do
        expect(response.status).to eq 200
      end
    end

    describe '投稿処理のテスト' do
      context '投稿が成功する場合' do
        it '投稿が保存される' do
          expect do
            post :create, params: { book: { title: '新しい本', body: '感想です' } }
          end.to change(Book, :count).by(1)
        end
      end

      context '投稿が失敗する場合' do
        it 'titleが空欄で保存されない' do
          expect do
            post :create, params: { book: { title: '', body: '感想です' } }
            
          end.to_not change(Book, :count)
        end
      end
    end
  end
end