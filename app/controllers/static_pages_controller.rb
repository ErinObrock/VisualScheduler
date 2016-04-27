class StaticPagesController < ApplicationController
def home
    redirect_to user_schedule_index_url(params[:user_id]) if signed_in?
end

def about
end
end