class NotesController < ApplicationController
  def show
    @note = Note.find(params[:id])
  end

  def new
    @note = Note.new
  end

  def create
    @note = Note.create(note_params)
    render :new and return unless @note.valid?

    redirect_to @note
  end

  def index
    @notes = Note.all
  end

  private
  def note_params
    params.require(:note).permit(:title, :content)
  end
end
