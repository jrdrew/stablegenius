class NotesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_note, only: [:show, :edit, :update, :destroy]

  # GET /horses/:horse_id/notes
  # GET /horses/:horse_id/notes.json
  # GET /horses/:horse_id/notes.xlsx
  def index
    @horse = Horse.find(params[:horse_id])
    @notes = Note.where(:horse_id => params[:horse_id]).paginate(:page => params[:page], :per_page => 20)
    respond_to do |format|
      format.html
      format.xlsx {
        response.headers['Content-Disposition'] = "attachment; filename=\"#{@horse.name}.xlsx\""
      }
      format.json { render :show, status: :ok, location: @note }
    end
  end

  # GET /notes/1
  # GET /notes/1.json
  def show
  end

  # GET /notes/new
  def new
    @note = Note.new
  end

  # GET /notes/1/edit
  def edit
    @horse = Horse.find(params[:horse_id])
  end

  # POST /notes
  # POST /notes.json
  def create
    @horse = Horse.find(params[:horse_id])
    @note = Note.new(note_params)
    @note.user = current_user
    @note.horse = @horse

    respond_to do |format|
      if @note.save
        format.html { redirect_to @horse, notice: 'Note was successfully created.' }
        format.json { render :show, status: :created, location: @note }
      else
        format.html { render :new }
        format.json { render json: @note.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /notes/1
  # PATCH/PUT /notes/1.json
  def update
    @horse = Horse.find(params[:horse_id])
    respond_to do |format|
      if @note.update(note_params)
        format.html { redirect_to @horse, notice: 'Note was successfully updated.' }
        format.json { render :show, status: :ok, location: @note }
      else
        format.html { render :edit }
        format.json { render json: @note.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /notes/1
  # DELETE /notes/1.json
  def destroy
    @horse = Horse.find(params[:horse_id])
    @note.destroy
    respond_to do |format|
      format.html { redirect_to @horse, notice: 'Note was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_note
      @note = Note.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def note_params
      params.require(:note).permit(:body, :note_type, :user_id, :horse_id)
    end
end
