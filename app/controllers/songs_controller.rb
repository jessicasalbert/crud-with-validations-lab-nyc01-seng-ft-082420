class SongsController < ApplicationController
    before_action :find_song, only: [:show, :update, :edit, :destroy]

    def show
    end

    def index
        @songs = Song.all
    end

    def new
        @song = Song.new
    end

    def create
        @song = Song.create(song_params)
        if params[:song][:released] == "1"
            @song.released = true
        else
            @song.released = false
        end
        @song.save
        if @song.valid?
            redirect_to song_path(@song)
        else
            flash[:errors] = @song.errors.full_messages
            render :new
            # redirect_to new_song_path
        end
        #byebug
        
    end

    def update
        #byebug
        @song.update(song_params)
        if params[:song][:released] == "1"
            @song.released = true
        else
            @song.released = false
        end
        @song.save
        if @song.valid?
            redirect_to song_path(@song)
        else
            flash[:errors] = @song.errors.full_messages
            render :edit
            # redirect_to edit_song_path
        end
    end

    def edit
    end

    def destroy
        @song.destroy
        redirect_to songs_path
    end



    private
    def find_song
        @song = Song.find(params[:id])
    end

    def song_params
        params.require(:song).permit(:title, :artist_name, :release_year, :genre)
    end

end
