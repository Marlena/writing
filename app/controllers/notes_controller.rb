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

  def destroy
    @note = Note.find(params[:id])
    @note.destroy
    redirect_to notes_path
  end

  def edit
    @note = Note.find(params[:id])
  end

  def update
    @note = Note.find(params[:id])
    @note.update_attributes(note_params)
    redirect_to notes_path
  end

  private
  def note_params
    params.require(:note).permit(:title, :content)
  end
end
