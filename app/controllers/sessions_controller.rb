class SessionsController < ApplicationController

    def new
        @user = User.new
    end

    def create
        @user = User.find_by(email: params[:user][:email])
        if @user && authenticate(password: params[:user][:password])
        # logging in
            sessions[:user_id] = @user.id
            redirect_to user_path(@user) # show page
        else
            render :new
        end
    end

    #responsible for creating a new session/logging in user
    
end
