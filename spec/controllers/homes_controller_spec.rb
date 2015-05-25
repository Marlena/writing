require 'rails_helper'

describe HomesController, type: :controller do
  describe '#show' do
    it 'works' do
      get :show
      expect(response).to be_success
    end
  end
end
