class ProfilesController < ApplicationController
  before_action :set_profile, only: [:show, :edit, :update, :destroy]
  #uncomment line below for homepage
  before_action :authenticate_user!
  

  # GET /profiles
  # GET /profiles.json

  #Must make index only available for admin

  def index
    
    #only admins allowed to see profile list
    if current_user.admin?
    @profiles = Profile.all
    
    #reg users redirected away from profile listing back to their profile
    #changed to profile id...not sure yet if correct
    else
    redirect_to profile_path(current_user.profile.id)
  end
  end

  # GET /profiles/1
  # GET /profiles/1.json
  

  def show
    #attempting to only let user see their own profile only - code troubles
    #if current_user.profile.id != Profile.find(params[:id])
    #  root_path
    #end
  end

  # GET /profiles/new
  def new
    @profile = Profile.new
  end

  # GET /profiles/1/edit
  def edit
  end

  # POST /profiles
  # POST /profiles.json
  def create
    
      @profile = Profile.new(profile_params)
        respond_to do |format|
          if @profile.save
          format.html { redirect_to @profile, notice: 'Profile was successfully created.' }
          format.json { render :show, status: :created, location: @profile }
          else
          format.html { render :new }
          format.json { render json: @profile.errors, status: :unprocessable_entity }
          end
      end
    
    
  end

  # PATCH/PUT /profiles/1
  # PATCH/PUT /profiles/1.json
  def update
    respond_to do |format|
      if @profile.update(profile_params)
        format.html { redirect_to @profile, notice: 'Profile was successfully updated.' }
        format.json { render :show, status: :ok, location: @profile }
      else
        format.html { render :edit }
        format.json { render json: @profile.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /profiles/1
  # DELETE /profiles/1.json
  def destroy
    @profile.destroy
    respond_to do |format|
      format.html { redirect_to profiles_url, notice: 'Profile was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_profile
      @profile = Profile.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def profile_params
      params.require(:profile).permit(:first_name, :last_name, :name, :location, :bio, :facebook_profile, :instagram_profile, :mobile_number, :instagram_followers, :facebook_followers, :favorites, :email, :user_id)
    end
end
