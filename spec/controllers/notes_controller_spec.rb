require 'rails_helper'

RSpec.describe NotesController, type: :controller do
  describe '#show' do
    let(:note) {
      Note.create! title: 'some title'
    }

    before do
      get :show, id: note.id
    end

    it 'works' do
      expect(response).to be_success
    end

    it 'shows the note' do
      n = assigns[:note]
      expect(n).to be_present
      expect(n).to be_a(Note)
      expect(n).to eq(note)
    end
  end

  describe '#new' do
    before do
      get :new
    end

    it 'works' do
      expect(response).to be_success
    end

    it 'builds a note' do
      note = assigns[:note]
      expect(note).to be_present
      expect(note).to be_a(Note)
      expect(note).to be_new_record
    end
  end

  describe '#create' do
    describe 'when the note is not valid' do
      before do
        post :create, note: {content: 'some content'}
      end

      it 'assigns the new note' do
        expect(assigns[:note]).to be_new_record
      end
\
      it 'renders the new template' do
        expect(controller).to have_rendered :new
      end

    end

    describe 'when the note is valid' do
      before do
        post :create, note: {title:"my new note", content: 'whatever'}
      end
      it 'redirects to show' do
        expect(response).to redirect_to assigns[:note]
      end
    end
  end

  describe '#index' do
    let!(:first_note){
      Note.create! title: 'first note'
    }
    let!(:second_note){
      Note.create! title: 'second note'
    }

    before do
      get :index
    end

    it 'works' do
      expect(response).to be_success
    end

    it 'builds a list of notes' do
      n = assigns[:notes]
      expect(n).to eq([first_note, second_note])
    end
  end
end
