require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  before do # beforeブロックを修正
    @user = create(:user)
    @post = create(:post) # 追加
  end

  describe 'GET /posts/new' do
    context 'ログインしていない場合' do
      it 'HTTPステータス302を返す' do
        get '/posts/new'
        expect(response).to have_http_status(:found)
      end

      it 'ログインページにリダイレクトされる' do
        get '/posts/new'
        expect(response).to redirect_to '/users/sign_in'
      end
    end

    context 'ログインしている場合' do
      before { sign_in @user }

      it 'HTTPステータス200を返す' do
        get '/posts/new'
        expect(response).to have_http_status(:ok)
      end

      it 'ログインページにリダイレクトされない' do
        get '/posts/new'
        expect(response).not_to redirect_to '/users/sign_in'
      end
    end
  end

  describe 'GET /posts/:id' do
    context 'ログインしていない場合' do
      it 'HTTPステータス200を返す' do
        get "/posts/#{@post.id}"
        expect(response).to have_http_status nil
      end
    end

    context 'ログインしている場合' do
      it 'HTTPステータス200を返す' do
        sign_in @user
        get "/posts/#{@post.id}"
        expect(response).to have_http_status nil
      end
    end
  end

  describe 'GET /' do
    context 'ログインしていない場合' do
      it 'HTTPステータス200を返す' do
        get '/'
        expect(response).to have_http_status nil
      end
    end

    context 'ログインしている場合' do
      it 'HTTPステータス200を返す' do
        sign_in @user
        get '/'
        expect(response).to have_http_status nil
      end
    end
  end
end
