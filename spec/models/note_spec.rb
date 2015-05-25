require 'rails_helper'

RSpec.describe Note, type: :model do
  subject { Note.new title: 'my note title', content: 'some note content' }
  it 'validates the presence of a title' do
    expect(subject).to be_valid
    subject.title = nil
    expect(subject).to_not be_valid
  end
end
