class SchedulesController  < ApplicationController
  before_action :set_schedule, only: [:show, :edit, :update, :destroy]
  before_action :signed_in_user
  before_action :verify_correct_user, only: [:show, :edit, :update, :destroy]
  # GET /schedules
  # GET /schedules.json
  def index
    @user = User.find(params[:user_id])
    @schedules = current_user.schedules
  end

  # GET /schedules/1
  # GET /schedules/1.json
  def show
    @user = User.find(params[:user_id])
    @schedule = Schedule.find(params[:id])
  end

  # GET /schedules/new
  def new
    @user = User.find(params[:user_id])
    @schedule = Schedule.new
  end

  # GET /schedules/1/edit
  def edit
    @user = User.find(params[:user_id])
    @schedule = Schedule.find(params[:id])
  end

  # POST /schedules
  # POST /schedules.json
  def create
    @schedule = Schedule.new(schedule_params)
    @schedule.user = current_user
    @user = current_user

    respond_to do |format|
      if @schedule.save
        format.html { redirect_to user_schedule_path(@user, @schedule), notice: 'Schedule was successfully created.' }
        format.json { render :show, status: :created, location: @schedule }
      else
        format.html { render :new }
        format.json { render json: @schedule.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /schedules/1
  # PATCH/PUT /schedules/1.json
  def update
    @user = User.find(params[:user_id])
    @schedule = Schedule.find_by(id: (params[:id]))


    respond_to do |format|
      if @schedule.update(schedule_params)
        format.html { redirect_to user_schedules_path, notice: 'Schedule was successfully updated.' }
        format.json { render :show, status: :ok, location: @schedule }
      else
        format.html { render :edit }
        format.json { render json: @schedule.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /schedules/1
  # DELETE /schedules/1.json
  def destroy
    user = User.find(params[:user_id])
    @schedule = Schedule.find(params[:id])
    @schedule.destroy!

    respond_to do |format|
      format.html { redirect_to user_schedules_path, notice: 'Schedule was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def toggle_completed

  @schedule.completed = !@schedule.completed
  respond_to do |format|
    if @schedule.save
      format.html { redirect_to user_schedules_path(@user) }
      format.json { render :show, status: :ok, location: @todo }
    else
      # show some error message
    end
  end
end


  private
    # Use callbacks to share common setup or constraints between actions.

     def verify_correct_user
    @schedule = current_user.schedules.find_by(id: params[:id])
    redirect_to root_url, notice: 'Access Denied!' if @schedule.nil?
    end

    def set_schedule
      @schedule = Schedule.find(params[:id])
    end

     #Never trust parameters from the scary internet, only allow the white list through.
    def schedule_params
      params.require(:schedule).permit(:title, :id, :photo_url)
    end
end
