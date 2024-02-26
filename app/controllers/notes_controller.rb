# app/controllers/notes_controller.rb
class NotesController < ApplicationController
  before_action :set_note, only: [:show, :update, :destroy]

  # GET /notes
  def index
    @notes = Note.all
    render json: @notes
  end

  # POST /notes
  def create
    @note = Note.new(note_params)
    tag_names = params[:tag_names]

    if tag_names.present?
      tags = tag_names.map do |tag_name|
        Tag.find_or_create_by(name: tag_name)
      end
      @note.tags << tags
    end

    if @note.save
      render json: @note, status: :created, location: @note
    else
      render json: @note.errors, status: :unprocessable_entity
    end
  end

  # GET /notes/:id
  def show
    render json: @note
  end

  # PUT /notes/:id
  def update
    if @note.update(note_params)
      render json: @note
    else
      render json: @note.errors, status: :unprocessable_entity
    end
  end

  # DELETE /notes/:id
  def destroy
    @note.destroy
  end

  private
    def set_note
      @note = Note.find(params[:id])
    end

    def note_params
      params.require(:note).permit(:title, :content)
    end
end
