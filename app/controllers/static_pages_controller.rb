class StaticPagesController < ApplicationController
def home
	@user = current_user
    redirect_to user_schedules_path(@user, @schedule) if signed_in?
end

def about
	@user = current_user
end
end